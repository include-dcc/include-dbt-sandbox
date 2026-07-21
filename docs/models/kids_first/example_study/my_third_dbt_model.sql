

select 
  id,
  letter
from "includewarehouse"."dev_kids_first"."my_second_dbt_model"
left join "includewarehouse"."dev"."alphabet_grouping" on id = letter_grouping