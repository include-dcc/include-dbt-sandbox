{%- macro combined_stb_relations(table_name, studies_var) -%}
    {%- set studies = var(studies_var, []) -%}

    {%- if studies | length == 0 -%}
        {{ exceptions.raise_compiler_error("Var '" ~ studies_var ~ "' must contain at least one study prefix.") }}
    {%- endif -%}

    {%- set relations = [] -%}
    {%- for study in studies -%}
        {%- do relations.append(ref(study ~ '_stb_' ~ table_name)) -%}
    {%- endfor -%}

    {{- return(relations) -}}
{%- endmacro -%}

{%- macro combined_union_from_current_model(studies_var=none) -%}
    {%- if studies_var is none -%}
        {%- if model.name.startswith('inc_program_') -%}
            {%- set studies_var = 'inc_studies' -%}
        {%- elif model.name.startswith('kf_program_') -%}
            {%- set studies_var = 'kf_studies' -%}
        {%- else -%}
            {%- set studies_var = 'combined_studies' -%}
        {%- endif -%}
    {%- endif -%}

    {%- set table_name = model.name -%}
    {%- for prefix in ['combined_', 'inc_program_', 'kf_program_'] -%}
        {%- if table_name.startswith(prefix) -%}
            {%- set table_name = table_name.replace(prefix, '', 1) -%}
        {%- endif -%}
    {%- endfor -%}

    {%- set relations = combined_stb_relations(table_name=table_name, studies_var=studies_var) -%}

    {{- dbt_utils.union_relations(relations=relations) -}}
{%- endmacro -%}
