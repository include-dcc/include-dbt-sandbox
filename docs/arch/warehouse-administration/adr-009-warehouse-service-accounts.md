---
# These are optional metadata elements. Feel free to remove any of them.
status: "proposed"
date: { 2025-12-01 }
---

# Controlling access to models within the warehouse

## Context

There needs to be a consensus decision regarding what accounts will be used
by services and automations.

## Decision

Individual accounts will not  be used by services and automations. Instead, an
account will be provisioned for each service. Examples of services that may need
to interact with the warehouse include dbt, airflow, and dewrangle.

For each service account, an individual will be identified to administer the
account. For services that are specific to one program, an individual or
individuals from that program will administer the service account. For services
that are independent of any program, an individual or individuals will be
decided by consensus of leaders of the programs to administer the service
account in question.

Service account administrators are responsible for keeping track of the login
credentials for the account(s) that they administer.
