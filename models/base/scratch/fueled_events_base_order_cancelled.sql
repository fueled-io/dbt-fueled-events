with
    source as (select * from {{ source("fueled_events_atomic", "order_cancelled") }}),

    order_cancelled as (

        select
            context_source_type,
            id,
            value,
            context_library_name,
            billing_address_city,
            user_id,
            context_rudderstack_source,
            total,
            revenue,
            context_source,
            context_request_ip,
            shipping,
            subtotal,
            billing_address_country,
            billing_address_state,
            billing_address_first_name,
            order_id,
            status,
            received_at,
            context_library_version,
            context_ip,
            event,
            context_source_id,
            currency,
            billing_address_address,
            type,
            billing_address_last_name,
            billing_address_postal_code,
            event_text,
            products,
            channel,
            sent_at,
            uuid_ts,
            context_destination_type,
            cart_id,
            billing_address_phone,
            timestamp,
            context_destination_id,
            tax,
            original_timestamp,
            affiliation,
            payment_type,
            discount,
            loaded_at,
            context_anonymous_id,
            coupon,
            context_passed_ip,
            context_session_id,
            context_locale,
            context_client_id,
            context_user_agent,
            billing_address_company,
            billing_address_email

        from source

    )

select *
from order_cancelled
