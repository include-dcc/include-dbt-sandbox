{% macro combined_stb_relations(table_name, studies_var='combined_studies') %}
    {% set studies = var(studies_var, []) %}

    {% if studies | length == 0 %}
        {{ exceptions.raise_compiler_error("Var '" ~ studies_var ~ "' must contain at least one study prefix.") }}
    {% endif %}

    {% set relations = [] %}
    {% for study in studies %}
        {% do relations.append(ref(study ~ '_stb_' ~ table_name)) %}
    {% endfor %}

    {{ return(relations) }}
{% endmacro %}

{% macro combined_union_from_current_model(studies_var='combined_studies') %}
    {% set table_name = model.name | replace('combined_', '') %}
    {% set relations = combined_stb_relations(table_name=table_name, studies_var=studies_var) %}

    {{ dbt_utils.union_relations(relations=relations) }}
{% endmacro %}
