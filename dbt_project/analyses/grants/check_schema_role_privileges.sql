-- PostgreSQL: List roles and their privileges on each schema
-- Optional vars:
--   grants_schema_like (default: %brainpower%)
--   grants_role_like   (default: %include%)

{% set grants_schema_like = var('grants_schema_like', '%brainpower%') %}
{% set grants_role_like = var('grants_role_like', '%include%') %}

SELECT
    n.nspname AS schema_name,
    r.rolname AS role_name,
    CASE
        WHEN has_schema_privilege(r.rolname, n.nspname, 'CREATE') THEN 'YES'
        ELSE 'NO'
    END AS can_create,
    CASE
        WHEN has_schema_privilege(r.rolname, n.nspname, 'USAGE') THEN 'YES'
        ELSE 'NO'
    END AS can_usage
FROM
    pg_namespace n
CROSS JOIN
    pg_roles r
WHERE
    n.nspname NOT LIKE 'pg_%'
    AND n.nspname <> 'information_schema'
    AND n.nspname LIKE '{{ grants_schema_like }}'
    AND r.rolname LIKE '{{ grants_role_like }}'
ORDER BY
    schema_name, role_name
