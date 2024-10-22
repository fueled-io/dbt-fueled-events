{{ config(
    enabled = var('enable_cart_viewed', true)
) }}

select 
  s.session_id,
  cv.*,
  s.marketing_source as session_marketing_soure,
  s.marketing_medium as session_marketing_medium
from {{ ref('fueled_events_intermediate_cart_viewed') }} as cv
left join {{ ref('fueled_events_intermediate_session_info') }} as s
  on cv.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by cv.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(cv.original_timestamp))) = 1