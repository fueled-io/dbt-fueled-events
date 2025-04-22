{{ config(
    enabled = var('enable_cart_viewed', true),
    materialized='table'
) }}

select 
  s.session_id,
  cv.*,
  s.session_first_touch_marketing_source,
  s.session_last_touch_marketing_source,
  s.session_first_touch_marketing_medium,
  s.session_last_touch_marketing_medium
from {{ ref('fueled_events_silver_cart_viewed') }} as cv
left join {{ ref('fueled_events_silver_session_touch_level_attributes') }} as s
  on cv.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by cv.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(cv.original_timestamp))) = 1