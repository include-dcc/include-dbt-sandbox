{{ config(materialized='table') }}

{{ combined_union_from_current_model(studies_var='common_access_data') }}