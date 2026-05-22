{% snapshot snapshot_customer %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',

        strategy='check',

        check_cols=[
        'customer_id',
        'first_name',
        'last_name',
        'email',
        'created_at'
        ]
    )
}}

SELECT *
FROM {{ ref('raw_customers') }}

{% endsnapshot %}