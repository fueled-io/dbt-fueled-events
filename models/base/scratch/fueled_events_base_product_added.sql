with
    source as (select * from {{ source("fueled_events_atomic", "product_added") }}),

    product_added as (

        select
            brand,
            category,
            image,
            name,
            position,
            price,
            product_id,
            quantity,
            sku,
            url,
            variant,
            context_anonymous_id as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "product_added") }},
            id as event_id

        from source

    )

select *
from product_added
