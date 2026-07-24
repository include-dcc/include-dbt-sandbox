{%- macro generate_descriptor_view_sql(program_id='', dewrangle_study_id='', inclusion_resources=[], exclusion_resources=[]) -%}

{%- set accepted_models = ['AccessPolicy', 'Demographics'] -%}
{%- set accepted_program_ids = ['inc', 'kf'] -%}
{%- set descriptor_sources = [
    {'resource_model': 'AccessPolicy', 'relation_name': 'inc_brainpower_int_accesspolicy', 'descriptor_column': 'access_policy_descriptor'},
    {'resource_model': 'AccessPolicy', 'relation_name': 'inc_brainpower_int_demographics', 'descriptor_column': 'access_policy_descriptor'},
    {'resource_model': 'Patient', 'relation_name': 'inc_brainpower_int_demographics', 'descriptor_column': 'subject_descriptor'},
    {'resource_model': 'ResearchStudy', 'relation_name': 'inc_brainpower_int_demographics', 'descriptor_column': 'study_descriptor'}
] -%}

{%- if program_id not in accepted_program_ids -%}
    {%- do exceptions.raise_compiler_error("Invalid program_id: " ~ program_id ~ ". Accepted program IDs are: " ~ accepted_program_ids | join(", ")) -%}
{%- endif -%}

{%- for model in inclusion_resources -%}
    {%- if model not in accepted_models -%}
        {%- do exceptions.raise_compiler_error("Invalid model type: " ~ model ~ ". Accepted models are: " ~ accepted_models | join(", ")) -%}
    {%- endif -%}
{%- endfor -%}

{%- for model in exclusion_resources -%}
    {%- if model not in accepted_models -%}
        {%- do exceptions.raise_compiler_error("Invalid model type: " ~ model ~ ". Accepted models are: " ~ accepted_models | join(", ")) -%}
    {%- endif -%}
{%- endfor -%}

{%- set curated_models = [] -%}
{%- if inclusion_resources | length > 0 -%}
    {%- for model in inclusion_resources -%}
        {%- do curated_models.append(model) -%}
    {%- endfor -%}
{%- else -%}
    {%- for model in accepted_models -%}
        {%- do curated_models.append(model) -%}
    {%- endfor -%}
{%- endif -%}

{%- set curated_sources = [] -%}
{%- for source_row in descriptor_sources -%}
    {%- if source_row['resource_model'] == 'AccessPolicy' and 'AccessPolicy' in curated_models and 'AccessPolicy' not in exclusion_resources -%}
        {%- do curated_sources.append(source_row) -%}
    {%- elif source_row['resource_model'] in ['Patient', 'ResearchStudy'] and 'Demographics' in curated_models and 'Demographics' not in exclusion_resources -%}
        {%- do curated_sources.append(source_row) -%}
    {%- endif -%}
{%- endfor -%}

{%- if curated_sources | length == 0 -%}
    {{ exceptions.raise_compiler_error("No descriptor sources selected. Check inclusion_resources/exclusion_resources values.") }}
{%- endif -%}

with int_descriptors as (
{%- for source_row in curated_sources %}
    select
        '{{ source_row['resource_model'] }}'::text as resource_model,
        {{ source_row['descriptor_column'] }}::text as descriptor
    from {{ ref(source_row['relation_name']) }}
{% if not loop.last %}
    union all

{% endif %}
{%- endfor %}
),

unique_descriptors as (
    select distinct
        resource_model,
        descriptor
    from int_descriptors
    where nullif(trim(descriptor), '') is not null
),

existing_global_ids as (
    select distinct
        "fhirResourceType"::text as resource_model,
        descriptor::text as descriptor
    from {{ source('brainpower', 'global_ids') }}
    where "studyId" = '{{ dewrangle_study_id }}'
)

select
    '{{ program_id }}'::text as program_id,
    '{{ dewrangle_study_id }}'::text as study_id,
    u.resource_model,
    u.descriptor
from unique_descriptors as u
left join existing_global_ids as g
  on u.resource_model = g.resource_model
 and u.descriptor = g.descriptor
where g.descriptor is null
order by u.resource_model, u.descriptor

{%- endmacro -%}