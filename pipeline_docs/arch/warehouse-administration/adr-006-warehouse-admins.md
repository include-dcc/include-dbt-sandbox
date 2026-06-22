---
# These are optional metadata elements. Feel free to remove any of them.
status: "proposed"
date: { 2025-12-01 }
---

# Controlling access to models within the warehouse

## Context

There needs to be a consensus decision regarding who will be responsible for
administering access to the INCLUDE data warehouse

## Decision

Each program will assign a handful of users to be administrators of the
warehouse. There should be the minimum number of administrators per program.
Most likely this will involve a primary administrator and a backup
administrator.

The responsibility of warehouse administrators is to provision permissions to
schemas, tables, and other warehouse objects to users and to remove those
permissions once a user no longer has need to access the warehouse.

An administration account will be provisioned for each user, where that
administration account will be separate from the account that the administrator
may otherwise use to query the warehouse.

## Alternative choices

Another option is to have one admin account that only certain users have access
to, such that there is one account where the username and password to that
administrator account is shared with multiple people. Although password sharing
has less overhead, this is a less secure system because any one user
disclosing account credentials inappropriately could have large impact on
security of the warehouse. This method also has the disadvantage of not
being able to show who makes changes to the warehouse when the administrator
account is used.
