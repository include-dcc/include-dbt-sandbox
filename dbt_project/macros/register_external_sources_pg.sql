{% macro register_external_sources_pg(tb_schema, tablename, columns, src_data_csv_path) %}
    {% if tb_schema is none or tablename is none or columns is none or src_data_csv_path is none %}
        {{ log("Error: Missing required arguments in register_external_sources_pg macro.", warn=True) }}
        {% do return('') %}
    {% endif %}

    {% set create_table_query %}
    CREATE SCHEMA IF NOT EXISTS {{ tb_schema }};

    CREATE TABLE IF NOT EXISTS {{ tb_schema }}.{{ tablename }} (
        {% for column in columns %}
        {{ column }}{% if not loop.last %},{% endif %}
        {% endfor %}
    );
    {% endset %}


    {% set full_query %}
    {{ create_table_query }} 
    {% endset %}


    {{ log("Executing SQL: " ~ full_query, info=True) }}
    {{ run_query(full_query) }}

{% endmacro %}