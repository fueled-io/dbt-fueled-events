with
    source as (select * from {{ source("fueled_events_atomic", "checkout_updated") }}),

    checkout_updated as (

        select
            affiliation,
            coupon,
            currency,
            discount,
            products,
            tax,
            value,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "checkout_updated") }},
            id as event_id

        from source

    )

select *
from checkout_updated
