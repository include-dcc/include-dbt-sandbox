---
# These are optional metadata elements. Feel free to remove any of them.
status: proposed
date: 2025-11-19
---

# DBT Repository Naming Convention

## Context

Repositories need informative and consistent naming so that the purpose of a
repository may be quickly inferred from its name. Likewise, repositories need
to have a consistent naming convention so that name differences between
repositories is clear.

### Considered Options

#### Chosen Option

- [org-name]-dbt-[project-name]. The repository name has three parts:

  1. the organization name
  2. `dbt`
  3. the project name

  The repository name has the following qualities:

  - words are separated by dashes: `-`
  - all letters are lower-cased

  Projects names should be concise and descriptive.

#### Other Options

1. Using CamelCase. While CamelCase is the convention in some programming
languages, we are not using it in repository names because word boundaries are
not as easy to see than in words separated by some character.
2. Using underscores (`_`) to separate words. While underscores are a valid
character in repository names, dashes are more commonly used and easier to
type.
3. Using only project name: `dbt-[project-name]`. This option does not
indicate the organization responsible for the repository. Prepending the
repository name with the organization name allows for similarly-named projects
to exist across organizations.

## Decision Outcome

Chosen option: `[org-name]-dbt-[project-name]`, because it groups repositories
by the organization responsible for them and then groups dbt repositories
together.

## Consequences

dbt projects will be named using the above described format.
