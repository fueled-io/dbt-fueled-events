with
    source as (select * from {{ source("fueled_events_atomic", "product_removed") }}),

    product_removed as (

        select
            context_source_id,
            received_at,
            context_destination_type,
            original_timestamp,
            sent_at,
            context_destination_id,
            context_request_ip,
            context_rudderstack_source,
            context_client_id,
            context_session_id,
            context_source_type,
            context_ip,
            event_text,
            position,
            loaded_at,
            timestamp,
            context_anonymous_id,
            context_library_name,
            user_id,
            channel,
            uuid_ts,
            context_library_version,
            id,
            event,
            context_source,
            context_initialized,
            context_user_agent,
            context_locale,
            context_page_url,
            context_app,
            context_page_path,
            context_page_referrer,
            context_page_title,
            context_os_name,
            context_debug,
            context_referrer,
            context_page_height,
            context_offline,
            context_timezone,
            context_page_width

        from source

    )

select *
from product_removed
