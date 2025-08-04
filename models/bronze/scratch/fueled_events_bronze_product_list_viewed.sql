{{ config(
    enabled = var('enable_product_list_viewed', true),
    materialized='ephemeral'
) }}


with
    source as (

        select * from {{ source("fueled_events_atomic", "product_list_viewed") }}

    ),

    product_list_viewed as (

        select
            category,
            products,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "product_list_viewed") }},
            id as event_id,
            {{get_attribution_click_ids("context_referrer")}}

        from source
        {% if var('include_s3_destination_data', false) %}
            where original_timestamp < '{{var('s3_destination_date', '2025-07-21')}}'
            union all
            select
                category,
                products,
                coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
                user_id,
                original_timestamp
                {{ get_shared_event_attributes("fueled_events_atomic", "product_list_viewed") }},
                id as event_id,
                {{get_attribution_click_ids("context_referrer")}}
            from {{ref("s3_destination_product_list_viewed")}}
            where original_timestamp >= '{{var('s3_destination_date', '2025-07-21')}}'
        {% endif %}
    )

select *
from product_list_viewed
