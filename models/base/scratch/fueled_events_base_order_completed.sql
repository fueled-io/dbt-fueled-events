with
    source as (select * from {{ source("fueled_events_atomic", "order_completed") }}),

    order_completed as (

        select
            billing_address_state,
            context_passed_ip,
            context_source_type,
            event,
            billing_address_first_name,
            context_user_agent,
            revenue,
            discount,
            id,
            billing_address_country,
            received_at,
            value,
            original_timestamp,
            coupon,
            context_source,
            type,
            context_library_name,
            tax,
            event_text,
            status,
            timestamp,
            total,
            context_request_ip,
            context_source_id,
            context_rudderstack_source,
            context_destination_type,
            billing_address_address,
            subtotal,
            payment_type,
            billing_address_postal_code,
            context_library_version,
            cart_id,
            context_session_id,
            billing_address_phone,
            currency,
            affiliation,
            sent_at,
            user_id,
            channel,
            context_destination_id,
            order_id,
            context_client_id,
            loaded_at,
            shipping,
            context_anonymous_id,
            billing_address_last_name,
            context_locale,
            uuid_ts,
            billing_address_city,
            products,
            context_ip,
            billing_address_company

        from source

    )

select *
from order_completed
