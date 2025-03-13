{{ config(
    enabled = var('enable_order_completed', true)
) }}

with purchase as(
select 
  s.session_id,
  oc.*,
  s.session_first_touch_marketing_source,
  s.session_last_touch_marketing_source,
  s.session_first_touch_marketing_medium,
  s.session_last_touch_marketing_medium
from {{ ref('fueled_events_silver_order_completed') }} oc
left join {{ ref('fueled_events_silver_session_touch_level_attributes') }} as s
  on oc.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by oc.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(oc.original_timestamp))) = 1
)

select  
  *,
  first_value(session_first_touch_marketing_source) over(partition by anonymous_id order by original_timestamp asc) as first_purchase_session_first_touch_marketing_source,
  first_value(session_last_touch_marketing_source) over(partition by anonymous_id order by original_timestamp asc) as first_purchase_session_last_touch_marketing_source,
  first_value(session_first_touch_marketing_medium) over(partition by anonymous_id order by original_timestamp asc) as first_purchase_session_first_touch_marketing_medium,
  first_value(session_last_touch_marketing_medium) over(partition by anonymous_id order by original_timestamp asc) as first_purchase_session_last_touch_marketing_medium
from purchase
