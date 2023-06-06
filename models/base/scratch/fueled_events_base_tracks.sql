with
    source as (select * from {{ source("fueled_events_atomic", "tracks") }}),

    tracks as (

        select
            loaded_at,
            user_id,
            context_source,
            context_rudderstack_source,
            context_source_id,
            context_destination_type,
            context_ip,
            uuid_ts,
            received_at,
            context_destination_id,
            context_library_version,
            context_source_type,
            original_timestamp,
            context_library_name,
            id,
            event_text,
            timestamp,
            channel,
            event,
            sent_at,
            context_request_ip,
            context_client_id,
            context_anonymous_id,
            context_user_agent,
            context_session_id,
            context_passed_ip,
            context_locale

        from source

    )

select *
from tracks
