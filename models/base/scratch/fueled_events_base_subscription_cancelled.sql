with
    source as (

        select * from {{ source("fueled_events_atomic", "subscription_cancelled") }}

    ),

    subscription_cancelled as (

        select
            order_order_id,
            max_retries_reached,
            order_interval_unit,
            order_discount,
            sku_override,
            id,
            order_billing_address_postal_code,
            context_source_id,
            order_tax,
            context_rudderstack_source,
            is_skippable,
            order_type,
            order_interval_frequency,
            context_request_ip,
            context_source,
            event_text,
            order_billing_address_email,
            is_swappable,
            user_id,
            timestamp,
            order_total,
            products,
            order_billing_address_state,
            updated_at,
            order_subtotal,
            order_products,
            order_revenue,
            uuid_ts,
            context_library_name,
            context_library_version,
            order_billing_address_last_name,
            original_timestamp,
            created_at,
            sent_at,
            ended_at,
            received_at,
            channel,
            order_status,
            has_queued_charges,
            order_currency,
            order_id,
            charge_interval_frequency,
            order_value,
            event,
            context_source_type,
            order_billing_address_address,
            loaded_at,
            context_destination_type,
            order_billing_address_country,
            context_ip,
            order_billing_address_city,
            order_billing_address_first_name,
            context_destination_id,
            started_at,
            order_billing_address_phone,
            end_reason,
            status,
            order_cart_id,
            order_coupon,
            order_billing_address_company

        from source

    )

select *
from subscription_cancelled
