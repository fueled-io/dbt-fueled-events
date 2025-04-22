{{ config(
    enabled = var('enable_user_attribution', true),
    materialized='view'
) }}

with first_touch_attribute as (
select  
  user_id,
  session_id,
  session_start,
  context_anonymous_id,
  context_session_id,
  context_fueled_external_id,
  {{ get_campaign_source('google_click_id',
    'facebook_click_id',
    'linkedin_click_id',
    'bing_click_id',
    'marketo_token',
    'context_campaign_source',
    'context_referrer') }} as session_first_touch_marketing_source,
  {{ get_marketing_medium('google_click_id',
    'facebook_click_id',
    'linkedin_click_id',
    'bing_click_id',
    'marketo_token',
    'floodlight_remarketing_id',
    'context_campaign_medium',
    'context_campaign_source',
    'context_referrer') }} as session_first_touch_marketing_medium
from {{ref("fueled_events_bronze_session_info_all")}}
where session_first_touch = 1 
),

last_touch_attribute as (
select  
  user_id,
  session_id,
  session_start,
  context_anonymous_id,
  context_session_id,
  context_fueled_external_id,
  {{ get_campaign_source('google_click_id',
    'facebook_click_id',
    'linkedin_click_id',
    'bing_click_id',
    'marketo_token',
    'context_campaign_source',
    'context_referrer') }} as session_last_touch_marketing_source,
  {{ get_marketing_medium('google_click_id',
    'facebook_click_id',
    'linkedin_click_id',
    'bing_click_id',
    'marketo_token',
    'floodlight_remarketing_id',
    'context_campaign_medium',
    'context_campaign_source',
    'context_referrer') }} as session_last_touch_marketing_medium
from {{ref("fueled_events_bronze_session_info_all")}}
where session_last_touch = 1 
)

select
  coalesce(ftt.user_id, ltt.user_id) as user_id,
  coalesce(ftt.session_id, ltt.session_id) as session_id,
  coalesce(ftt.session_start, ltt.session_start) as session_start,
  coalesce(ftt.context_anonymous_id, ltt.context_anonymous_id) as context_anonymous_id,
  coalesce(ftt.context_session_id, ltt.context_session_id) as context_session_id,
  coalesce(ftt.context_fueled_external_id, ltt.context_fueled_external_id) as context_fueled_external_id,  
  session_first_touch_marketing_source,
  session_last_touch_marketing_source,
  session_first_touch_marketing_medium,
  session_last_touch_marketing_medium
from first_touch_attribute as ftt  
full outer join last_touch_attribute as ltt
  on ftt.session_id = ltt.session_id
  