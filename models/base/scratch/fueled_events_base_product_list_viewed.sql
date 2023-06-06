with
    source as (

        select * from {{ source("fueled_events_atomic", "product_list_viewed") }}

    ),

    product_list_viewed as (

        select
            list_id,
            sent_at,
            context_destination_id,
            context_source,
            original_timestamp,
            context_source_id,
            context_session_id,
            context_rudderstack_source,
            context_anonymous_id,
            category,
            context_library_name,
            timestamp,
            context_client_id,
            uuid_ts,
            event_text,
            context_source_type,
            products,
            id,
            event,
            context_ip,
            context_library_version,
            channel,
            received_at,
            context_destination_type,
            context_request_ip,
            loaded_at,
            user_id,
            context_campaign_name,
            context_page_title,
            context_page_width,
            context_campaign_medium,
            context_timezone,
            context_locale,
            context_os_name,
            context_page_referrer,
            context_app,
            context_page_height,
            context_page_search,
            context_offline,
            context_debug,
            context_initialized,
            context_user_agent,
            context_referrer,
            context_page_url,
            context_campaign_source,
            context_page_path,
            context_campaign_term,
            context_campaign_gclid,
            context_campaign_content,
            context_page_hash,
            context_campaign_profile,
            context_campaign_id

        from source

    )

select *
from product_list_viewed
