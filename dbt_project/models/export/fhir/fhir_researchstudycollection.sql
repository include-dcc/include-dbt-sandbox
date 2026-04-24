{{ config(materialized='table') }}

    select
    research_study_collection_id::text as "research_study_collection_id",
    description::text as "description",
    collection_title::text as "collection_title",
    research_study_collection_type::text as "research_study_collection_type",
    website::text as "website",
    collection_status::text as "collection_status",
    access_policy_id::text as "access_policy_id"
    from {{ ref('access_researchstudycollection') }}
    