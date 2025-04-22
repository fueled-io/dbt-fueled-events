{{ config(
    enabled = var('enable_products_searched', true),
    materialized='table'
) }}

select 
  s.session_id,
  ps.*,
  s.session_first_touch_marketing_source,
  s.session_last_touch_marketing_source,
  s.session_first_touch_marketing_medium,
  s.session_last_touch_marketing_medium
from {{ ref('fueled_events_silver_products_searched') }} as ps  
left join {{ ref('fueled_events_silver_session_touch_level_attributes') }} as s
  on ps.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by ps.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(ps.original_timestamp))) = 1