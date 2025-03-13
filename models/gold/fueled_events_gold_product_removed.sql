{{ config(
    enabled = var('enable_product_removed', true)
) }}

select 
  s.session_id,
  pr.*,
  s.session_first_touch_marketing_source,
  s.session_last_touch_marketing_source,
  s.session_first_touch_marketing_medium,
  s.session_last_touch_marketing_medium
from {{ ref('fueled_events_silver_product_removed') }} as pr
left join {{ ref('fueled_events_silver_session_touch_level_attributes') }} as s
  on pr.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by pr.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(pr.original_timestamp))) = 1