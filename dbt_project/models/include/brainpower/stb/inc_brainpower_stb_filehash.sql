{{ config(materialized='table') }}

select
    null::integer as "id",
    null::text as "hash_type",
    file_hash::text as "hash_value"
from {{ ref('inc_brainpower_src_brainpower_datafile_manifest_2025_06_26') }}