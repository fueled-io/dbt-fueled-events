with
    source as (

        select * from {{ source("fueled_events_atomic", "subscription_activated") }}

    ),

    subscription_activated as (

        select
            is_swappable,
            loaded_at,
            order_subtotal,
            order_revenue,
            max_retries_reached,
            is_skippable,
            event,
            order_type,
            context_source,
            order_discount,
            updated_at,
            context_destination_type,
            products,
            event_text,
            order_status,
            order_billing_address_postal_code,
            sku_override,
            context_request_ip,
            order_total,
            original_timestamp,
            context_library_version,
            uuid_ts,
            context_source_type,
            context_rudderstack_source,
            id,
            order_billing_address_last_name,
            has_queued_charges,
            channel,
            created_at,
            order_billing_address_address,
            order_billing_address_email,
            order_tax,
            context_ip,
            order_products,
            order_billing_address_first_name,
            status,
            next_charge_scheduled_at,
            context_library_name,
            started_at,
            order_interval_unit,
            order_currency,
            order_order_id,
            received_at,
            timestamp,
            context_source_id,
            order_billing_address_state,
            order_billing_address_city,
            order_billing_address_country,
            order_interval_frequency,
            order_value,
            charge_interval_frequency,
            order_billing_address_phone,
            user_id,
            order_id,
            context_destination_id,
            sent_at,
            order_coupon,
            order_cart_id

        from source

    )

select *
from subscription_activated
