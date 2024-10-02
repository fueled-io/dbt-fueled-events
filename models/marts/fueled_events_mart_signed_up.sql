with signed_up as (
select
  *
from {{ ref('fueled_events_intermediate_signed_up') }}
),

session_info as (
select
  *
from {{ ref('fueled_events_intermediate_session_info') }}
)

select 
  s.session_id,
  su.*,
  s.marketing_source as session_marketing_soure,
  s.marketing_medium as session_marketing_medium
from signed_up as su
left join session_info as s
  on su.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by su.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(su.original_timestamp))) = 1