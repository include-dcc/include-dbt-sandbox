---
status: proposed
date: 2026-06-01
---

# DBT Project Dependencies

## Context

This repository depends on `dbt-core` and related dbt packages. The previously
used version, `dbt-core==1.10.18`, reaches its End of Support date on
June 16, 2026.

To keep the project maintainable and aligned with actively supported tooling,
the repository has been upgraded from `dbt-core==1.10.18` to
`dbt-core==1.11.11`.

### Considered Options

#### Chosen Option

- Upgrade to `dbt-core==1.11.11`.

#### Other Options

1. Remain on `dbt-core==1.10.18`.
   This was rejected because the version is reaching its End of Support soon,
   increasing long-term maintenance and support risk.

## Decision Outcome

Chosen option: upgrade to `dbt-core==1.11.11`.

## Consequences

- Positive:
  - The project is aligned with active dbt-core release versions.
- Risks:
  - New version behavior may differ from the currently used version.
