with
    source as (select * from {{ source("fueled_events_atomic", "product_viewed") }}),

    product_viewed as (

        select
            image_url,
            user_id,
            context_anonymous_id,
            channel,
            variant,
            context_source,
            original_timestamp,
            context_ip,
            context_session_id,
            loaded_at,
            id,
            name,
            received_at,
            sent_at,
            context_request_ip,
            context_destination_type,
            sku,
            event,
            event_text,
            price,
            brand,
            context_client_id,
            uuid_ts,
            context_rudderstack_source,
            context_source_type,
            context_destination_id,
            context_library_name,
            product_id,
            timestamp,
            category,
            context_source_id,
            context_library_version,
            context_page_url,
            context_page_height,
            context_campaign_source,
            context_initialized,
            context_referrer,
            context_campaign_name,
            context_page_title,
            context_offline,
            context_campaign_gclid,
            context_page_search,
            context_campaign_medium,
            context_debug,
            context_page_path,
            context_campaign_content,
            context_page_width,
            context_os_name,
            context_page_referrer,
            context_user_agent,
            context_app,
            context_timezone,
            context_locale,
            context_campaign_term,
            context_campaign_profile,
            context_campaign_id

        from source

    )

select *
from product_viewed
