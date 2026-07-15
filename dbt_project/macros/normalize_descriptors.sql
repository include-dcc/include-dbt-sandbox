{%- macro normalize_descriptors(descriptor_cols=[]) -%}

    {%- set parts = [] -%}

    {%- for col in descriptor_cols -%}
        {# normalize only whitespace for each column expression #}
        {%- set normalized_col = "nullif(regexp_replace(trim(cast(" ~ col ~ " as text)), '\\s+', ' ', 'g'), '')" -%}
        {%- do parts.append(normalized_col) -%}
    {%- endfor -%}

    {{ return("concat_ws(',', " ~ (parts | join(',')) ~ ")") }}

{%- endmacro -%}