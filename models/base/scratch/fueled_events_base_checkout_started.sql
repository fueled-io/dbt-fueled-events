with
    source as (select * from {{ source("fueled_events_atomic", "checkout_started") }}),

    checkout_started as (

        select
            affiliation,
            channel,
            context_anonymous_id,
            context_client_id,
            context_destination_id,
            context_destination_type,
            context_ip,
            context_library_name,
            context_library_version,
            context_request_ip,
            context_rudderstack_source,
            context_session_id,
            context_source,
            context_source_id,
            context_source_type,
            currency,
            event,
            event_text,
            id,
            original_timestamp,
            products,
            received_at,
            revenue,
            sent_at,
            user_id,
            uuid_ts,
            value

        from source

    )

select *
from checkout_created
