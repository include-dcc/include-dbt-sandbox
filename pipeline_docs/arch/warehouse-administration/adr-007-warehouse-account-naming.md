---
# These are optional metadata elements. Feel free to remove any of them.
status: "proposed"
date: { 2025-12-01 }
---

# Warehouse User Account Naming Convention

## Context

There needs to be a consensus decision regarding what naming convention
warehouse user accounts will use. A common naming scheme will make identifying
accounts easier for the purpose of auditing activity in the warehouse.

## Decision

There are two broad categories of account types in the warehouse, user accounts
and service accounts. User accounts are accounts that are assigned to a
particular person. Service accounts are accounts used programmatically, are
not assigned to a particular person, and are used by automation tools such as
airflow or dbt.

### User accounts

User accounts will always have, minimally, a user name and program name in it.

#### User names

User names may be decided by the user requesting an account but, unless
otherwise needed, individuals' user names should be the same as the one that they
use in their parent institution.

#### Program

All user accounts will be associated with a program. Currently, there are two
programs to be involved in the warehouse, INCLUDE and Kids First. The short
names for these programs are `inc` and `kf` respectively. These short names are
what will be used in account naming.

While nearly all users are likely from a single program, if that user's work
spans multiple programs, whichever program that user works most in should be the
program associated with that user.

#### Administrator accounts

Administrator accounts will follow the naming schema of
`admin-[program-shortname]-[username]`.

#### General user accounts

General user accounts will follow the naming schema of
`[program-shortname]-[username]`.

### Service accounts

Service accounts are used by services and automations.

#### Service names

Service names should be descriptive of the service that the account is used for.
These service names should be short and make it clear what service the account
is used for. As an example, a service account for running dbt models would have
the service name `dbt`.

#### Service Program

Not all service accounts are associated with a single program, but if a
service account is associated with a single program, that program's short name
will be in the account name. Program names discussed in the [program](#program)
section above.

#### Program-specific service accounts

Program-specific service accounts will follow the naming schema of
`svc-[program-shortname]-[service-name]`

#### General service accounts

General service accounts will follow the naming schema of
`svc-[service-name]`

### Group Roles

#### Role names

Role names should be descriptive of the group role's purpose while also being
short. Examples of role names include `admin`, `user`, and `svc`.

#### Role Naming Convention

There will be roles created for groups of users. These roles will follow the
naming schema of `role-[program-shortname]-[role-name]`.
