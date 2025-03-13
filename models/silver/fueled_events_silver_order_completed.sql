{{ config(
    enabled = var('enable_order_completed', true)
) }}

select  
  *
from {{ref("fueled_events_bronze_order_completed")}}