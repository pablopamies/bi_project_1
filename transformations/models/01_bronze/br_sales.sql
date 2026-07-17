{{ config(
    materialized='incremental',
    unique_key='transaction_id',
    incremental_strategy='merge',
    on_schema_change='sync_all_columns'
) }}

select

    transaction_id,
    date,
    customer_id,
    gender,
    age,
    product_category,
    quantity,
    price_per_unit,
    total_amount,
    day,
    day_sort,
    month,
    month_sort,
    age_group,
    quantity_category,
    weekday_flag,

    current_timestamp() as ingestion_timestamp

from {{ source('raw', 'sales_raw') }}

