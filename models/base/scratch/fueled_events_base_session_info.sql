{{ config(
    enabled = var('user_attribution', true)
) }}


WITH events AS (
  SELECT
    context_anonymous_id,
    user_id,
    context_fueled_external_id,
    context_session_id,
    context_campaign_name,
    context_campaign_source,
    context_campaign_term,
    context_campaign_medium,
    {{  get_decoded_url('context_referrer')  }} as context_referrer,
    split({{  get_decoded_url('(context_page_url)')  }}, '?') [safe_offset(0)] as landing_page_url,
    {{  get_decoded_url('(context_page_url)')  }} as context_page_url,
    context_os_name,
    title,
    timestamp,
    -- Calculate the time difference between consecutive events
    timestamp - LAG(timestamp) OVER (PARTITION BY context_anonymous_id ORDER BY timestamp) AS time_diff
  FROM
    {{ source("fueled_events_atomic", "pages") }}
),
session_ids AS (
  SELECT
    *,
    IF(time_diff IS NULL OR time_diff > INTERVAL 60 MINUTE, 1, 0) AS new_session_flag
  FROM
    events
),
sessions AS (
  SELECT
    *,
    SUM(new_session_flag) OVER (PARTITION BY context_anonymous_id ORDER BY timestamp) AS session_id
  FROM
    session_ids
),

final as (
select
  * except(session_id),
  TO_HEX(MD5(CONCAT(context_anonymous_id, session_id))) AS session_id,
  min(timestamp) over(partition by context_anonymous_id, session_id) as session_start,
  max(timestamp) over(partition by context_anonymous_id, session_id) as session_end
from sessions  
order by context_anonymous_id, timestamp 
) 

select 
  * except(landing_page_url),
  case
  when landing_page_url like '%checkout%' then '{{ var('landing_page_checkout') }}'
  when landing_page_url like '%account%' then '{{ var('landing_page_account') }}'
  else landing_page_url
end as landing_page_url
from final
qualify row_number() over(partition by session_id order by timestamp asc) = 1

