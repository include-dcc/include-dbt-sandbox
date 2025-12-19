{{ config(
    schema='access'
) }}

-- WIP
-- should some of the constants be assigned upstream in the stable tables? 
-- it would make it easier in the access model when bringing in every study
-- these fields are not explictly provided in kf 

select distinct 
s.study_id, -- do we want to use the KF study id or the dewrangle one? 
'X01' as funding_source, -- is this the funding source for every kf study? 
s.name as study_title, -- is study title the full study name? 
s.short_code as study_code,
s.short_name as study_short_name,
'KF' as program, -- see enum list; should this always be a constant? or should we bother mapping what we have in study.program? 
'Not Reported' study_description, -- we have this just not stored in any db
s.domain as research_domain, -- current linkml enums don't quite match
'Pediatric' as participant_lifespan_age, -- all kf studies should be set to pediatric
'Not Reported' as selection_criteria, -- we may have this info in intake sheets, but not stored in any db for kf
'Longitudinal' as study_design, -- not stored in a db, but might be in intake sheets ; otherwise not explicitly provided for kf
'Unknown' as clinical_data_source_type,
'Genomics' as data_category, -- this should be derived from available seq types in DS; need to review best apporach
'Not Reported' as website, 
count(distinct p.participant_id) as expected_number_of_participants, -- should this be a count of every pt in ds? 
count(case when p.visible='true' then participant_id end) as actual_number_of_participants, -- should this be a count of only vis pt in ds? 
'Not Reported' as acknowledgements,
'Not Reported' as citation_statement, 
'Not Reported' as doi,
i.name as contact, 
s.parent_study_id as parent_study,
i.name as principle_investigator,
s.external_id -- using phs number for now
from {{ ref('stable_investigator')}} i 
join {{ ref('stable_study')}} s on s.investigator_id=i.investigator_id-- think about how this would be adjusted to account for all stable_study tables in KF
join {{ ref('stable_participant')}} p on p.study_id=s.study_id 
group by s.study_id, funding_source, study_title, study_code, study_short_name, 
program, study_description, research_domain, participant_lifespan_age, selection_criteria,
study_design, clinical_data_source_type, data_category, website, acknowledgements, citation_statement, doi, s.external_id,
contact, parent_study, principle_investigator