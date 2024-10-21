with
    source as (select * from {{ source("fueled_events_atomic", "product_added") }}),

    product_added as (

        select
            brand,
            category,
            -- TODO: coalesce(image, image_url)
            image_url,
            name,
            -- TODO: coalesce(position, 0)
            {% if 'position' in adapter.get_columns_in_relation(source('fueled_events_atomic', 'product_added')) %}
                position,
            {% endif %}
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
