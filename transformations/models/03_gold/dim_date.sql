{{ config(
    materialized='table'
) }}

select distinct
    to_number(to_char(transaction_date, 'YYYYMMDD')) as date_sk,
    transaction_date,
    extract(day from transaction_date) as day_of_month,
    day_name,
    day_sort,
    extract(month from transaction_date) as month_number,
    month_name,
    month_sort,
    extract(quarter from transaction_date) as quarter_number,
    extract(year from transaction_date) as year_number,
    week(transaction_date) as week_of_year,
    weekday_flag,
    case
        when weekday_flag = 'Weekend' then true
        else false
    end as is_weekend
from {{ ref('si_sales') }}