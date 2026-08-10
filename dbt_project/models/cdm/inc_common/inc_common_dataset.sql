{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::text as "dataset_id",
    null::text as "name",
    null::text as "description",
    null::text as "do_id",
    null::text as "data_collection_start",
    null::text as "data_collection_end"
    from {{ program_ref }}    