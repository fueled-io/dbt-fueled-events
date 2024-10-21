{{ config(
    enabled = var('enable_products_searched', true)
) }}

select 
  s.session_id,
  ps.*,
  s.marketing_source as session_marketing_soure,
  s.marketing_medium as session_marketing_medium
from {{ ref('fueled_events_intermediate_products_searched') }} as ps  
left join {{ ref('fueled_events_intermediate_session_info') }} as s
  on ps.anonymous_id = s.context_anonymous_id 
qualify row_number() over(partition by ps.event_id order by abs(UNIX_SECONDS(s.session_start)-UNIX_SECONDS(ps.original_timestamp))) = 1