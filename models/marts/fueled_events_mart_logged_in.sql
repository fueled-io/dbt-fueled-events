with logged_in as (
select
  *
from {{ ref('fueled_events_intermediate_logged_in') }}
),

session_info as (
select
  *
from {{ ref('fueled_events_intermediate_session_info') }}
)

select 
  s.session_id,
  li.*,
  s.marketing_source as session_marketing_soure,
  s.marketing_medium as session_marketing_medium
from logged_in as li
left join session_info as s
  on li.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by li.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(li.original_timestamp))) = 1