{{ config(materialized='table') }}

select
  ROW_NUMBER() over () as inc_index,
  "Study Code"::text as study_code,
  "Dataset Name"::text as dataset_name,
  "Dataset External ID"::text as dataset_external_id,
  "Dataset Global ID"::text as dataset_global_id,
  "Dataset Description"::text as dataset_description,
  "Data Collection Start Year"::text as data_collection_start_year,
  "Data Collection End Year"::text as data_collection_end_year,
  "Data Category"::text as data_category,
  "Data Type"::text as data_type,
  "Experimental Strategy"::text as experimental_strategy,
  "Experimental Platform"::text as experimental_platform,
  "Publication"::text as publication,
  "Access Limitations"::text as access_limitations,
  "Access Requirements"::text as access_requirements,
  "dbGaP"::text as dbgap,
  "Other Repository"::text as other_repository,
  "Other Access Authority"::text as other_access_authority,
  "Is Harmonized"::text as is_harmonized,
  "Dataset Manifest Location"::text as dataset_manifest_location,
  "DOI"::text as doi,
  "DOI Citation"::text as doi_citation
from {{ source('brainpower', 'datasets') }}
    