{{ config(
    enabled = var('enable_user_attribution', true)
) }}

WITH ranked_sessions AS (
    SELECT
        context_anonymous_id,
        session_id,
        marketing_source,
        marketing_medium,
        timestamp,
        ROW_NUMBER() OVER (PARTITION BY context_anonymous_id ORDER BY timestamp ASC) AS first_row,
        ROW_NUMBER() OVER (PARTITION BY context_anonymous_id ORDER BY timestamp DESC) AS last_row
    FROM {{ref("fueled_events_intermediate_session_info")}}
)
SELECT
    context_anonymous_id,
    MAX(CASE WHEN first_row = 1 THEN session_id END) AS first_session_id,
    MAX(CASE WHEN last_row = 1 THEN session_id END) AS last_session_id,
    MAX(CASE WHEN first_row = 1 THEN marketing_source END) AS first_touch_marketing_source,
    MAX(CASE WHEN last_row = 1 THEN marketing_source END) AS last_touch_marketing_source,
    MAX(CASE WHEN first_row = 1 THEN marketing_medium END) AS first_touch_marketing_medium,
    MAX(CASE WHEN last_row = 1 THEN marketing_medium END) AS last_touch_marketing_medium
FROM
    ranked_sessions
GROUP BY
    context_anonymous_id
