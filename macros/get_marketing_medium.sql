{% macro get_marketing_medium(
    google_click_id,
    facebook_click_id,
    linkedin_click_id,
    bing_click_id,
    marketo_token,
    floodlight_remarketing_id,
    context_campaign_medium,
    context_campaign_source,
    context_referrer
) %}

CASE
    WHEN {{ google_click_id }} IS NOT NULL THEN 'cpc'         -- Google Ads
    WHEN {{ facebook_click_id }} IS NOT NULL THEN 'cpc'       -- Facebook Ads
    WHEN {{ linkedin_click_id }} IS NOT NULL THEN 'cpc'       -- LinkedIn Ads
    WHEN {{ bing_click_id }} IS NOT NULL THEN 'cpc'           -- Bing Ads
    WHEN {{ floodlight_remarketing_id }} IS NOT NULL THEN 'cpc'  -- Google Floodlight

    WHEN {{ marketo_token }} IS NOT NULL THEN 'email'         -- Marketo Email Campaign
    WHEN {{ context_campaign_source }} = 'mkto-fallback' THEN 'email'
    WHEN {{ context_campaign_medium }} = 'email' THEN 'email'
    WHEN {{ context_campaign_medium }} = 'em' THEN 'email'

    WHEN {{ context_campaign_medium }} IS NOT NULL THEN {{ context_campaign_medium }}

    WHEN (
      STRPOS({{ context_referrer }}, 'google')    > 0 OR
      STRPOS({{ context_referrer }}, 'bing')      > 0 OR
      STRPOS({{ context_referrer }}, 'yahoo')     > 0 OR
      STRPOS({{ context_referrer }}, 'duckduckgo')> 0
    ) THEN 'organic search'

    WHEN (
      STRPOS({{ context_referrer }}, 'facebook')  > 0 OR
      STRPOS({{ context_referrer }}, 'instagram') > 0 OR
      STRPOS({{ context_referrer }}, 'twitter')   > 0 OR
      STRPOS({{ context_referrer }}, 'linkedin')  > 0
    ) THEN 'organic social'

    WHEN {{ context_referrer }} IS NULL
      OR STRPOS({{ context_referrer }}, 'diligent') > 0 THEN 'direct'

    ELSE 'referral'
END

{% endmacro %}
