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
            context_anonymous_id as anonymous_id,
            user_id,
            external_customer_id,
            created_at,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "identifies") }},
            id as event_id

        from source

    )

select *
from identifies
