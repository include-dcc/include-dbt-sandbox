-- macros/generate_schema_name.sql
{% macro generate_schema_name(custom_schema_name, node) -%}
# Generate custom schema names based of file structure in dbt_projects # 

    {%- set default_schema = target.schema -%}

    {# 1. Logic for Seed Files: result will be "dev_schema_import" #}
    {%- if node.resource_type == 'seed' -%}
        {%- if custom_schema_name is none -%}
            {{ default_schema | trim }}
        {%- else -%}
            {{ default_schema | trim }}_{{ custom_schema_name | trim }}
        {%- endif -%}

    {# 2. Logic for Models in subfolders #}
    {%- elif node.fqn[1:-1] | length > 0 -%}
        {# Get the subfolders than remove the last one #}
        {%- set fqn_parts = node.fqn[1:-1] -%}
        {%- set schema_path_list = fqn_parts[:-1] %}

        {# Join the folder names with underscores to create the custom schema part #}
        {%- set nested_schema = schema_path_list | join('_') -%}

        {# Join only if nested_schema is not empty #}
        {{ default_schema }}{% if nested_schema | trim != '' %}_{{ nested_schema | trim }}{% endif %}

    {# 3. Logic for models in root or single-depth folders #}
    {%- else -%}
        {# If the model is not in a subfolder, use the default schema #}
        {{ default_schema }}
    {%- endif -%}

{%- endmacro %}
