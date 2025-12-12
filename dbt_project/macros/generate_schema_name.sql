-- macros/generate_schema_name.sql
{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    
    {# Get the full file path of the model, excluding the project name and the model name itself #}
    {%- set fqn_parts = node.fqn[1:-1] -%}
    
    {%- if fqn_parts | length > 0 -%}
        {# Join the folder names with underscores to create the custom schema part #}
        {%- set nested_schema = fqn_parts | join('_') -%}
        
        {# Combine the default schema and the nested schema part #}
        {{ default_schema }}_{{ nested_schema }}
    {%- else -%}
        {# If the model is not in a subfolder, use the default schema #}
        {{ default_schema }}
    {%- endif -%}

{%- endmacro %}

