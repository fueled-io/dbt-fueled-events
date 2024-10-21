{{ config(
    enabled = var('product_list_viewed', true)
) }}


with
    source as (

        select * from {{ source("fueled_events_atomic", "product_list_viewed") }}

    ),

    product_list_viewed as (

        select
            category,
            products,
            context_anonymous_id as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "product_list_viewed") }},
            id as event_id

        from source

    )

select *
from product_list_viewed
