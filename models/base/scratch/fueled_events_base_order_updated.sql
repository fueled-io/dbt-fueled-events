with
    source as (select * from {{ source("fueled_events_atomic", "order_updated") }}),

    order_updated as (

        select
            loaded_at,
            billing_address_city,
            context_rudderstack_source,
            discount,
            event_text,
            user_id,
            original_timestamp,
            billing_address_first_name,
            affiliation,
            billing_address_address,
            context_source_type,
            coupon,
            billing_address_postal_code,
            shipping,
            context_anonymous_id,
            context_user_agent,
            context_destination_id,
            type,
            total,
            billing_address_last_name,
            status,
            received_at,
            context_ip,
            sent_at,
            value,
            context_locale,
            payment_type,
            id,
            uuid_ts,
            order_id,
            context_destination_type,
            channel,
            currency,
            context_library_name,
            tax,
            context_client_id,
            timestamp,
            context_passed_ip,
            context_session_id,
            event,
            context_source,
            billing_address_state,
            cart_id,
            billing_address_phone,
            context_request_ip,
            products,
            context_source_id,
            context_library_version,
            billing_address_country,
            billing_address_company,
            subtotal,
            revenue,
            billing_address_email

        from source

    )

select *
from order_updated
