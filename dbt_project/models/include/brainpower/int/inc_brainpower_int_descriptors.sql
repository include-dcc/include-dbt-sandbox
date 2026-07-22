{{ config(materialized='table') }}

{{ generate_descriptor_view_sql(
program_id='inc', dewrangle_study_id='brainpower', exclusion_resources=[]
) }}