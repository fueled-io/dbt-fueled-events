{{ config(
    enabled = var('enable_user_attribution', true)
) }}


WITH sessions AS (
  SELECT
   *
  FROM
    {{ref("fueled_events_bronze_session_info_all")}}
)

select  
  *
from sessions
where session_first_touch = 1

