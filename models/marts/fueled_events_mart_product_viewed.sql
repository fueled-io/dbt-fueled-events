{{ config(
    enabled = var('enable_product_viewed', true)
) }}

select 
  s.session_id,
  pv.*,
  s.marketing_source as session_marketing_soure,
  s.marketing_medium as session_marketing_medium
from {{ ref('fueled_events_intermediate_product_viewed') }} as pv  
left join {{ ref('fueled_events_intermediate_session_info') }} as s
  on pv.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by pv.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(pv.original_timestamp))) = 1