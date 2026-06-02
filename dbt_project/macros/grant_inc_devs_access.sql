{% macro grant_inc_devs_access() %}
  {% if execute %}
    {% set grantee = adapter.quote('include_users') %}
    {% set run_schemas = schemas | unique if schemas is defined else [target.schema] %}

    {% for schema_name in run_schemas %}
      {% set quoted_schema = adapter.quote(schema_name) %}

      {% do run_query("grant usage on schema " ~ quoted_schema ~ " to " ~ grantee) %}
      {% do run_query("grant select on all tables in schema " ~ quoted_schema ~ " to " ~ grantee) %}
      {% do run_query("grant usage, select on all sequences in schema " ~ quoted_schema ~ " to " ~ grantee) %}

      {% do run_query("alter default privileges in schema " ~ quoted_schema ~ " grant select on tables to " ~ grantee) %}
      {% do run_query("alter default privileges in schema " ~ quoted_schema ~ " grant usage, select on sequences to " ~ grantee) %}
    {% endfor %}
  {% endif %}

  {{ return('') }}
{% endmacro %}