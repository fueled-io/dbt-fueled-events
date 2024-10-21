{{ config(
    enabled = var('checkout_created', true)
) }}

select  
  *
from {{ref("fueled_events_base_checkout_created")}}