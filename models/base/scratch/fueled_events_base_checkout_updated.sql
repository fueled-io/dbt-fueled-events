with
    source as (select * from {{ source("fueled_events_atomic", "checkout_updated") }}),

    checkout_updated as (

    select
        context_source,
        currency,
        context_locale,
        uuid_ts,
        loaded_at,
        context_destination_id,
        value,
        user_id,
        received_at,
        context_request_ip,
        context_session_id,
        context_source_type,
        event_text,
        context_source_id,
        id,
        sent_at,
        channel,
        context_anonymous_id,
        context_rudderstack_source,
        context_user_agent,
        context_library_name,
        products,
        event,
        context_ip,
        context_client_id,
        discount,
        tax,
        timestamp,
        original_timestamp,
        coupon,
        context_library_version,
        context_destination_type,
        affiliation,
        context_passed_ip

        from source

    )

select *
from checkout_updated
