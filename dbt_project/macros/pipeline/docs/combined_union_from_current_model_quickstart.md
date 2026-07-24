# combined_union_from_current_model Quickstart

Use this macro inside a combined model to union study-specific STB models.

## Naming Convention

The current model should be named like `combined_<table_name>`.
The macro removes `combined_` and looks for `<study>_stb_<table_name>`.

## Basic Usage

```jinja
{{ config(materialized='table') }}

{{ combined_union_from_current_model() }}
```

## Override Study Var Name

```jinja
{{ combined_union_from_current_model(studies_var='my_studies_var') }}
```

## Dependency

Requires `dbt_utils` because it uses `dbt_utils.union_relations`.
