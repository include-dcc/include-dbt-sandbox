{{ config(materialized='table') }}

{{ generate_stb_sql(
    gid_lookup=source('brainpower', 'global_ids'),
    base_source=ref('inc_brainpower_int_studymetadata'),
    descriptor_sources=[
        'Consent',
        'ResearchStudy'
    ]
) }}