with
    source as (select * from {{ source("fueled_events_atomic", "order_updated") }}),

    order_updated as (

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
            channel,
            context_client_id,
            context_destination_id,
            context_destination_type,
            context_ip,
            context_library_name,
            context_library_version,
            context_locale,
            context_passed_ip,
            context_request_ip,
            context_rudderstack_source,
            context_session_id,
            context_source,
            context_source_id,
            context_source_type,
            context_user_agent,
            currency,
            discount,
            event,
            event_text,
            id,
            order_id,
            original_timestamp,
            payment_type,
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
            coupon,
            billing_address_email,
            context_anonymous_id

        from source

    )

select *
from order_updated
