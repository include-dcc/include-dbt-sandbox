{{ config(materialized='table') }}

{{ generate_stb_sql(
    study_global_id='sd-dbaknypgqp',
    gid_lookup=source('brainpower', 'global_ids'),
    base_source=ref('inc_brainpower_int_accesspolicy'),
    descriptor_sources=[
        'Consent'
    ]
) }}
