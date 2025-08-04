{{ config(
    enabled = var('enable_product_added', true),
    materialized='ephemeral'
) }}

with
    source as (select * from {{ source("fueled_events_atomic", "product_added") }}),

    product_added as (

        select
            brand,
            category,
            image_url,
            name,
            {{ handle_optional_column(source("fueled_events_atomic", "product_added"), 'position', 0) }},
            price,
            product_id,
            quantity,
            sku,
            url,
            variant,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "product_added") }},
            id as event_id,
            {{get_attribution_click_ids("context_referrer")}}

        from source
        {% if var('include_s3_destination_data', false) %}
            where original_timestamp < '{{var('s3_destination_date', '2025-07-21')}}'
            union all
            select
                brand,
                category,
                image_url,
                name,
                position,
                price,
                product_id,
                quantity,
                sku,
                url,
                variant,
                coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
                user_id,
                original_timestamp
                {{ get_shared_event_attributes("fueled_events_atomic", "product_added") }},
                id as event_id,
                {{get_attribution_click_ids("context_referrer")}}
            from {{ref("s3_destination_product_added")}}
            where original_timestamp >= '{{var('s3_destination_date', '2025-07-21')}}'
        {% endif %}
    )

select *
from product_added
