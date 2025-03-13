{% macro get_campaign_source(
    google_click_id,
    facebook_click_id,
    linkedin_click_id,
    bing_click_id,
    marketo_token,
    context_campaign_source,
    context_referrer
) %}

CASE
    -- Paid Campaigns: Events with specific paid advertising click IDs are mapped to their respective platforms.
    WHEN {{ bing_click_id }} IS NOT NULL THEN 'bing'
    WHEN {{ linkedin_click_id }} IS NOT NULL THEN 'linkedin'
    WHEN {{ google_click_id }} IS NOT NULL THEN 'google'
    WHEN {{ facebook_click_id }} IS NOT NULL THEN 'facebook'

    -- Email Campaigns: Events related to email campaigns are identified based on tracking tokens or campaign sources.
    WHEN {{ marketo_token }} IS NOT NULL THEN 'email'
    WHEN {{ context_campaign_source }} IN (
        'mailchimp', 'campaign-monitor', 'hubspot', 'constant-contact', 
        'marketo', 'email', 'mkto-fallback', 'eblast'
    ) THEN 'email'
    WHEN STRPOS({{ context_campaign_source }}, 'email') > 0 THEN 'email'

    -- UTM Source Override: Use the `context_campaign_source` UTM parameter if it is available.
    WHEN {{ context_campaign_source }} IS NOT NULL THEN {{ context_campaign_source }}

    -- Organic Sources: Referring domains from known search engines or social platforms are mapped accordingly.
    WHEN STRPOS({{ context_referrer }}, 'google') > 0 THEN 'google'
    WHEN STRPOS({{ context_referrer }}, 'bing') > 0 THEN 'bing'
    WHEN STRPOS({{ context_referrer }}, 'yahoo') > 0 THEN 'yahoo'
    WHEN STRPOS({{ context_referrer }}, 'duckduckgo') > 0 THEN 'duckduckgo'
    WHEN STRPOS({{ context_referrer }}, 'facebook') > 0 THEN 'facebook'
    WHEN STRPOS({{ context_referrer }}, 'instagram') > 0 THEN 'instagram'
    WHEN STRPOS({{ context_referrer }}, 'twitter') > 0 THEN 'twitter'
    WHEN STRPOS({{ context_referrer }}, 'linkedin') > 0 THEN 'linkedin'

    -- Direct Traffic: Classify events as 'direct' if there is no referring domain or it matches internal domains.
    WHEN {{ context_referrer }} IS NULL
      OR STRPOS({{ context_referrer }}, 'diligent') > 0 THEN 'direct'

    -- Referral Traffic: For all other cases, default to the full referring domain.
    ELSE {{ context_referrer }}
END

{% endmacro %}
