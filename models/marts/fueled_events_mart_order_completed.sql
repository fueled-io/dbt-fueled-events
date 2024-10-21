{{ config(
    enabled = var('order_completed', true)
) }}

select 
  *
from {{ ref('fueled_events_intermediate_order_completed') }}
qualify row_number() over(partition by event_id order by original_timestamp) = 1