with product_list_viewed as (
select
  *
from {{ ref('fueled_events_intermediate_product_list_viewed') }}
),

session_info as (
select
  *
from {{ ref('fueled_events_intermediate_session_info') }}
)

select 
  s.session_id,
  plv.*,
  s.marketing_source as session_marketing_soure,
  s.marketing_medium as session_marketing_medium
from product_list_viewed as plv
left join session_info as s
  on plv.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by plv.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(plv.original_timestamp))) = 1