{{ config(materialized='table') }}

    select
    file_meta_data_id::text as "file_meta_data_id",
    meta_data_type::text as "meta_data_type",
    assay_strategy::text as "assay_strategy",
    platform_instrument::text as "platform_instrument",
    library_prep::text as "library_prep",
    library_selection::text as "library_selection",
    strandedness::text as "strandedness",
    target_region::text as "target_region",
    is_paired_end::text as "is_paired_end",
    adaptor_trimmed::text as "adaptor_trimmed",
    reference_genome::text as "reference_genome",
    workflow_type::text as "workflow_type",
    workflow_tool::text as "workflow_tool",
    access_policy_id::text as "access_policy_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    