{%- macro generate_stb_sql(gid_lookup='', base_source='', descriptor_sources=[]) -%}

{%- set resource_config = {
    'accesspolicy': {'resource': 'AccessPolicy', 'descriptor_column': 'access_policy_descriptor', 'gid_column': 'access_policy_id'},
    'activitydefinition': {'resource': 'ActivityDefinition', 'descriptor_column': 'activity_definition_descriptor', 'gid_column': 'activity_definition_id'},
    'patient': {'resource': 'Patient', 'descriptor_column': 'subject_descriptor', 'gid_column': 'subject_id'},
    'list': {'resource': 'List', 'descriptor_column': 'dataset_descriptor', 'gid_column': 'dataset_id'},
    'documentreference': {'resource': 'DocumentReference', 'descriptor_column': 'file_descriptor', 'gid_column': 'file_id'},
    'researchstudy': {'resource': 'ResearchStudy', 'descriptor_column': 'study_descriptor', 'gid_column': 'study_id'},
    'encounter': {'resource': 'Encounter', 'descriptor_column': 'encounter_descriptor', 'gid_column': 'encounter_id'},
    'observation': {'resource': 'Observation', 'descriptor_column': 'assertion_descriptor', 'gid_column': 'assertion_id'}
} -%}

{%- if gid_lookup is string -%}
  {%- set gid_lookup = ref(gid_lookup) -%}
{%- endif -%}

{%- if base_source is string -%}
  {%- set base_source = ref(base_source) -%}
{%- endif -%}

{%- if base_source is none -%}
  {{ exceptions.raise_compiler_error("generate_stb_sql requires base_source") }}
{%- endif -%}

{%- set descriptor_mappings = [] -%}
{%- for descriptor_source in descriptor_sources -%}
  {%- set resource_key = descriptor_source | lower -%}
  {%- if resource_key in resource_config -%}
    {%- set entry = resource_config[resource_key].copy() -%}
    {%- do entry.update({'resource_key': resource_key}) -%}
    {%- do descriptor_mappings.append(entry) -%}
  {%- else -%}
    {{ exceptions.raise_compiler_error("Unsupported descriptor source: " ~ descriptor_source ~ ". Supported values are: AccessPolicy, ActivityDefinition, Patient") }}
  {%- endif -%}
{%- endfor -%}

with
{%- for mapping in descriptor_mappings %}
  filtered_{{ mapping['resource_key'] }}_gids as (
    select
      "globalId" as {{ mapping['gid_column'] }},
      descriptor as {{ mapping['descriptor_column'] }}
    from {{ gid_lookup }}
    where "fhirResourceType" = '{{ mapping['resource'] }}'
      and "studyId" = 'brainpower'
  ){% if not loop.last %},{% endif %}
{%- endfor %}


select
  base.*
{%- for mapping in descriptor_mappings %}
  , filtered_{{ mapping['resource_key'] }}_gids.{{ mapping['gid_column'] }}
{%- endfor %}
from {{ base_source }} as base
{%- for mapping in descriptor_mappings %}
left join filtered_{{ mapping['resource_key'] }}_gids
  using ({{ mapping['descriptor_column'] }})
{%- endfor %}

{%- endmacro -%}