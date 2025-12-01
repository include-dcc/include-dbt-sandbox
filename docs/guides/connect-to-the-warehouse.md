# How to connect to the INCLUDE postgres data warehouse

This guide documents how to connect to the include postgres data warehouse.

## First Time Setup

### Pre-requisites: Security, Complianze, and Permissions

Before connecting to the INCLUDE data warehouse, you must perform a couple of
actions to get an acount with permissions in the INCLUDE data warehouse.

First, you must request that your aws account have access to the INCLUDE AWS
account. At this time, this access is controlled by the D3B center's Devops
team. To request access, please reach out to @uklineale (Neel Kuila) via slack.
He will walk you through the process of getting access to the INCLUDE AWS
account and any compliance activities you need to complete. Please note that
the process to gain access may take a few days to complete.

Second, you must request that an account be created for you in the INCLUDE data
warehouse. To request an account, please reach out to your program's
administrator(s), requesting that an account be created for you. The
administrator(s) will create an account for you and add your account to the
appropriate role(s) within the warehouse, so that you will have access to the
appropriate tables immediately.

After this step is completed you will be furnished with database credentials as
well as the hostname of the database to connect to.

### Setup SAML CLI access

You will connect to the warehouse using a command line interface (CLI) that will
authenticate that you can have access to the warehouse. To configure your access
you will use a CLI program from AWS, called `saml2aws`.

Instructions for installing saml2aws and using this CLI are [here](https://www.notion.so/d3b/Setup-SAML-Login-1056131f1200806ba182f7b7c1793a40?source=copy_link#18a6131f12008082af91f427d2bd71fa)
in the section `CLI Access`. Complete all steps in this section. When using
this tool, you will want to connect create a profile for the AWS account
`373997854230`.

### Clone `devops_utils` repository

The [`devops_utils` repository](https://github.com/d3b-center/devops-utils) has
many scripts and tools for interacting with AWS resources. Clone this repository
to your machine and then navigate to the directory within the repository
`ssm_forward_to_db`.

## Connecting to the warehouse after the first time

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
