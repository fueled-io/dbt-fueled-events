{{ config(
    enabled = var('enable_checkout_created', true),
    materialized='view'
) }}

select  
  *
from {{ref("fueled_events_bronze_checkout_created")}}