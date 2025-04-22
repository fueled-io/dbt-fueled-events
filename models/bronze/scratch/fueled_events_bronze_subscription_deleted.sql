{{
    config(
        enabled=false,
        materialized='ephemeral'
    )
}}

with
    source as (

        select * from {{ source("fueled_events_atomic", "subscription_deleted") }}

    ),

    subscription_deleted as (select * from source)

select *
from subscription_deleted
