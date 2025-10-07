{{ config(
    enabled = var('enable_cart_viewed', true),
    materialized='ephemeral'
) }}

with
    source as (select * from {{ source("fueled_events_atomic", "cart_viewed") }}),

    cart_viewed as (

        select
            products,
            CAST(total as FLOAT64) as total,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            context_session_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "cart_viewed") }},
            id as event_id,
            {{get_attribution_click_ids("context_referrer")}}

        from source
        {% if var('include_s3_destination_data', false) %}
            where original_timestamp< '{{var('s3_destination_date', '2025-07-21')}}'
            union all
            select
            products,
            CAST(total as FLOAT64) as total,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            context_session_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "cart_viewed") }},
            id as event_id,
            {{get_attribution_click_ids("context_referrer")}}
            from {{ref("s3_destination_cart_viewed_raw")}}
            where original_timestamp>= '{{var('s3_destination_date', '2025-07-21')}}'
        {% endif %}

    )

select *
from cart_viewed
