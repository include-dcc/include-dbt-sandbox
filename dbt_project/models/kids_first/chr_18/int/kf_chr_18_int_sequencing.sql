{{ config(materialized='table') }}

    with base as (
        select
        -- commenting these out for now, but linking sample_id differs by study so will be used in some cases
            -- sample_id,
            -- collaborator_sample_id,
            collaborator_participant_id as participant_id,
            root_sample_id as sample_id,
            data_type as sequencing_strategy,

            -- these fields are typically included in ingest package but not sure if they will be needed for access model
            total_reads,
            mean_read_length,
            reference_sequence_name
        from {{ ref('kf_chr_18_src_terra_manifest_v2') }}
    ),

    crams as (
        select
        root_sample_id,
        replace(cram_path,
                "gs://fc-2092c58b-ce12-42e7-9a8e-64b78440537a/",
                "s3://kf-strides-study-us-east-1-prd-sd-1nns3k8v/source/",
                ) as cram_path
        from {{ ref('kf_chr_18_src_terra_manifest_v2') }} 
    ),

    crais as (
        select
        root_sample_id,
        replace(crai_path,
                "gs://fc-2092c58b-ce12-42e7-9a8e-64b78440537a/",
                "s3://kf-strides-study-us-east-1-prd-sd-1nns3k8v/source/",
                ) as crai_path
        from {{ ref('kf_chr_18_src_terra_manifest_v2') }} as crais
    ),

    md5s as (
        select
        root_sample_id,
        replace(md5_path,
                "gs://fc-2092c58b-ce12-42e7-9a8e-64b78440537a/",
                "s3://kf-strides-study-us-east-1-prd-sd-1nns3k8v/source/",
                ) as md5_path
        from {{ ref('kf_chr_18_src_terra_manifest_v2') }} as md5s
    )

    select 
    -- base.sample_id,
    -- base.collaborator_sample_id,
    base.participant_id,
    base.sample_id,
    base.sequencing_strategy,
    base.total_reads,
    base.mean_read_length,
    base.reference_sequence_name,
    crams.cram_path,
    crais.crai_path,
    md5s.md5_path,
    'False' as harmonized,
    'False' as paired_end,
    'Broad Institute' as sequencing_center_name
    from base
    left join crams
    on base.sample_id = crams.root_sample_id
    left join crais
    on base.sample_id = crais.root_sample_id
    left join md5s
    on base.sample_id = md5s.root_sample_id