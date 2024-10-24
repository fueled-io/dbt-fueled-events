{{ config(
    enabled = var('enable_cart_viewed', true)
) }}

with
    source as (select * from {{ source("fueled_events_atomic", "cart_viewed") }}),

    cart_viewed as (

        select
            products,
            total,
            context_anonymous_id as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "cart_viewed") }},
            id as event_id

        from source

    )

select *
from cart_viewed
