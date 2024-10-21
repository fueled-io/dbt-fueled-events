{{ config(
    enabled = var('cart_viewed', true)
) }}

select  
  *,
  {{ get_marketing_source('context_referrer') }} as marketing_source,
  {{ get_marketing_medium('context_referrer') }} as marketing_medium
from {{ref("fueled_events_base_cart_viewed")}}