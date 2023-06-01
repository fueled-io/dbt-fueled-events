with
    source as (select * from {{ source("fueled_events_atomic", "product_added") }}),

    product_added as (

        select
            brand,
            category,
            channel,
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
            event,
            event_text,
            id,
            image_url,
            name,
            original_timestamp,
            price,
            product_id,
            quantity,
            received_at,
            sent_at,
            sku,
            url,
            user_id,
            uuid_ts,
            variant,
            position,
            context_anonymous_id

        from source

    )

select *
from product_added
