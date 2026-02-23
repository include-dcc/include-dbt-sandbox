{{ config(
    schema='src'
) }}

select * 
from {{ source('kf_sd_1nns3k8v_src', 's3_scrape_cody') }}