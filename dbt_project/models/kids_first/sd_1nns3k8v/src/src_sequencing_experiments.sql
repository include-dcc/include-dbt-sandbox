{{ config(
    schema='src'
) }}

select *
from {{ ref('sd_1nns3k8v_sequencing_experiments')}}