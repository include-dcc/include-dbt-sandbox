{%- macro normalize_descriptors(descriptor_cols=[], study_id='') -%}

    {%- set parts = [] -%}

    {%- if study_id is not none and (study_id | trim) != '' -%}
        {%- set normalized_study = study_id | trim | replace("'", "''") -%}
        {%- do parts.append("'" ~ normalized_study ~ "'") -%}
    {%- endif -%}

    {%- for col in descriptor_cols -%}
        {# normalize only whitespace for each column expression #}
        {%- set normalized_col = "nullif(regexp_replace(trim(cast(" ~ col ~ " as text)), '\\s+', ' ', 'g'), '')" -%}
        {%- do parts.append(normalized_col) -%}
    {%- endfor -%}

    {{ return("concat_ws(',', " ~ (parts | join(', ')) ~ ")") }}

{%- endmacro -%}