{{ config(
    materialized='ephemeral'
) }}
with
    source as (select * from {{ source("fueled_events_atomic", "users") }}),

    users as (

        select
            address_city,
            address_country_code,
            address_postal_code,
            address_state,
            address_street,
            addresses,
            created_at,
            email,
            external_customer_id,
            first_name,
            last_name,
            name,
            phone,
            coalesce(context_fueled_external_id, context_anonymous_id) as anonymous_id,
            id as user_id
            {{ get_shared_event_attributes("fueled_events_atomic", "users") }},

        from source

    )

select *
from users
