{{ config(
    schema='src'
) }}

select * 
from {{ ref('s3_scrape_cody') }}