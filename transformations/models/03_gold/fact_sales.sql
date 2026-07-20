{{ config(
    materialized='incremental',
    unique_key='transaction_sk',
    incremental_strategy='merge'
) }}

select

    s.transaction_sk,
    s.transaction_id,

    dc.customer_sk,
    dp.product_sk,
    dd.date_sk,

    s.quantity,
    s.price_per_unit,
    s.total_amount,
    s.calculated_amount,
    s.amount_matches,
    s.ingestion_timestamp

from {{ ref('si_sales') }} s

left join {{ ref('dim_customer') }} dc       -- Se utiliza la versión vigente del cliente.
     on s.customer_id = dc.customer_bk       -- El dataset es un histórico cargado de una sola vez, por lo que
     and dc.is_current = true                -- no es posible reconstruir la dimensión según la fecha de la venta.
                                            
left join {{ ref('dim_product') }} dp
    on s.product_category = dp.product_category

left join {{ ref('dim_date') }} dd
    on s.transaction_date = dd.transaction_date

{% if is_incremental() %}

where s.ingestion_timestamp >
(
    select coalesce(max(ingestion_timestamp), '1900-01-01')
    from {{ this }}
)

{% endif %}