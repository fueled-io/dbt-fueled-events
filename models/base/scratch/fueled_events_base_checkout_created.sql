with
    source as (select * from {{ source("fueled_events_atomic", "checkout_created") }}),

    checkout_created as (

    select
        context_client_id,
        context_library_name,
        context_destination_id,
        discount,
        context_source_id,
        context_request_ip,
        context_locale,
        loaded_at,
        products,
        context_user_agent,
        id,
        affiliation,
        context_source,
        context_rudderstack_source,
        tax,
        currency,
        original_timestamp,
        sent_at,
        context_session_id,
        context_anonymous_id,
        context_library_version,
        channel,
        context_ip,
        event,
        user_id,
        context_destination_type,
        context_source_type,
        value,
        timestamp,
        context_passed_ip,
        event_text,
        uuid_ts,
        received_at,
        coupon

        from source

    )

select *
from checkout_created
