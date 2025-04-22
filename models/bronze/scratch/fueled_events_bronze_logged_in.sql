{{ config(
    enabled = var('enable_logged_in', true),
    materialized='ephemeral'
) }}

with
    source as (select * from {{ source("fueled_events_atomic", "logged_in") }}),

    logged_in as (

        select
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "logged_in") }},
            id as event_id,
            {{get_attribution_click_ids("context_referrer")}}
        from source
    )

select *
from logged_in
