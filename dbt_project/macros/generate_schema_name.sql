-- macros/generate_schema_name.sql
{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}

    {# If an explicit schema is set in dbt_project.yml, use it as-is (no prefix) #}
    {%- if custom_schema_name is not none -%}
        {{ custom_schema_name | trim }}

    {# 1. Logic for Seed Files: result will be "dev_schema_import" #}
    {%- elif node.resource_type == 'seed' -%}
        {{ default_schema | trim }}

    {# 2. Unified Logic for Models #}
    {%- else -%}
        {# fqn_parts = [folder, subfolder, ..., model_name] #}
        {%- set fqn_parts = node.fqn[1:-1] -%}

        {%- if fqn_parts | length == 1 -%}
            {# Case: models/access/file.sql -> output: dev_schema_access #}
            {{ default_schema }}_{{ fqn_parts[0] }}

        {%- elif fqn_parts | length > 1 -%}
            {# Case: models/kf/study/src/files.sql -> output: dev_schema_kf_study #}
            {# Exclude the last subfolder ('src') #}
            {%- set schema_path = fqn_parts[:-1] | join('_') -%}
            {{ default_schema }}_{{ schema_path }}

        {%- else -%}
            {# Fallback for models in the root /models/ folder #}
            {{ default_schema }}
        {%- endif -%}
    {%- endif -%}

{%- endmacro %}
