{{ config(
    materialized='incremental',
    unique_key='transaction_sk',
    incremental_strategy='merge',
    on_schema_change='sync_all_columns'
) }}

select
    md5(cast(transaction_id as varchar)) as transaction_sk,
    transaction_id,
    to_date(date, 'YYYY/MM/DD') as transaction_date,
    customer_id,
    upper(trim(gender)) as gender,
    case
        when age between 18 and 100 then age
        else null
    end as age,
    initcap(trim(product_category)) as product_category,
    case
        when quantity > 0 then quantity
        else null
    end as quantity,
    price_per_unit,
    total_amount,
    quantity * price_per_unit as calculated_amount,
    case
        when quantity * price_per_unit = total_amount
        then true
        else false
    end as amount_matches,
    initcap(trim(day)) as day_name,
    day_sort,
    initcap(trim(month)) as month_name,
    month_sort,
    trim(age_group) as age_group,
    trim(quantity_category) as quantity_category,
    trim(weekday_flag) as weekday_flag,
    ingestion_timestamp
from {{ ref('br_sales') }}