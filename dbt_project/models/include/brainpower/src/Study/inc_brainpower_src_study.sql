{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "Study Code"::text as "study_code",
    "Study Title"::text as "study_title",
    "Program"::text as "program",
    "Study Description"::text as "study_description",
    "Principal Investigator Name"::text as "principal_investigator_name",
    "Study Contact Name"::text as "study_contact_name",
    "Study Contact Institution"::text as "study_contact_institution",
    "Study Contact Email"::text as "study_contact_email",
    "VBR Email"::text as "vbr_email",
    "VBR URL"::text as "vbr_url",
    "VBR Readme"::text as "vbr_readme",
    "Research Domain"::text as "research_domain",
    "Participant Lifespan Stage"::text as "participant_lifespan_stage",
    "Selection Criteria"::text as "selection_criteria",
    "Study Design"::text as "study_design",
    "Clinical Data Source Type"::text as "clinical_data_source_type",
    "Data Category"::text as "data_category",
    "Study Website"::text as "study_website",
    "dbGaP"::text as "dbgap",
    "Publication"::text as "publication",
    "Expected Number of Participants"::text as "expected_number_of_participants",
    "GUID Type"::text as "guid_type",
    "GUID Mapped"::text as "guid_mapped",
    "Acknowledgments"::text as "acknowledgments",
    "Citation Statement"::text as "citation_statement",
    "DOI"::text as "doi",
    "DOI Citation"::text as "doi_citation"
    from {{ source('brainpower', 'study') }}
    