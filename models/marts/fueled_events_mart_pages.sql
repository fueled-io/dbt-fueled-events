with pages as (
select
  *
from {{ ref('fueled_events_intermediate_pages') }}
),

session_info as (
select
  *
from {{ ref('fueled_events_intermediate_session_info') }}
)

select 
  s.session_id,
  p.*,
  s.marketing_source as session_marketing_soure,
  s.marketing_medium as session_marketing_medium
from pages as p
left join session_info as s
  on p.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by p.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(p.original_timestamp))) = 1