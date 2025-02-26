{% macro get_attribution_click_ids(search_field) %}
    -- Macro: get_attribution_click_ids
    -- Purpose: Extract various campaign click IDs and marketing tokens from a URL search field.
    -- Input: `search_field` - A string field (e.g., query parameters from a URL) containing encoded marketing data.

    -- Extract Google Ads Click ID (gclid) from the URL query parameters.
    nullif(SPLIT(SPLIT({{ search_field }}, 'gclid=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS google_click_id,

    -- Extract Facebook Click ID (fbclid) from the URL query parameters.
    nullif(SPLIT(SPLIT({{ search_field }}, 'fbclid=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS facebook_click_id,

    -- Extract Marketo token (mkt_tok) from the URL query parameters.
    nullif(SPLIT(SPLIT({{ search_field }}, 'mkt_tok=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS marketo_token,

    -- Extract Bing Click ID (msclkid) from the URL query parameters.
    nullif(SPLIT(SPLIT({{ search_field }}, 'msclkid=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS bing_click_id,

    -- Extract LinkedIn Click ID (li_fat_id) from the URL query parameters.
    nullif(SPLIT(SPLIT({{ search_field }}, 'li_fat_id=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS linkedin_click_id,

    -- Extract Google Floodlight remarketing ID (dc_rdid) from the URL query parameters.
    nullif(SPLIT(SPLIT({{ search_field }}, 'dc_rdid=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS floodlight_remarketing_id,

    -- Extract Google Floodlight latitude (dc_lat) from the URL query parameters.
    nullif(SPLIT(SPLIT({{ search_field }}, 'dc_lat=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS floodlight_latitude,

    -- Extract DoubleClick Click ID (dclid) from the URL query parameters.
    nullif(SPLIT(SPLIT({{ search_field }}, 'dclid=')[SAFE_OFFSET(1)], '&')[SAFE_OFFSET(0)], '') AS doubleclick_click_id
{% endmacro %}
