
{%- macro generate_source_ref_from_current_model(prefix, strip_prefixes=none) -%}
    {%- if prefix is none or prefix | trim == '' -%}
        {{ exceptions.raise_compiler_error("Argument 'prefix' is required.") }}
    {%- endif -%}

    {%- if strip_prefixes is none -%}
        {%- set strip_prefixes = ['kf_access_', 'inc_access_', 'access_', 'combined_', 'inc_program_', 'kf_program_'] -%}
    {%- endif -%}

    {%- set table_name = model.name -%}
    {%- for strip_prefix in strip_prefixes -%}
        {%- if table_name.startswith(strip_prefix) -%}
            {%- set table_name = table_name.replace(strip_prefix, '', 1) -%}
        {%- endif -%}
    {%- endfor -%}

    {{- return(ref(prefix ~ '_' ~ table_name)) -}}
{%- endmacro -%}