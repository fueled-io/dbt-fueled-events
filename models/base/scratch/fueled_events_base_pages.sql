{{ config(
    enabled = var('enable_pages', true)
) }}

with
    source as (select * from {{ source("fueled_events_atomic", "pages") }}),

    pages as (

        select
            _hash,
            height,
            name,
            path,
            referrer,
            search,
            title,
            url,
            width,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "pages") }},
            id as event_id

        from source

    )

select *
from pages
