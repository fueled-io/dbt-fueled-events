with
    source as (select * from {{ source("fueled_events_atomic", "order_updated") }}),

    order_updated as (

        select
            affiliation,
            billing_address_address,
            billing_address_city,
            billing_address_company
            billing_address_country,
            billing_address_first_name,
            billing_address_last_name,
            billing_address_phone,
            billing_address_postal_code,
            billing_address_state,
            cart_id,
            coupon,
            currency,
            discount,
            event_text,
            order_id,
            payment_type,
            products,
            revenue,
            shipping,
            status,
            subtotal,
            tax,
            total,
            type,
            value,
            context_anonymous_id as anonymous_id,
            user_id,
            original_timestamp
            {{ get_shared_event_attributes("fueled_events_atomic", "order_updated") }},
            id as event_id

        from source

    )

select *
from order_updated