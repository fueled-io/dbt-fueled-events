{{ config(
    enabled = var('enable_order_completed', true),
    materialized='ephemeral'
) }}

with
    source as (
        select * from {{ source("fueled_events_atomic", "order_completed") }}
    ),

    order_completed as (

        select
            affiliation,
            billing_address_address,
            billing_address_city,
            billing_address_company,
            billing_address_country,
            billing_address_first_name,
            billing_address_last_name,
            billing_address_phone,
            billing_address_postal_code,
            billing_address_state,
            cart_id,
            coupon,
            currency,
            discount,
            event_text,
            order_id,
            payment_type,
            products,
            revenue,
            shipping,
            status,
            subtotal,
            tax,
            total,
            type,
            value,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "order_completed") }},
            id as event_id

        from source
        {% if var('include_s3_destination_data', false) %}
            where original_timestamp< '{{var('s3_destination_date', '2025-07-21')}}'
            union all
            select affiliation,
            billing_address_address,
            billing_address_city,
            billing_address_company,
            billing_address_country,
            billing_address_first_name,
            billing_address_last_name,
            billing_address_phone,
            billing_address_postal_code,
            billing_address_state,
            cart_id,
            coupon,
            currency,
            discount,
            event_text,
            order_id,
            payment_type,
            products,
            revenue,
            shipping,
            status,
            subtotal,
            tax,
            total,
            type,
            value,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "order_completed") }},
            event_id
            from {{ref("s3_destination_order_completed_raw")}}
            where original_timestamp>= '{{var('s3_destination_date', '2025-07-21')}}'
        {% endif %}

    )

select *
from order_completed
