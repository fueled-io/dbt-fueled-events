{{ config(
    enabled = var('enable_product_list_viewed', true)
) }}

select  
  *,
  {{ get_campaign_source('google_click_id',
    'facebook_click_id',
    'linkedin_click_id',
    'bing_click_id',
    'marketo_token',
    'context_campaign_source',
    'context_referrer') }} as marketing_source,
  {{ get_marketing_medium('google_click_id',
    'facebook_click_id',
    'linkedin_click_id',
    'bing_click_id',
    'marketo_token',
    'floodlight_remarketing_id',
    'context_campaign_medium',
    'context_campaign_source',
    'context_referrer') }} as marketing_medium
from {{ref("fueled_events_bronze_product_list_viewed")}}