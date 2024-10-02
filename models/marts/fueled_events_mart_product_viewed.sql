with product_viewed as (
select
  *
from {{ ref('fueled_events_intermediate_product_viewed') }}
),

session_info as (
select
  *
from {{ ref('fueled_events_intermediate_session_info') }}
)

select 
  s.session_id,
  pv.*,
  s.marketing_source as session_marketing_soure,
  s.marketing_medium as session_marketing_medium
from product_viewed as pv  
left join session_info as s
  on pv.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by pv.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(pv.original_timestamp))) = 1