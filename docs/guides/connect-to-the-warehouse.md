# How to connect to the INCLUDE postgres data warehouse

This guide documents how to connect to the include postgres data warehouse.

## First Time Setup

For first time setup, see the instructions [here](./connect-to-hosted-infrastructure.md)
If you already completed this setup to connect to some other infrastructure in
the INCLUDE AWS account, such as Airflow, you do not need to complete
the first time setup again.

## Connecting to the warehouse

1. run the command `saml2aws login`. When using this tool, you will want to connect create a
profile for the AWS account `373997854230`.
2. Navigate to the `ssm_forward_to_db` directory within the `devops_utils`
repository you cloned on to your machine.
3. Run the script `./connect.sh <Environment> <Port> <DB Hostname> <Region>`
where the environment is either `dev` or `prd`, the port is the default
PostgreSQL port, `5432`, the db hostname is the one provided to you at the end
of the pre-requisites above, and the region is `us-east-1`. This script should
should that you can now connect a database client
4. Open your database client of choice (e.g., `psql`, pgadmin, etc) and
connect to `localhost:<Port>` using the database credentials provided to you
after completing the pre-requisites above.
