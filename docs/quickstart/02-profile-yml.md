# Configuring `profile.yml`

The `profiles.yml` file contains connection details for the data warehouse you
are operating against. When run, dbt will look in the `dbt_project.yml` for the
`profile` name and then find that profile identified in a `profile.yml` file.

DBT looks for the `profile.yml` file in multiple places but the two key places
to mention are the current directory where the `dbt` command is invoked and
then in `~/.dbt/`. The `profile.yml` inside the dbt project repository is used
for service accounts to run dbt models automatically. You will be modifying
the `profiles.yml` in `~/.dbt/`.

The dbt docs discusses the general purpose of `profiles.yml` files
[here](https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml)
and their structure, general contents, and usage [here](https://docs.getdbt.com/docs/core/connect-data-platform/connection-profiles#about-the-profilesyml-file).

D3B's data warehouse is a PostgreSQL database. The detailed contents and
options for what can be in the profile configuration for postgres databases
is found [here](https://docs.getdbt.com/docs/core/connect-data-platform/postgres-setup).

## Credentials

You will need to request credentials to access the D3B warehouse if you do not
already have those credentials.

Once you obtain those credentials, you can test if you can reach the warehouse
with `pg_isready`:

```sh
pg_isready -d postgres -h d3b-warehouse-aurora.cluster-cxxdzxepyea2.us-east-1.rds.amazonaws.com
# If you can reach the database, this will return:
# {db_hostname:5432} - accepting connections
# If you can NOT reach the database:
# {db_hostname:5432} - no response
```

Then, once you know you can reach the database, you can attempt to connect
with:

```sh
psql postresql://{USERNAME]:{PASSWORD}@d3b-warehouse-aurora.cluster-cxxdzxepyea2.us-east-1.rds.amazonaws.com/postgres
# if successfull, you will be presented with the `psql` program, connected to
# the database. If you'd like, you can attempt to write and execute some
# queries here. Once you're ready type `\q` to exit.
```

When running dbt models in different schema within the warehouse, you may
encounter permission issues. Be patient and work with the warehouse admins
to provision you access needed to develop models in the warehouse 🙂

## Configuring `profiles.yml`

### Creating a profiles.yml

If this is your first time using dbt, you likely will not have a `~/.dbt`
directory populated with a `profiles.yml` file. To create the directory and
file, run from the clones template repository directory:

```sh
mkdir ~/.dbt
cp profiles-example.yml ~/.dbt/profiles.yml
```

### Handling your database credentials

There are a few ways to manage your database credentials with dbt. The
preferred method of handling these credentials is saving them as environment
variables.

#### Saving credentials as environment variables

If you open [`profiles-example.yml`](../../profiles-example.yml), you will see
that the user and password fields load an environment variable with
`env_var(variable_name)`. dbt allows users to load environment variables in
these profile configuration files.

To use environment variables with dbt, in your preferred text editor, open the
copied file, `~/.dbt/profiles.yml`. Ensure that the user and password
environment variable names match the ones you have loaded in your environment,
(e.g. if you have environment variable named `D3B_WAREHOUSE_USERNAME` and
`D3B_WAREHOUSE_PASSWORD`, make sure that you alter the profiles.yml file to
load those environment variables.).

#### Writing credentials into profile.yml

You may write your database creds directly into your `profiles.yml` file. Make
sure to not check this file into version control!

If you open the copied profiles.yml file,`~/.dbt/profiles.yml`, you can replace
the `env_var()` reading function with your database credentials in plain text:

```yml
# replace the following
user: "{{ env_var('DB_USERNAME') }}"
password: "{{ env_var('DB_PASSWORD') }}"
# with:
user: my_username
password: my_password
```

### Update the schema name

Open the copied profiles.yml file,`~/.dbt/profiles.yml` and modify the schema
name such that it is your database username followed by `_dev_schema`. If your
username were "doej3", your schema name would be set:

```yml
schema: doej3_dev_schema
```

## Test your connection

Now that the profile is configured, you can test that dbt can connect to the
database. Run the `dbt debug` and inspect its output. When you run this
command, it should generally match the output described below. More information
about `dbt debug` may be found in the [dbt documentation](https://docs.getdbt.com/reference/commands/debug).
If you have any connection issues, troubleshoot those and then re-test your
connection. See [above](#credentials) for some alternative ways to test your
database connection.

<!-- markdownlint-disable line_length -->

```sh
dbt debug —-profiles-dir $HOME/.dbt
# Sample output below:
# 16:06:27  Running with dbt=1.7.13
# 16:06:27  dbt version: 1.7.13
# 16:06:27  python version: 3.12.5
# 16:06:27  python path: /Users/doej3/.local/pipx/venvs/dbt-postgres/bin/python
# 16:06:27  os info: macOS-14.6.1-arm64-arm-64bit
# 16:06:27  Using profiles dir at /Users/doej3/.dbt
# 16:06:27  Using profiles.yml file at /Users/doej3/.dbt/profiles.yml
# 16:06:27  Using dbt_project.yml file at /Users/doej3/Documents/d3b-dbt-template/dbt_project.yml
# 16:06:27  adapter type: postgres
# 16:06:27  adapter version: 1.7.13
# 16:06:27  Configuration:
# 16:06:27    profiles.yml file [OK found and valid]
# 16:06:27    dbt_project.yml file [OK found and valid]
# 16:06:27  Required dependencies:
# 16:06:27   - git [OK found]

# 16:06:27  Connection:
# 16:06:27    host: d3b-warehouse-aurora-prd.d3b.io
# 16:06:27    port: 5432
# 16:06:27    user: doej3
# 16:06:27    database: postgres
# 16:06:27    schema: doej3_dev_schema
# 16:06:27    connect_timeout: 10
# 16:06:27    role: None
# 16:06:27    search_path: None
# 16:06:27    keepalives_idle: 0
# 16:06:27    sslmode: None
# 16:06:27    sslcert: None
# 16:06:27    sslkey: None
# 16:06:27    sslrootcert: None
# 16:06:27    application_name: dbt
# 16:06:27    retries: 1
# 16:06:27  Registered adapter: postgres=1.7.13
# 16:06:28    Connection test: [OK connection ok]

# 16:06:28  All checks passed!
```

<!-- markdownlint-enable line_length -->

## Final thoughts

In this part of the quickstart tutorial, you have tested your database
credentials, configured your `profiles.yml` file in the `.dbt` folder in your
`$HOME` directory, and tested that dbt can connect to the D3B warehouse. In
the [next tutorial](./03-your-first-run.md), you will run the example models
into the warehouse.
