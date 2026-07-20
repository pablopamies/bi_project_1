{{ config(
    materialized='table'
) }}

select
    md5(cast(customer_id as varchar)||cast(dbt_valid_from as varchar)) as customer_sk,
    customer_id as customer_bk,
    gender,
    age,
    age_group,
    dbt_valid_from as valid_from,
    dbt_valid_to as valid_to,
    case
        when dbt_valid_to is null then true
        else false
    end as is_current
from {{ ref('customer_snapshot') }}