{%- set target_relation = ref(var('profile_model', 'inc_brainpower_src_bp_randomization')) -%}
{%- set include_columns = var('profile_include_columns', []) -%}
{%- set exclude_columns = var('profile_exclude_columns', []) -%}
{%- set where_clause = var('profile_where_clause', none) -%}
{%- set group_by = var('profile_group_by', []) -%}

{%- if include_columns and exclude_columns -%}
    {{ exceptions.raise_compiler_error("Both profile_include_columns and profile_exclude_columns were provided. Only one is allowed.") }}
{%- endif -%}

{% set relation_columns = adapter.get_columns_in_relation(target_relation) %}
{% set selected_columns = [] %}

{% for col in relation_columns %}
  {% if include_columns %}
    {% if col.name in include_columns %}
      {% do selected_columns.append(col) %}
    {% endif %}
  {% elif exclude_columns %}
    {% if col.name not in exclude_columns %}
      {% do selected_columns.append(col) %}
    {% endif %}
  {% else %}
    {% do selected_columns.append(col) %}
  {% endif %}
{% endfor %}

with source_data as (
  select *
  from {{ target_relation }}
  {% if where_clause %}
    where {{ where_clause }}
    {% endif %}
),

column_profiles as (
  {% for col in selected_columns %}
    {% set col_name = col.name %}
    {% set data_type = (col.data_type or '') | lower %}
    {% set is_numeric = (
        'int' in data_type
        or 'number' in data_type
        or 'numeric' in data_type
        or 'decimal' in data_type
        or 'float' in data_type
        or 'double' in data_type
        or 'real' in data_type
    ) %}
    select
    {%- for group_col in group_by %}
        {{ group_col }},
        {%- endfor %}
      lower('{{ col_name }}') as column_name,
      nullif('{{ data_type }}', '') as data_type,
      count(*) as row_count,
      count({{ adapter.quote(col_name) }})::float / nullif(count(*), 0) as not_null_proportion,
      count(distinct {{ adapter.quote(col_name) }})::float / nullif(count(*), 0) as distinct_proportion,
      count(distinct {{ adapter.quote(col_name) }}) as distinct_count,
      (count(*) = count(distinct {{ adapter.quote(col_name) }})) as is_unique,
      min(cast({{ adapter.quote(col_name) }} as varchar)) as min,
      max(cast({{ adapter.quote(col_name) }} as varchar)) as max,
      {% if is_numeric %}
        avg({{ adapter.quote(col_name) }}) as avg,
        percentile_cont(0.5) within group (order by {{ adapter.quote(col_name) }}) as median,
        stddev_pop({{ adapter.quote(col_name) }}) as std_dev_population,
        stddev_samp({{ adapter.quote(col_name) }}) as std_dev_sample,
      {% else %}
        cast(null as double precision) as avg,
        cast(null as double precision) as median,
        cast(null as double precision) as std_dev_population,
        cast(null as double precision) as std_dev_sample,
        {% endif %}
      cast(current_timestamp as varchar) as profiled_at,
      {{ loop.index }} as _column_position
    from source_data
    {% if group_by %}
    group by {{ group_by | join(', ') }}
    {% endif %}
    {% if not loop.last %}
      union all
    {% endif %}
  {% endfor %}
)

select
{%- for group_col in group_by %}
    {{ group_col }},
    {%- endfor %}
  column_name,
  data_type,
  row_count,
  not_null_proportion,
  distinct_proportion,
  distinct_count,
  is_unique,
  min,
  max,
  avg,
  median,
  std_dev_population,
  std_dev_sample,
  profiled_at
from column_profiles
order by {% if group_by %}{{ group_by | join(', ') }}, {% endif %}_column_position asc