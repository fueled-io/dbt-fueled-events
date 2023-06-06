{{ config(
    enabled=true
) }}

with
    source as (select * from {{ source("fueled_events_atomic", "pages") }}),

    pages as (

        select
            path,
            channel,
            context_ip,
            context_anonymous_id,
            search,
            context_source_type,
            context_library_version,
            original_timestamp,
            sent_at,
            context_session_id,
            height,
            width,
            name,
            timestamp,
            user_id,
            received_at,
            url,
            context_source_id,
            context_request_ip,
            context_client_id,
            context_library_name,
            id,
            context_destination_type,
            title,
            loaded_at,
            context_destination_id,
            referrer,
            uuid_ts,
            _hash,
            context_timezone,
            context_page_hash,
            context_page_search,
            context_page_height,
            context_locale,
            context_page_url,
            context_page_referrer,
            context_app,
            context_campaign_medium,
            context_campaign_name,
            context_debug,
            context_os_name,
            context_referrer,
            context_campaign_gclid,
            context_page_title,
            context_page_path,
            context_user_agent,
            context_campaign_term,
            context_campaign_source,
            context_page_width,
            context_offline,
            context_initialized,
            context_campaign_content,
            context_campaign_profile,
            context_campaign_id

        from source

    )

select *
from pages
