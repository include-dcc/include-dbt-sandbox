
{{ config(materialized='table') }}

SELECT letter_grouping, count(*)
FROM {{ ref('alphabet_grouping') }}
GROUP BY letter_grouping