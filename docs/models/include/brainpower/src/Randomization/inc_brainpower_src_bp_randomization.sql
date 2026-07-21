

select
  ROW_NUMBER() over () as inc_index,
  id::integer as id,
  cohort::integer as cohort,
  strata::integer as strata,
  randomization::integer as randomization
from "includewarehouse"."inc_brainpower_src"."bp_randomization"