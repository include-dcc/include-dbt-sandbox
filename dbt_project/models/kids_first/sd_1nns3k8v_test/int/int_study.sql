{{ config(
    schema='int'
) }}

select distinct 
    created_at,
    modified_at,
    uuid, -- we can leave this out, it's not used
    data_access_authority, -- usually value is dbgap here
    external_id,-- usually we make this the phs number - would be worth renaming to reflect that
    version, -- seems useful, but is rarely ever used.
    name, -- this is the full name of the study; might be worth renaming
    short_name, -- do we need name and short name? 
    attribution, -- not exactly sure what would go here, we rarely populate it
    release_status, -- like the idea of this, but it's not consistently updated
    investigator_id, -- like the idea of this, but again not consistently populated, should it be? 
    kf_id as study_id,
    lower(replace(kf_id, '_', '-')) as dewrangle_study_id,
    visible,
    short_code,
    domain, -- this is research domain e.g., CANCER vs SBD
    program,
    visibility_reason,
    visibility_comment,
    parent_study_id,
    biobank_email, -- has been NA for kids first, only used for CBTN, should we keep? 
    biobank_name, -- has been NA for kids first, only used for CBTN, should we keep? 
    biobank_request_instructions, -- has been NA for kids first, only used for CBTN, should we keep? 
    biobank_request_link -- has been NA for kids first, only used for CBTN, should we keep? 
from {{ ref('src_study')}}