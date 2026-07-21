
-- Use the `ref` function to select from other models

select *
from "includewarehouse"."dev_kids_first"."my_first_dbt_model"
where id = 1