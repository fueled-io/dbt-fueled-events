with
    source as (select * from {{ source("fueled_events_atomic", "checkout_updated") }}),

    checkout_updated as (

        select
            affiliation,
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
            coupon,
            currency,
            discount,
            event,
            event_text,
            id,
            original_timestamp,
            products,
            received_at,
            sent_at,
            tax,
            user_id,
            uuid_ts,
            value,
            context_anonymous_id

        from source

    )

select *
from checkout_updated
