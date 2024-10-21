{{ config(
    enabled = var('enable_order_completed', true)
) }}

select  
  *
from {{ref("fueled_events_base_order_completed")}}