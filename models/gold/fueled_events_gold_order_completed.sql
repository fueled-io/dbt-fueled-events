{{ config(
    enabled = var('enable_order_completed', true)
) }}

select 
  s.session_id,
  oc.*,
  s.marketing_source as session_marketing_soure,
  s.marketing_medium as session_marketing_medium
from {{ ref('fueled_events_silver_order_completed') }} oc
left join {{ ref('fueled_events_silver_session_info') }} as s
  on oc.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by oc.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(oc.original_timestamp))) = 1
