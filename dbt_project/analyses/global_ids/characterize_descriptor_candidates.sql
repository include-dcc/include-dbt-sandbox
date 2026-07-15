{% macro characterize_descriptor_candidates(relation) %}

{% set cols = adapter.get_columns_in_relation(relation) %}

{% for col in cols %}

select
    '{{ col.name }}'                     as column_name,
    '{{ col.data_type }}'                as datatype,
    count(*)                             as total_rows,
    count({{ col.name }})                as populated_rows,
    count(*) - count({{ col.name }})     as null_rows,
    round(
        100.0 *
        (count(*) - count({{ col.name }}))
        / nullif(count(*),0),
        2
    )                                    as null_pct,
    count(distinct {{ col.name }})       as distinct_values,
    count(*) - count(distinct {{ col.name }})
                                         as duplicate_rows,
    round(
        100.0 *
        count(distinct {{ col.name }})
        / nullif(count(*),0),
        2
    )                                    as uniqueness_pct,
    min(length(cast({{ col.name }} as varchar)))
                                         as min_length,
    max(length(cast({{ col.name }} as varchar)))
                                         as max_length,
    case
        when lower('{{ col.name }}')
             similar to '%(id|identifier|guid|uuid|accession|barcode|sample|participant|subject|family)%'
            then true
        else false
    end as looks_like_identifier
from {{ relation }}

{% if not loop.last %}
union all
{% endif %}

{% endfor %}

{% endmacro %}