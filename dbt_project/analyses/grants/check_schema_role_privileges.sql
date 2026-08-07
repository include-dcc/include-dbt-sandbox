-- PostgreSQL: List roles and their privileges on each schema
-- Optional vars:
--   grants_schema_like (default: %brainpower%)
--   grants_role_like   (default: %include%)

{% set grants_schema_like = var('grants_schema_like', '%brainpower%') %}
{% set grants_role_like = var('grants_role_like', '%include%') %}

select
  n.nspname as schema_name,
  r.rolname as role_name,
  case
    when has_schema_privilege(r.rolname, n.nspname, 'CREATE') then 'YES'
    else 'NO'
  end as can_create,
  case
    when has_schema_privilege(r.rolname, n.nspname, 'USAGE') then 'YES'
    else 'NO'
  end as can_usage
from
  pg_namespace as n
cross join
  pg_roles as r
where
  n.nspname not like 'pg_%'
  and n.nspname <> 'information_schema'
  and n.nspname like '{{ grants_schema_like }}'
  and r.rolname like '{{ grants_role_like }}'
order by
  schema_name, role_name
