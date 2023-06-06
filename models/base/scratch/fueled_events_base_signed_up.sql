with
    source as (select * from {{ source("fueled_events_atomic", "signed_up") }}),

    signed_up as (

        select
            id,
            context_rudderstack_source,
            uuid_ts,
            context_request_ip,
            email,
            user_id,
            context_anonymous_id,
            sent_at,
            loaded_at,
            context_client_id,
            context_session_id,
            context_library_name,
            context_source_id,
            event_text,
            first_name,
            received_at,
            channel,
            context_library_version,
            original_timestamp,
            context_destination_id,
            timestamp,
            context_source_type,
            last_name,
            event,
            context_ip,
            context_source,
            context_destination_type,
            context_offline,
            context_timezone,
            context_referrer,
            context_app,
            context_os_name,
            context_page_height,
            context_user_agent,
            context_locale,
            context_initialized,
            context_debug,
            context_page_referrer,
            context_page_url,
            context_page_width,
            context_page_title,
            context_page_path

        from source

    )

select *
from signed_up