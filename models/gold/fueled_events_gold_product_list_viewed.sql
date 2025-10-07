{{ config(
    enabled = var('enable_product_list_viewed', true),
    materialized='table'
) }}

select 
  s.session_id as fueled_stitched_session_id,
  plv.context_session_id as session_id,
  plv.* EXCEPT (context_session_id),
  s.session_first_touch_marketing_source,
  s.session_last_touch_marketing_source,
  s.session_first_touch_marketing_medium,
  s.session_last_touch_marketing_medium
from {{ ref('fueled_events_silver_product_list_viewed') }} as plv
left join {{ ref('fueled_events_silver_session_touch_level_attributes') }} as s
  on plv.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by plv.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(plv.original_timestamp))) = 1