{{ config(
    enabled = var('enable_product_viewed', true)
) }}

with
    source as (select * from {{ source("fueled_events_atomic", "product_viewed") }}),

    product_viewed as (

        select
            brand,
            category,
            image_url,
            name,
            price,
            product_id,
            sku,
            variant,
            context_anonymous_id as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "product_viewed") }},
            id as event_id

        from source

    )

select *
from product_viewed
