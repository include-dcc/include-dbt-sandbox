---
# These are optional metadata elements. Feel free to remove any of them.
status: "proposed"
date: { 2025-12-01 }
---

# Controlling access to models within the warehouse

## Context

There needs to be a consensus decision regarding how roles will be used to
control access to tables, schemas, and other database objects within the
INCLUDE data warehouse.

## Decision

Roles will be used to control permissions to schemas, tables, and other
database objects. User accounts can be assigned to multiple roles. Only roles
will be assigned permissions to database objects. Individual user accounts will
never be provisioned permissions to a database object.

### Program roles

While each program may have as many roles as the program leaders or
administrators find necessary, at a minimum there will be two roles per program:

1. **Administrator role**. All administrator accounts in a program will be a
member of this administrator role.
2. **User role** All user accounts in a program will be a member of this role.

### Service roles

All service accounts will be part of a **service role**. If there are
program-specific service accounts, then there will also be a program-specific
service role for that program, that the program-specific service accounts will
be members of.

Depending on needs, individual service accounts may be provided access to
individual database objects where deemed needed.

## Alternative choices

An alternative choice is to provide permissions to database objects to
individual accounts. While this is fine when there are a small number of users,
when many users are in a warehouse, it becomes cumbersome to manage accounts
and adding and removing user access to all tables and schemas that they need -
or no longer need - access to.
