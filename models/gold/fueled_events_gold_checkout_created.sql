{{ config(
    enabled = var('enable_checkout_created', true),
    materialized = 'table'
) }}


select 
  s.session_id,
  cc.*,
  s.session_first_touch_marketing_source,
  s.session_last_touch_marketing_source,
  s.session_first_touch_marketing_medium,
  s.session_last_touch_marketing_medium
from {{ ref('fueled_events_silver_checkout_created') }} as cc
left join {{ ref('fueled_events_silver_session_touch_level_attributes') }} as s
  on cc.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by cc.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(cc.original_timestamp))) = 1
