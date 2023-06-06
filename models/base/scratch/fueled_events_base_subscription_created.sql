with
    source as (

        select * from {{ source("fueled_events_atomic", "subscription_created") }}

    ),

    subscription_created as (

        select
            order_status,
            order_billing_address_first_name,
            original_timestamp,
            sent_at,
            order_billing_address_postal_code,
            event_text,
            order_discount,
            order_type,
            sku_override,
            order_billing_address_email,
            charge_interval_frequency,
            order_currency,
            channel,
            context_destination_id,
            order_revenue,
            order_interval_unit,
            is_skippable,
            products,
            order_tax,
            order_id,
            loaded_at,
            next_charge_scheduled_at,
            context_request_ip,
            context_library_name,
            order_billing_address_city,
            order_order_id,
            updated_at,
            context_source_id,
            order_billing_address_phone,
            order_billing_address_last_name,
            order_value,
            order_billing_address_state,
            started_at,
            created_at,
            order_billing_address_country,
            has_queued_charges,
            context_rudderstack_source,
            context_ip,
            context_source,
            received_at,
            order_total,
            max_retries_reached,
            timestamp,
            order_billing_address_address,
            order_products,
            order_interval_frequency,
            status,
            context_destination_type,
            uuid_ts,
            context_source_type,
            is_swappable,
            id,
            user_id,
            order_subtotal,
            context_library_version,
            event,
            order_coupon,
            order_billing_address_company

        from source

    )

select *
from subscription_created
