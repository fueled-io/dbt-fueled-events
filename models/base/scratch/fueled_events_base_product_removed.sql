{{ config(
    enabled = var('product_removed', true)
) }}


with
    source as (select * from {{ source("fueled_events_atomic", "product_removed") }}),

    product_removed as (

        select
            position,
            context_anonymous_id as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "product_removed") }},
            id as event_id

        from source

    )

select *
from product_removed
