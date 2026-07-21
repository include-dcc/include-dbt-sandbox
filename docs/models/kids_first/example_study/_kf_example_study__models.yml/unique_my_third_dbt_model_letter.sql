
    
    

select
    letter as unique_field,
    count(*) as n_records

from "includewarehouse"."dev_kids_first"."my_third_dbt_model"
where letter is not null
group by letter
having count(*) > 1


