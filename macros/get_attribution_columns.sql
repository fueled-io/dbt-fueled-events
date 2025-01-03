{% macro get_attribution_colmns(referring_site) %}
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
        NULLIF(SPLIT(SPLIT({{ referring_site }}, 'utm_medium=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS utm_medium,
        NULLIF(SPLIT(SPLIT({{ referring_site }}, 'gclid=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS gclid,
        NULLIF(SPLIT(SPLIT({{ referring_site }}, 'fbclid=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS fbclid
{% endmacro %}
