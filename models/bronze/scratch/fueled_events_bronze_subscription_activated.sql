{{ config(
    materialized='ephemeral'
) }}
with
    source as (

        select * from {{ source("fueled_events_atomic", "subscription_activated") }}

    ),

    subscription_activated as (

        select
            charge_interval_frequency,
            created_at,
            has_queued_charges,
            is_skippable,
            is_swappable,
            max_retries_reached,
            next_charge_scheduled_at,
            order_billing_address_address,
            order_billing_address_city,
            order_billing_address_country,
            order_billing_address_email,
            order_billing_address_first_name,
            order_billing_address_last_name,
            order_billing_address_phone,
            order_billing_address_postal_code,
            order_billing_address_state,
            order_cart_id
            order_coupon,
            order_currency,
            order_discount,
            order_id,
            order_interval_frequency,
            order_interval_unit,
            order_order_id,
            order_products,
            order_revenue,
            order_status,
            order_subtotal,
            order_tax,
            order_total,
            order_type,
            order_value,
            products,
            sku_override,
            started_at,
            status,
            updated_at,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "subscription_activated") }},
            id as event_id

        from source

    )

select *
from subscription_activated
