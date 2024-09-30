-- Needs some more work. Just stubbed out as of 9/6/24.

{% macro get_marketing_source(referring_site) %}
(
    SELECT
        CASE
            WHEN gclid IS NOT NULL THEN 'google'
            WHEN fbclid IS NOT NULL THEN 'meta'
            WHEN utm_source IS NOT NULL THEN utm_source
            WHEN REGEXP_SUBSTR(referrer_host, '([^\\.]+)\\.[a-z]+$') LIKE '%google%' THEN 'google'
            WHEN REGEXP_SUBSTR(referrer_host, '([^\\.]+)\\.[a-z]+$') LIKE '%bing%' THEN 'bing'
            WHEN REGEXP_SUBSTR(referrer_host, '([^\\.]+)\\.[a-z]+$') LIKE '%yahoo%' THEN 'yahoo'
            WHEN REGEXP_SUBSTR(referrer_host, '([^\\.]+)\\.[a-z]+$') LIKE '%duckduckgo%' THEN 'duckduckgo'
            WHEN REGEXP_SUBSTR(referrer_host, '([^\\.]+)\\.[a-z]+$') LIKE '%facebook%' THEN 'meta'
            WHEN REGEXP_SUBSTR(referrer_host, '([^\\.]+)\\.[a-z]+$') LIKE '%instagram%' THEN 'meta'
            WHEN {{ referring_site }} LIKE '%com.google.android.gm%' THEN 'gmail'
            WHEN referrer_host IS NULL THEN 'direct'
            ELSE REGEXP_REPLACE(referrer_host, '^www\\.', '')
        END AS marketing_source
    FROM (
        SELECT
            SAFE_CAST(
                SPLIT(
                    SPLIT(
                        REPLACE(
                            REPLACE(
                                REPLACE({{ referring_site }}, 'android-app://', ''),
                                'http://', ''
                            ),
                            'https://', ''
                        ),
                        '/'
                    )[SAFE_OFFSET(0)], '?'
                )[SAFE_OFFSET(0)] AS STRING
            ) AS referrer_host,
            NULLIF(SPLIT(SPLIT({{ referring_site }}, 'utm_source=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS utm_source,
            NULLIF(SPLIT(SPLIT({{ referring_site }}, 'gclid=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS gclid,
            NULLIF(SPLIT(SPLIT({{ referring_site }}, 'fbclid=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS fbclid
    )
)
{% endmacro %}

{% macro get_marketing_medium(referring_site) %}
(
    SELECT
        CASE
            WHEN gclid IS NOT NULL THEN 'cpc'
            WHEN fbclid IS NOT NULL THEN 'cpc'
            WHEN utm_medium IS NOT NULL THEN utm_medium
            WHEN referrer_host IN ('google', 'bing', 'yahoo', 'duckduckgo') THEN 'organic search'
            WHEN referrer_host LIKE '%igshopping%' THEN 'cpd'
            WHEN referrer_host IN ('facebook', 'instagram', 'twitter', 'linkedin') THEN 'organic social'
            WHEN referrer_host IS NULL THEN 'none'
            ELSE 'referral'
        END AS marketing_medium
    FROM (
        SELECT
            SAFE_CAST(
                SPLIT(
                    SPLIT(
                        REPLACE(
                            REPLACE(
                                REPLACE({{ referring_site }}, 'android-app://', ''),
                                'http://', ''
                            ),
                            'https://', ''
                        ),
                        '/'
                    )[SAFE_OFFSET(0)], '?'
                )[SAFE_OFFSET(0)] AS STRING
            ) AS referrer_host,
            NULLIF(SPLIT(SPLIT({{ referring_site }}, 'utm_medium=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS utm_medium,
            NULLIF(SPLIT(SPLIT({{ referring_site }}, 'gclid=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS gclid,
            NULLIF(SPLIT(SPLIT({{ referring_site }}, 'fbclid=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS fbclid
    )
)
{% endmacro %}