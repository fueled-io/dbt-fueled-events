with
    source as (select * from {{ source("fueled_events_atomic", "logged_in") }}),

    logged_in as (

        select
            context_anonymous_id as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "logged_in") }},
            id as event_id
        from source
    )

select *
from logged_in
