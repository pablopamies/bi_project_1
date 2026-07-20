{% snapshot customer_snapshot %}

{{
    config(
        unique_key='customer_id',

        strategy='check',

        check_cols=[
            'gender',
            'age',
            'age_group'
        ]
    )
}}

select distinct

    customer_id,
    gender,
    age,
    age_group

from {{ ref('si_sales') }}

{% endsnapshot %}