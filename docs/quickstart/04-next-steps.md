# Next steps after running the quick start

Now that you have run some models into the warehouse, some common tasks will
be discussed.

## Load seeds into the warehouse

Seeds are csv files, checked into version control, that contain static data
that changes infrequently. These are often things like mapping files. It's an
antipattern to use seeds to load production or raw data into a warehouse.

A longer and more comprehensive discussion about seeds in the dbt docs is
[here](https://docs.getdbt.com/docs/build/seeds).

### Loading a seed

The location of seeds is determined by `seed-paths` in `dbt_project.yml`. We
keep the default of putting seeds in the directory `seeds`. In the template
repository, there is one seed file, `alphabet_grouping.csv` that maps different
letters to different groups.

To load the seeds into the warehouse, run the `dbt seed` command:

<!-- markdownlint-disable line_length -->

```sh
dbt seed —-profiles-dir $HOME/.dbt
# 19:22:08  Running with dbt=1.8.6
# 19:22:09  Registered adapter: postgres=1.8.2
# 19:22:09  Found 2 models, 1 seed, 2 operations, 4 data tests, 822 macros
# 19:22:09
# 19:22:10  Concurrency: 4 threads (target='dev')
# 19:22:10
# 19:22:10  1 of 1 START seed file doej3_dev_schema_import.alphabet_grouping .......... [RUN]
# 19:22:11  1 of 1 OK loaded seed file doej3_dev_schema_import.alphabet_grouping ...... [INSERT 26 in 0.51s]
# 19:22:11
# 19:22:11  Running 2 on-run-end hooks
# 19:22:11  1 of 2 START hook: d3b_template_dbt_project.on-run-end.0 ....................... [RUN]
# 19:22:11  1 of 2 OK hook: d3b_template_dbt_project.on-run-end.0 .......................... [GRANT in 0.03s]
# 19:22:11  2 of 2 START hook: d3b_template_dbt_project.on-run-end.1 ....................... [RUN]
# 19:22:11  2 of 2 OK hook: d3b_template_dbt_project.on-run-end.1 .......................... [GRANT in 0.04s]
# 19:22:11
# 19:22:11
# 19:22:11  Finished running 1 seed, 2 project hooks in 0 hours 0 minutes and 2.32 seconds (2.32s).
# 19:22:11
# 19:22:11  Completed successfully
# 19:22:11
# 19:22:11  Done. PASS=1 WARN=0 ERROR=0 SKIP=0 TOTAL=1
```

<!-- markdownlint-enable line_length -->

At this point, if you inspect the d3b warehouse, you should see that a new
schema now exists, `[your_username]_dev_schema_import`, (NOTE: this schema is
different from the one created in the
[03-your-first-run.md](./03-your-first-run.md#running-the-template-project))
with a single table in it.

### Using the seed

Now that there is seeded data, in can be used in models using the `ref()`
jinja function.

In the `models` directory, create a model:

```sh
touch ./models/alphabet_counts.sql
```

In that model, you can use the sql below to manipulate the data in that seed:

```sql
SELECT letter_grouping, count(*)
FROM {{ ref('alphabet_grouping') }}
GROUP BY letter_grouping
```

After adding code to the model, execute `dbt run`, inspect the output, and
inspect the `[your_username]_dev_schema` schema in the warehouse to see a new
view, `alphabet_counts`.

<!-- markdownlint-disable line_length -->

```sh
dbt run —-profiles-dir $HOME/.dbt
# 19:34:27  Running with dbt=1.8.6
# 19:34:27  Registered adapter: postgres=1.8.2
# 19:34:27  Found 3 models, 1 seed, 2 operations, 4 data tests, 822 macros
# 19:34:27
# 19:34:29  Concurrency: 4 threads (target='dev')
# 19:34:29
# 19:34:29  1 of 3 START sql view model doej3_dev_schema.alphabet_counts .............. [RUN]
# 19:34:29  2 of 3 START sql table model doej3_dev_schema.my_first_dbt_model .......... [RUN]
# 19:34:29  1 of 3 OK created sql view model doej3_dev_schema.alphabet_counts ......... [CREATE VIEW in 0.54s]
# 19:34:29  2 of 3 OK created sql table model doej3_dev_schema.my_first_dbt_model ..... [SELECT 2 in 0.57s]
# 19:34:29  3 of 3 START sql view model doej3_dev_schema.my_second_dbt_model .......... [RUN]
# 19:34:30  3 of 3 OK created sql view model doej3_dev_schema.my_second_dbt_model ..... [CREATE VIEW in 0.47s]
# 19:34:30
# 19:34:30  Running 2 on-run-end hooks
# 19:34:30  1 of 2 START hook: d3b_template_dbt_project.on-run-end.0 ....................... [RUN]
# 19:34:30  1 of 2 OK hook: d3b_template_dbt_project.on-run-end.0 .......................... [GRANT in 0.04s]
# 19:34:30  2 of 2 START hook: d3b_template_dbt_project.on-run-end.1 ....................... [RUN]
# 19:34:30  2 of 2 OK hook: d3b_template_dbt_project.on-run-end.1 .......................... [GRANT in 0.05s]
# 19:34:30
# 19:34:30
# 19:34:30  Finished running 2 view models, 1 table model, 2 project hooks in 0 hours 0 minutes and 2.82 seconds (2.82s).
# 19:34:30
# 19:34:30  Completed successfully
# 19:34:30
# 19:34:30  Done. PASS=3 WARN=0 ERROR=0 SKIP=0 TOTAL=3
```

<!-- markdownlint-enable line_length -->

## Tables and Views

In the [last section](./03-your-first-run.md), one of the models,
`my_second_dbt_model` found its way into the target schema as a view. This
setting was set in the `dbt_project.yml` with the `+materialized` option:

```yml
d3b_template_dbt_project:
  # Config indicated by + and applies to all files under models/example/
  example:
    +materialized: view
```

This setting may be overrided in the model sql itself by setting the config
`materialized` property at the top of the model file. Open the file
`models/example/my_second_dbt_model.sql` and add the following to the top of
it:

```jinja
{{ config(materialized='table') }}
```

Now, rerun with `dbt_run` and the model should now be deployed as a table in
your dev schema.

## Lint your models

Linting code is important so that the code that interacts with the warehouse
follows the same set of standards. We use `sqlfluff` to lint sql used in dbt
models. To lint the dbt models, run:

```sh
sqlfluff lint models
==== sqlfluff ====
sqlfluff:                3.1.1 python:                 3.12.4
implementation:        cpython verbosity:                   1
dialect:              postgres templater:                 dbt
dbt:                    =1.8.6
rules:                                all
==== readout ====

=== [dbt templater] Sorting Nodes...
=== [dbt templater] Compiling dbt project...
=== [dbt templater] Project Compiled.
== [models/example/my_first_dbt_model.sql] FAIL
L:   1 | P:   1 | LT13 | Files must not begin with newlines or whitespace.
                       | [layout.start_of_file]
L:  14 | P:   1 | LT02 | Expected indent of 2 spaces. [layout.indent]
L:  15 | P:   1 | LT02 | Expected indent of 2 spaces. [layout.indent]
L:  16 | P:   1 | LT02 | Expected indent of 2 spaces. [layout.indent]
== [models/example/my_second_dbt_model.sql] FAIL
L:   1 | P:   1 | LT13 | Files must not begin with newlines or whitespace.
                       | [layout.start_of_file]
==== summary ====
violations:        5 status:         FAIL
All Finished 📜 🎉!
```

Errors were found linting these models, Now that these issues were found, you
can fix them and then your code should be ready for a pull request to
eventually run tthe models!

## Final thoughts

This concludes the quick start tutorial.. In this section, you have seeded a
dbt project, used that seed, used a jinja `ref()` function, configured model
materialization, and linted some models.
