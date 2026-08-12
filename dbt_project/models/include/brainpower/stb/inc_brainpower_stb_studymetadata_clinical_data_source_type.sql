{{ config(materialized='table') }}

{{ generate_stb_sql(
    study_global_id='sd-dbaknypgqp',
    gid_lookup=source('brainpower', 'global_ids'),
    base_source=ref('inc_brainpower_int_studymetadata_clinical_data_source_type'),
    descriptor_sources=[

    ]
) }}
