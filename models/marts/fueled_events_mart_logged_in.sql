{{ config(
    enabled = var('logged_in', true)
) }}

select 
  s.session_id,
  li.*,
  s.marketing_source as session_marketing_soure,
  s.marketing_medium as session_marketing_medium
from {{ ref('fueled_events_intermediate_logged_in') }} as li
left join {{ ref('fueled_events_intermediate_session_info') }} as s
  on li.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by li.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(li.original_timestamp))) = 1