{{ config(
    enabled = var('enable_logged_in', true)
) }}

select 
  s.session_id,
  li.*,
  s.session_first_touch_marketing_source,
  s.session_last_touch_marketing_source,
  s.session_first_touch_marketing_medium,
  s.session_last_touch_marketing_medium
from {{ ref('fueled_events_silver_logged_in') }} as li
left join {{ ref('fueled_events_silver_session_touch_level_attributes') }} as s
  on li.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by li.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(li.original_timestamp))) = 1