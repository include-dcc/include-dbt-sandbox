{{ config(materialized='table') }}

{{ combined_union_from_current_model() }}
