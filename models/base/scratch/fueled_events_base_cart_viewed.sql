with
    source as (select * from {{ source("fueled_events_atomic", "cart_viewed") }}),

    cart_viewed as (

    select
        context_request_ip,
        total,
        uuid_ts,
        context_client_id,
        context_source_id,
        loaded_at,
        received_at,
        context_source_type,
        context_anonymous_id,
        id,
        timestamp,
        context_ip,
        context_source,
        user_id,
        context_session_id,
        event,
        context_library_version,
        context_rudderstack_source,
        products,
        original_timestamp,
        sent_at,
        event_text,
        context_destination_id,
        channel,
        context_library_name,
        context_destination_type,
        context_referrer,
        context_page_title,
        context_user_agent,
        context_page_height,
        context_debug,
        context_page_referrer,
        context_page_path,
        context_os_name,
        context_page_url,
        context_offline,
        context_initialized,
        context_locale,
        context_timezone,
        context_page_width,
        context_app,
        context_campaign_name,
        context_campaign_medium,
        context_campaign_source,
        context_page_search,
        context_page_hash

        from source

    )

select *
from cart_viewed
