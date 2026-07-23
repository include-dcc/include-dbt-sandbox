# generate_descriptor_view_sql Quickstart

Use this macro to emit a compile-safe descriptor-view SQL placeholder.

## Basic Usage

```jinja
{{ config(materialized='table') }}

{{ generate_descriptor_view_sql(
    program_id='inc',
    dewrangle_study_id='brainpower'
) }}
```

## Exclude Specific Resource Models

```jinja
{{ generate_descriptor_view_sql(
    program_id='inc',
    dewrangle_study_id='brainpower',
    exclusion_resources=['AccessPolicy']
) }}
```

## Include Only Specific Resource Models

```jinja
{{ generate_descriptor_view_sql(
    program_id='inc',
    dewrangle_study_id='brainpower',
    inclusion_resources=['Demographics']
) }}
```

## Valid Values

- program_id: `inc` or `kf`
- inclusion_resources/exclusion_resources items: `AccessPolicy`, `Demographics`

Invalid values raise compile errors.
