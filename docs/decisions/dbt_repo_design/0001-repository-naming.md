---
# These are optional metadata elements. Feel free to remove any of them.
status: accepted
date: 2024-09-12
decision-makers: @nicholasvk
consulted: @calkinsh @alubneuski @allisonheath
informed: @d3b-center/devops @d3b-center/ADAPT
---

# DBT Repository Naming Convention

## Context and Problem Statement

Reposiries need informative and consistent naming so that the purpose of a
repository may be quickly inferred from its name. Likewise, repositories need
to have a consistent naming convention so that name differences between
repositories is clear.

## Considered Options

- [org-name]-dbt-[project-name]. The repository name has three parts:

  1. the organization name
  2. `dbt`
  3. the project name

  The repository name has the following qualities:

  - words are separated by dashes: `-`
  - all letters are lower-cased

  Projects names should be concise and descriptive.

## Decision Outcome

Chosen option: `[org-name]-dbt-[project-name]`, because it groups repositories
by the organization responsible for them and then groups dbt repositories
together.
