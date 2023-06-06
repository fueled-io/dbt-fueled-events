with
    source as (select * from {{ source("fueled_events_atomic", "logged_in") }}),

    logged_in as (

        select
            context_request_ip,
            user_id,
            id,
            context_source_type,
            received_at,
            context_destination_type,
            context_client_id,
            context_ip,
            event_text,
            context_library_name,
            loaded_at,
            context_anonymous_id,
            uuid_ts,
            context_source,
            original_timestamp,
            context_destination_id,
            context_library_version,
            event,
            context_source_id,
            context_rudderstack_source,
            timestamp,
            sent_at,
            channel,
            context_session_id,
            context_page_width,
            context_timezone,
            context_offline,
            context_user_agent,
            context_page_url,
            context_page_referrer,
            context_os_name,
            context_debug,
            context_initialized,
            context_page_title,
            context_page_height,
            context_locale,
            context_referrer,
            context_page_path,
            context_app,
            context_page_search

        from source

    )

select *
from logged_in
