{{ config(
    materialized='ephemeral'
) }}
with
    source as (select * from {{ source("fueled_events_atomic", "identifies") }}),

    identifies as (

        select
            address_city,
            address_street,
            email,
            first_name,
            last_name,
            name,
            phone,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            user_id,
            context_session_id,
            external_customer_id,
            created_at,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "identifies") }},
            id as event_id,
            {{get_attribution_click_ids("context_referrer")}}

        from source

    )

select *
from identifies
