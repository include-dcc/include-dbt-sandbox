{% set candidates = [
    ["id"],
    ["cohort"],
    ["id","strata"],
    ["id","cohort"],

] %}

{% set table_ref = ref('inc_brainpower_src_bp_randomization') %}
{% set study_id = 'brainpower' %}
{% set render_state = namespace(first_row=true) %}

{% for cols in candidates %}
{% set descriptor_sql = normalize_descriptors(descriptor_cols=cols) %}
{% if not render_state.first_row %}
union all
{% endif %}
{% set render_state.first_row = false %}
{% set descriptor_null_pct_parts = [] %}
{% set required_check_parts = [] %}
{% for col_name in cols %}
{% do descriptor_null_pct_parts.append("case when count(*) - count(" ~ col_name ~ ") > 0 then 'True' else 'False' end") %}
{% do required_check_parts.append("count(*) = count(" ~ col_name ~ ")") %}
{% endfor %}
{% do required_check_parts.append("count(" ~ descriptor_sql ~ ") - count(distinct " ~ descriptor_sql ~ ") = 0") %}
{% do required_check_parts.append("round(100.0 * count(" ~ descriptor_sql ~ ") / nullif(count(*), 0), 2) = 100.0") %}
{% do required_check_parts.append("round(100.0 * count(distinct " ~ descriptor_sql ~ ") / nullif(count(" ~ descriptor_sql ~ "), 0), 2) = 100.0") %}

select
    '{{ cols | join(",") }}' as descriptor_columns,
    {{ "concat_ws('|', " ~ (descriptor_null_pct_parts | join(', ')) ~ ")" }} as has_nulls,

     min({{ descriptor_sql }}) filter (where {{ descriptor_sql }} is not null) as random_example,

    count(*) as n_rows,

    count({{ descriptor_sql }}) - count(distinct {{ descriptor_sql }}) as duplicate_descriptor_values,

    round(
        100.0 *
        count(distinct {{ descriptor_sql }})
        / nullif(count({{ descriptor_sql }}), 0),
        2
    ) as unique_pct,

    round(
        100.0 *
        count({{ descriptor_sql }})
        / nullif(count(*), 0),
        2
    ) as completeness_pct,

    case
    when {{ required_check_parts | join(' and ') }}
    then 'True'
    else 'False'
    end as is_good_candidate,

    max(length({{ descriptor_sql }})) as max_length,

    min(length({{ descriptor_sql }})) filter (where {{ descriptor_sql }} is not null) as min_length

from {{ table_ref }}

{% endfor %}