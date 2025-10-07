{{ config(
    enabled = var('enable_logged_in', true),
    materialized='ephemeral'
) }}

with
    source as (select * from {{ source("fueled_events_atomic", "logged_in") }}),

    logged_in as (

        select
            'Logged In' as event_text,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            user_id,
            context_session_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "logged_in") }},
            id as event_id,
            {{get_attribution_click_ids("context_referrer")}}
        from source
        {% if var('include_s3_destination_data', false) %}
            where original_timestamp< '{{var('s3_destination_date', '2025-07-21')}}'
            union all
            select
                event_text,
                coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
                user_id,
                context_session_id,
                original_timestamp
                {{ get_shared_event_attributes("fueled_events_atomic", "logged_in") }},
                event_id,
                {{get_attribution_click_ids("context_referrer")}}
            from {{ref("s3_destination_logged_in")}}
            where original_timestamp>= '{{var('s3_destination_date', '2025-07-21')}}'
        {% endif %}
    )

select *
from logged_in
