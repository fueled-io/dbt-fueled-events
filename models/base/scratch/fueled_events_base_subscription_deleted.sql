with
    source as (

        select * from {{ source("fueled_events_atomic", "subscription_deleted") }}

    ),

    subscription_deleted as (

        select
            channel,
            charge_interval_frequency,
            context_destination_id,
            context_destination_type,
            context_ip,
            context_library_name,
            context_library_version,
            context_request_ip,
            context_rudderstack_source,
            context_source,
            context_source_id,
            context_source_type,
            created_at,
            ended_at,
            event,
            event_text,
            has_queued_charges,
            id,
            is_skippable,
            is_swappable,
            max_retries_reached,
            next_charge_scheduled_at,
            order_interval_frequency,
            order_interval_unit,
            original_timestamp,
            products,
            received_at,
            sent_at,
            sku_override,
            started_at,
            status,
            updated_at,
            user_id,
            uuid_ts,
            order_billing_address_postal_code,
            order_cart_id,
            order_coupon,
            order_revenue,
            order_products,
            order_billing_address_email,
            order_type,
            order_billing_address_state,
            order_subtotal,
            order_billing_address_city,
            order_status,
            order_billing_address_country,
            order_billing_address_last_name,
            order_billing_address_phone,
            order_total,
            order_discount,
            order_billing_address_first_name,
            order_id,
            order_billing_address_address,
            end_reason,
            order_order_id,
            order_value,
            order_currency,
            order_tax,
            order_billing_address_company

        from source

    )

select *
from subscription_deleted
