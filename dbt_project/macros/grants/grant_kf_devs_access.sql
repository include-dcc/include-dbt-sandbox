{% macro grant_kf_devs_access() %}
  {{ grant_devs_access(tag='kids_first', users_role='kf_users') }}
{% endmacro %}