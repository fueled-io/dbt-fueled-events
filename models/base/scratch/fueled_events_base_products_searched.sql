{{ config(
    enabled = var('enable_products_searched', true)
) }}

with
    source as (select * from {{ source("fueled_events_atomic", "products_searched") }}),

    products_searched as (

        select
            query,
            context_anonymous_id as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "products_searched") }},
            id as event_id

        from source

    )

select *
from products_searched
