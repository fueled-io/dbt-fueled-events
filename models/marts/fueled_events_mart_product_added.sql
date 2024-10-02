with product_added as (
select
  *
from {{ ref('fueled_events_intermediate_product_added') }}
),

session_info as (
select
  *
from {{ ref('fueled_events_intermediate_session_info') }}
)

select 
  s.session_id,
  pa.*,
  s.marketing_source as session_marketing_soure,
  s.marketing_medium as session_marketing_medium
from product_added as pa  
left join session_info as s
  on pa.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by pa.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(pa.original_timestamp))) = 1