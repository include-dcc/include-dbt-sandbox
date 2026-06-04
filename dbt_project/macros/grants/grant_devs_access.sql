{% macro grant_devs_access(tag, users_role) %}
  {% if execute %}
    {% set command_name = flags.WHICH if flags is defined and flags.WHICH is defined else none %}
    {% if command_name not in ['run', 'build'] %}
      {% do log('grant_devs_access: skipping for command ' ~ (command_name or 'unknown') ~ '; grants are only applied for run/build', info=True) %}
      {{ return('') }}
    {% endif %}

    {% if not tag %}
      {% do exceptions.raise_compiler_error('grant_devs_access: tag is required') %}
    {% endif %}

    {% if not users_role %}
      {% do exceptions.raise_compiler_error('grant_devs_access: users_role is required') %}
    {% endif %}

    {% set grantee_name = users_role %}
    {% set grantee = adapter.quote(grantee_name) %}
    {% set ns = namespace(run_schemas=[]) %}

    {% if results is defined %}
      {% for res in results %}
        {% set node_tags = res.node.tags if res.node.tags is defined else [] %}
        {% if res.node.resource_type == 'model' and tag in node_tags %}
          {% do ns.run_schemas.append(res.node.schema) %}
        {% endif %}
      {% endfor %}
    {% endif %}

    {% set run_schemas = ns.run_schemas | unique | list %}

    {% if run_schemas | length == 0 %}
      {% do log('grant_devs_access: no models with the ' ~ tag ~ ' tag found in run results; skipping grants', info=True) %}
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
        {% do log('Applying ' ~ grantee_name ~ ' grants on schema ' ~ schema_name, info=True) %}

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
