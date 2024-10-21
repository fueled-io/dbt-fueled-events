{{ config(
    enabled = var('enable_signed_up', true)
) }}

with
    source as (select * from {{ source("fueled_events_atomic", "signed_up") }}),

    signed_up as (

        select
            email,
            first_name,
            last_name,
            context_anonymous_id as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "signed_up") }},
            id as event_id

        from source

    )

select *
from signed_up