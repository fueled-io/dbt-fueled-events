with
    source as (select * from {{ source("fueled_events_atomic", "order_cancelled") }}),

    order_cancelled as (

        select
            affiliation,
            billing_address_address,
            billing_address_city,
            billing_address_country,
            billing_address_first_name,
            billing_address_last_name,
            billing_address_phone,
            billing_address_postal_code,
            billing_address_state,
            channel,
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
            currency,
            discount,
            event,
            event_text,
            id,
            order_id,
            original_timestamp,
            products,
            received_at,
            revenue,
            sent_at,
            shipping,
            status,
            subtotal,
            tax,
            total,
            type,
            user_id,
            uuid_ts,
            value,
            cart_id,
            context_passed_ip,
            context_user_agent,
            payment_type,
            context_locale,
            context_client_id,
            context_session_id,
            billing_address_email,
            coupon,
            billing_address_company

        from source

    )

select *
from order_cancelled
