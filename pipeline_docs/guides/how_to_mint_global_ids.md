# How to Mint Global Identifiers in Airflow

This guide explains how to mint global identifiers with the Airflow DAG
`global_id_minting`.

The DAG performs two steps:

1. exports all rows from a source warehouse table to a temporary CSV file
2. runs `d3b-dewrangle global-id-mint` against that CSV and loads the minted
   IDs into a target warehouse table

Global ID's are generally minted at some point in harmonization of a study at
the discretion of the harmonizer.

## Before you start

Make sure all of the following are true before triggering the DAG:

1. You can access the hosted Airflow instance. If not, complete the setup in
   [connect-to-airflow.md](/Users/friedmanc1/Documents/include-dbt-sandbox/pipeline_docs/guides/connect-to-airflow.md).
2. The DAG `global_id_minting` is available in Airflow.
3. Your source table already exists in the warehouse.
4. You know which warehouse schema and table should receive the minted global
   IDs.
5. Your source table columns match the descriptor format expected by
   `d3b-dewrangle global-id-mint`. Specifically, the columns required are
   `fhirResourceType`, `descriptor`, and `descriptorState`. To mint IDs within
   a specific study, the column `studyGlobalId` is also required.

## What the DAG does

When you trigger the DAG, Airflow:

1. Reads every column and row from
   `{descriptor_schema_name}.{descriptor_table_name}`.
2. Writes the result to a temporary file in `/tmp` on the worker.
3. Runs:

```bash
d3b-dewrangle global-id-mint \
  --env <qa|prod> \
  --db dcc \
  --organization_id <dewrangle organization id> \
  --manifest /tmp/<descriptor_schema>_<descriptor_table>_export.csv
```

1. Loads the minted identifiers into the target table named by
   `globalid_schema_name` and `globalid_table_name`.

## Parameters to provide

Trigger the DAG with the following parameters.

### `descriptor_schema_name`

The schema that contains the descriptor table to export.

Example:

```json
"descriptor_schema_name": "public"
```

### `descriptor_table_name`

The table that contains the descriptors that need global identifiers.

Example:

```json
"descriptor_table_name": "study_subject_descriptors"
```

### `globalid_schema_name`

The schema where the minted identifier table should be written.

Example:

```json
"globalid_schema_name": "access"
```

### `globalid_table_name`

The destination table name for minted identifiers.

Example:

```json
"globalid_table_name": "subject_global_ids"
```

### `env`

The runtime environment passed to `d3b-dewrangle`.

Allowed values:

1. `qa`
2. `prod`

Example:

```json
"env": "qa"
```

### `dewrangle_organization_id`

The dewrangle organization identifier used for minting.

The DAG currently exposes these labeled options in Airflow:

1. `dff dev`
2. `Kids First DRC`
3. `INCLUDE DCC`

Choose the organization that should own the minted identifiers. Note that these
options are human-readable pointers to the organization ID that dewrangle uses.

## Triggering the DAG

1. Open the hosted Airflow UI.
2. Search for the DAG `global_id_minting`.
3. Open the DAG details page.
4. Click `Trigger DAG`.
5. Replace the default parameters with your run configuration.
6. Start the run.

Example parameter payload:

```json
{
  "descriptor_schema_name": "public",
  "descriptor_table_name": "study_subject_descriptors",
  "globalid_schema_name": "access",
  "globalid_table_name": "subject_global_ids",
  "env": "qa",
  "dewrangle_organization_id": "T3JnYW5pemF0aW9uOmNtZjJ3bzlrdDAwMG9rMTAxcHd4cHFmMWQ="
}
```

## How to monitor the run

The DAG has two tasks:

1. `read_and_export`
2. `mint_ids`

Use task logs to diagnose failures.

### If `read_and_export` fails

Check for:

1. an incorrect `descriptor_schema_name`
2. an incorrect `descriptor_table_name`
3. missing warehouse permissions
4. descriptor data that cannot be exported cleanly

### If `mint_ids` fails

Check for:

1. an invalid `dewrangle_organization_id`
2. a mismatch between your descriptor CSV columns and what
   `d3b-dewrangle global-id-mint` expects
3. a target schema or table name that should not be used for the selected run
4. downstream dewrangle or warehouse connectivity issues

## Verifying results

After the DAG succeeds:

1. query the target table `{globalid_schema_name}.{globalid_table_name}`
2. confirm the expected number of rows were written
3. validate that the minted global identifiers match the descriptors you
   supplied

## Operational notes

The current DAG implementation has a few important behaviors to keep in mind:

1. The source export uses `SELECT *`, so the full source table is exported.
2. The exported CSV is written to a temporary file on the Airflow worker.
3. The DAG reads warehouse credentials from the Airflow connection
   `postgres_dev_svc`.
4. The `env` parameter changes the dewrangle CLI flag, but the DAG code still
   sources its warehouse connection details from the same Airflow connection.

If you need production minting behavior that differs from the current DAG
implementation, review the DAG configuration before running it with `env` set
to `prod`.
