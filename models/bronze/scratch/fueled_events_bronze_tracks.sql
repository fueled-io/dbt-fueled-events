{{ config(
    materialized='ephemeral'
) }}
with
    source as (select * from {{ source("fueled_events_atomic", "tracks") }}),

    tracks as (

        select
            event,
            event_text,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            user_id,
            context_session_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "tracks") }},
            id as event_id

        from source

    )

select *
from tracks
