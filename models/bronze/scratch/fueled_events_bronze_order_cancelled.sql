with
    source as (select * from {{ source("fueled_events_atomic", "order_cancelled") }}),

    order_cancelled as (

        select
            billing_address_address,
            billing_address_city,
            billing_address_country,
            billing_address_first_name,
            billing_address_last_name,
            billing_address_postal_code,
            billing_address_state,
            currency,
            order_id,
            revenue,
            shipping,
            status,
            subtotal,
            total,
            type,
            value,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "order_cancelled") }},
            id as event_id

        from source

    )

select *
from order_cancelled
