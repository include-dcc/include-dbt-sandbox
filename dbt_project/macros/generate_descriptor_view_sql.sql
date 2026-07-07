{%- macro generate_descriptor_view_sql(program_id='', dewrangle_study_id='', exception_resources=[]) -%}

{%- set accepted_models = ['AccessPolicy', 'ActivityDefinition', 'Patient'] -%}
{%- set accepted_program_ids = ['inc', 'kf'] -%}

{%- if program_id not in accepted_program_ids -%}
    {%- do exceptions.raise_compiler_error("Invalid program_id: " ~ program_id ~ ". Accepted program IDs are: " ~ accepted_program_ids | join(", ")) -%}
{%- endif -%}

{%- for model in exception_resources -%}
    {%- if model not in accepted_models -%}
        {%- do exceptions.raise_compiler_error("Invalid model type: " ~ model ~ ". Accepted models are: " ~ accepted_models | join(", ")) -%}
    {%- endif -%}
{%- endfor -%}

{%- set curated_models = [] -%}
{%- for model in accepted_models -%}
    {%- if model not in exception_resources -%}
        {%- do curated_models.append(model) -%}
    {%- endif -%}
{%- endfor -%}

{#
  Compile-safe placeholder implementation for descriptor-view generation.
  Emits one row per selected resource model and can be expanded later with
  descriptor-specific logic and source joins.
#}
{%- for model in curated_models -%}
select
    '{{ program_id }}'::text as program_id,
    '{{ dewrangle_study_id }}'::text as study_id,
    '{{ model }}'::text as resource_model
{%- if not loop.last %}
union all
{%- endif -%}
{%- endfor -%}

{%- endmacro -%}