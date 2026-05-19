{{ config(materialized='table') }}

select
    null::integer as "id",
    null::text as "hash_type",
    "File Hash"::text as "hash_value"
from {{ ref('brainpower_datafile_manifest_2025-06-26') }}
    