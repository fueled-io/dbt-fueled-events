{{ config(
    enabled = var('enable_product_viewed', true)
) }}

select 
  s.session_id,
  pv.*,
  s.session_first_touch_marketing_source,
  s.session_last_touch_marketing_source,
  s.session_first_touch_marketing_medium,
  s.session_last_touch_marketing_medium
from {{ ref('fueled_events_silver_product_viewed') }} as pv  
left join {{ ref('fueled_events_silver_session_touch_level_attributes') }} as s
  on pv.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by pv.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(pv.original_timestamp))) = 1