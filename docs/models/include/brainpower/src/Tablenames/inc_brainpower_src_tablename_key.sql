

select
  ROW_NUMBER() over () as inc_index,
  table_name::text as table_name
from "includewarehouse"."inc_brainpower_src"."tablename_key"