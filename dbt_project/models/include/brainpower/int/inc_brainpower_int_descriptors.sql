{{ config(materialized='table') }}

{{ generate_descriptor_view_sql(
program_id='', dewrangle_study_id='', exception_resources=[]
) }}