{% macro grant_inc_devs_access() %}
  {% if execute %}
    {% set grantee_name = 'include_users' %}
    {% set grantee = adapter.quote(grantee_name) %}
    {% set ns = namespace(run_schemas=[]) %}

    {% if results is defined %}
      {% for res in results %}
        {% set node_tags = res.node.tags if res.node.tags is defined else [] %}
        {% if res.node.resource_type == 'model' and 'kids_first' not in node_tags %}
          {% do ns.run_schemas.append(res.node.schema) %}
        {% endif %}
      {% endfor %}
    {% endif %}

    {% set run_schemas = ns.run_schemas | unique %}

    {% if run_schemas | length == 0 %}
      {% set run_schemas = schemas | unique if schemas is defined else [target.schema] %}
      {% do log('No node results context found; using run schemas without tag-based exclusion', info=True) %}
    {% endif %}
    

    {% for schema_name in run_schemas %}
      {% set quoted_schema = adapter.quote(schema_name) %}
      {% set schema_granted_sql %}
        select has_schema_privilege('{{ grantee_name }}', '{{ schema_name }}', 'USAGE')
      {% endset %}
      {% set schema_granted_result = run_query(schema_granted_sql) %}
      {% set schema_granted = false %}

      {% if schema_granted_result is not none and schema_granted_result.rows | length > 0 %}
        {% set schema_granted = schema_granted_result.rows[0][0] %}
      {% endif %}

      {% if not schema_granted %}
        {% do log('Applying include_users grants on schema ' ~ schema_name, info=True) %}

        {% do run_query("grant usage on schema " ~ quoted_schema ~ " to " ~ grantee) %}
        {% do run_query("grant select, insert, update, delete on all tables in schema " ~ quoted_schema ~ " to " ~ grantee) %}
        {% do run_query("grant usage, select on all sequences in schema " ~ quoted_schema ~ " to " ~ grantee) %}

        {% do run_query("alter default privileges in schema " ~ quoted_schema ~ " grant select, insert, update, delete on tables to " ~ grantee) %}
        {% do run_query("alter default privileges in schema " ~ quoted_schema ~ " grant usage, select on sequences to " ~ grantee) %}
      {% else %}
        {% do log('Skipping grants for schema ' ~ schema_name ~ ' (already granted)', info=True) %}
      {% endif %}
    {% endfor %}
  {% endif %}

  {{ return('') }}
{% endmacro %}