with
    source as (select * from {{ source("fueled_events_atomic", "products_searched") }}),

    products_searched as (

        select
            event,
            context_source,
            sent_at,
            received_at,
            context_request_ip,
            user_id,
            context_ip,
            context_session_id,
            context_source_type,
            original_timestamp,
            event_text,
            context_client_id,
            context_destination_type,
            context_destination_id,
            uuid_ts,
            context_anonymous_id,
            context_rudderstack_source,
            context_source_id,
            context_library_version,
            channel,
            context_library_name,
            id,
            loaded_at,
            query,
            context_page_search,
            context_os_name,
            context_locale,
            context_app,
            context_referrer,
            context_page_referrer,
            context_page_height,
            context_timezone,
            context_page_title,
            context_offline,
            context_initialized,
            context_page_path,
            context_page_url,
            context_user_agent,
            context_debug,
            context_page_width

        from source

    )

select *
from products_searched
