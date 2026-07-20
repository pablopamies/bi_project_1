{{ config(
    materialized='table'
) }}

select
    md5(product_category) as product_sk,
    product_category
from (
    select distinct product_category
    from {{ ref('si_sales') }}
)