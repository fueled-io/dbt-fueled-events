{{ config(
    enabled = var('enable_pages', true),
    materialized='table'
) }}

select 
  s.session_id as fueled_stitched_session_id,
  p.context_session_id as session_id,
  p.* EXCEPT (context_session_id),
  s.session_first_touch_marketing_source,
  s.session_last_touch_marketing_source,
  s.session_first_touch_marketing_medium,
  s.session_last_touch_marketing_medium
from {{ ref('fueled_events_silver_pages') }} as p
left join {{ ref('fueled_events_silver_session_touch_level_attributes') }} as s
  on p.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by p.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(p.original_timestamp))) = 1