{{ config(materialized='view') }}

{{ generate_descriptor_view_sql(
table_prefix='inc_brainpower_int_', study_global_id='brainpower'
) }}