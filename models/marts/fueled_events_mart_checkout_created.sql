{{ config(
    enabled = var('enable_checkout_created', true)
) }}

select 
  *
from {{ ref('fueled_events_intermediate_checkout_created') }}
qualify row_number() over(partition by event_id order by original_timestamp) = 1