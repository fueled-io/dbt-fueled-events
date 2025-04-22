{{ config(
    enabled = var('enable_order_completed', true),
    materialized='view'
) }}

select  
  *
from {{ref("fueled_events_bronze_order_completed")}}