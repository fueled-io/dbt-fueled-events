{{ config(
    materialized='ephemeral'
) }}

{% if var('include_s3_destination_data', false) %}

SELECT
  -- Select only the columns needed for fueled_events_bronze_order_completed.sql
  affiliation,
  JSON_VALUE(properties, '$.billingAddress.address') AS billing_address_address,
  JSON_VALUE(properties, '$.billingAddress.city') AS billing_address_city,
  JSON_VALUE(properties, '$.billingAddress.company') AS billing_address_company,
  JSON_VALUE(properties, '$.billingAddress.country') AS billing_address_country,
  JSON_VALUE(properties, '$.billingAddress.firstName') AS billing_address_first_name,
  JSON_VALUE(properties, '$.billingAddress.lastName') AS billing_address_last_name,
  JSON_VALUE(properties, '$.billingAddress.phone') AS billing_address_phone,
  JSON_VALUE(properties, '$.billingAddress.postalCode') AS billing_address_postal_code,
  JSON_VALUE(properties, '$.billingAddress.state') AS billing_address_state,
  JSON_VALUE(properties, '$.cartId') AS cart_id,
  JSON_VALUE(properties, '$.coupon') AS coupon,
  JSON_VALUE(properties, '$.currency') AS currency,
  CAST(JSON_VALUE(properties, '$.discount') AS FLOAT64) AS discount,
  'Order Completed' AS event_text,
  JSON_VALUE(properties, '$.id') AS order_id,
  JSON_VALUE(properties, '$.payment_type') AS payment_type,
  JSON_EXTRACT(properties, '$.products') AS products,
  CAST(JSON_VALUE(properties, '$.total') AS FLOAT64) AS revenue,
  CAST(JSON_VALUE(properties, '$.shipping') AS FLOAT64) AS shipping,
  JSON_VALUE(properties, '$.status') AS status,
  CAST(JSON_VALUE(properties, '$.subtotal') AS FLOAT64) AS subtotal,
  CAST(JSON_VALUE(properties, '$.tax') AS FLOAT64) AS tax,
  CAST(JSON_VALUE(properties, '$.total') AS FLOAT64) AS total,
  JSON_VALUE(properties, '$.type') AS type,
  CAST(JSON_VALUE(properties, '$.total') AS FLOAT64) AS value,
  COALESCE(JSON_VALUE(context, '$.fueledExternalId'), JSON_VALUE(context, '$.anonymousId')) AS anonymous_id,
  userId AS user_id,
  TIMESTAMP_SECONDS(original_timestamp) as original_timestamp,
  -- Include all context_* columns that would come from the get_shared_event_attributes macro
  JSON_VALUE(context, '$.anonymousId') AS context_anonymous_id,
  JSON_VALUE(context, '$.campaign.content') AS context_campaign_content,
  JSON_VALUE(context, '$.campaign.id') AS context_campaign_id,
  JSON_VALUE(context, '$.campaign.klaviyoId') AS context_campaign_klaviyo_id,
  JSON_VALUE(context, '$.campaign.medium') AS context_campaign_medium,
  JSON_VALUE(context, '$.campaign.name') AS context_campaign_name,
  JSON_VALUE(context, '$.campaign.source') AS context_campaign_source,
  JSON_VALUE(context, '$.campaign.term') AS context_campaign_term,
  JSON_VALUE(context, '$.countryCode') AS context_country_code,
  JSON_VALUE(context, '$.fb.externalId') AS context_fb_external_id,
  JSON_VALUE(context, '$.fb.fbc') AS context_fb_fbc,
  JSON_VALUE(context, '$.fb.fbp') AS context_fb_fbp,
  JSON_VALUE(context, '$.fueledExternalId') AS context_fueled_external_id,
  JSON_VALUE(context, '$.ga4.clientId') AS context_ga4_client_id,
  JSON_VALUE(context, '$.ga4.sessionId') AS context_ga4_session_id,
  JSON_VALUE(context, '$.ga4.userId') AS context_ga4_user_id,
  JSON_VALUE(context, '$.ga4.clientId') AS context_ga_4_client_id,
  JSON_VALUE(context, '$.ga4.sessionId') AS context_ga_4_session_id,
  JSON_VALUE(context, '$.ga4.userId') AS context_ga_4_user_id,
  JSON_VALUE(context, '$.ip') AS context_ip,
  JSON_VALUE(context, '$.klaviyoExchangeId') AS context_klaviyo_exchange_id,
  JSON_VALUE(context, '$.locale') AS context_locale,
  JSON_VALUE(context, '$.os.name') AS context_os_name,
  JSON_VALUE(context, '$.referrer') AS context_referrer,
  JSON_VALUE(context, '$.sourceId') AS context_source_id,
  'S3' AS context_source_type,
  TRUE AS context_tracking_consent,
  CAST(JSON_VALUE(context, '$.trackingConsent.analytics') AS BOOL) AS context_tracking_consent_analytics,
  CAST(JSON_VALUE(context, '$.trackingConsent.marketing') AS BOOL) AS context_tracking_consent_marketing,
  CAST(JSON_VALUE(context, '$.trackingConsent.preferences') AS BOOL) AS context_tracking_consent_preferences,
  CAST(JSON_VALUE(context, '$.trackingConsent.saleOfData') AS BOOL) AS context_tracking_consent_sale_of_data,
  JSON_VALUE(context, '$.timezone') AS context_timezone,
  JSON_VALUE(context, '$.url') AS context_url,
  JSON_VALUE(context, '$.userAgent') AS context_user_agent,
  JSON_VALUE(context, '$.userId') AS context_user_id,
  JSON_VALUE(context, '$.version') AS context_version,
  JSON_VALUE(context, '$.library.version') AS context_library_version,
  JSON_VALUE(context, '$.library.name') AS context_library_name,
  sourceEndpointId AS context_endpoint_version,
  JSON_VALUE(context, '$.ip') AS context_passed_ip,
  source AS context_source,
  CAST(JSON_VALUE(context, '$.debug') AS BOOL) AS context_debug,
  JSON_VALUE(context, '$.app') AS context_app,
  JSON_VALUE(context, '$.request.ip') AS context_request_ip,
  JSON_VALUE(context, '$.ga4.sessionId') AS context_session_id,
  'BQ' AS context_destination_type,
  CAST(NULL AS STRING) AS context_destination_id,
  CAST(NULL AS STRING) AS context_rudderstack_source,
  CAST(NULL AS BOOL) AS context_offline,
  CAST(NULL AS BOOL) AS context_initialized,
  CAST(JSON_VALUE(context, '$.categoryPreferences.functional') AS BOOL) AS context_category_preferences_functional,
  CAST(JSON_VALUE(context, '$.categoryPreferences.dataSharing') AS BOOL) AS context_category_preferences_data_sharing,
  CAST(JSON_VALUE(context, '$.categoryPreferences.analytics') AS BOOL) AS context_category_preferences_analytics,
  CAST(JSON_VALUE(context, '$.categoryPreferences.advertising') AS BOOL) AS context_category_preferences_advertising,
  -- Add event_id as the last column (matching fueled_events_bronze_order_completed.sql)
  JSON_VALUE(properties, '$.id') AS event_id
FROM {{ source("s3_destination_fueled_events", "fueled_events") }}
WHERE event_name = 'Order Completed'

{% else %}

-- Return an empty result set with matching column structure when S3 data is disabled
SELECT
  -- Match the columns from the main query
  CAST(NULL AS STRING) AS affiliation,
  CAST(NULL AS STRING) AS billing_address_address,
  CAST(NULL AS STRING) AS billing_address_city,
  CAST(NULL AS STRING) AS billing_address_company,
  CAST(NULL AS STRING) AS billing_address_country,
  CAST(NULL AS STRING) AS billing_address_first_name,
  CAST(NULL AS STRING) AS billing_address_last_name,
  CAST(NULL AS STRING) AS billing_address_phone,
  CAST(NULL AS STRING) AS billing_address_postal_code,
  CAST(NULL AS STRING) AS billing_address_state,
  CAST(NULL AS STRING) AS cart_id,
  CAST(NULL AS STRING) AS coupon,
  CAST(NULL AS STRING) AS currency,
  CAST(NULL AS FLOAT64) AS discount,
  CAST(NULL AS STRING) AS event_text,
  CAST(NULL AS STRING) AS order_id,
  CAST(NULL AS STRING) AS payment_type,
  CAST(NULL AS STRING) AS products,
  CAST(NULL AS FLOAT64) AS revenue,
  CAST(NULL AS FLOAT64) AS shipping,
  CAST(NULL AS STRING) AS status,
  CAST(NULL AS FLOAT64) AS subtotal,
  CAST(NULL AS FLOAT64) AS tax,
  CAST(NULL AS FLOAT64) AS total,
  CAST(NULL AS STRING) AS type,
  CAST(NULL AS FLOAT64) AS value,
  CAST(NULL AS STRING) AS anonymous_id,
  CAST(NULL AS STRING) AS user_id,
  CAST(NULL AS TIMESTAMP) AS original_timestamp,
  -- Context fields that would come from get_shared_event_attributes
  CAST(NULL AS STRING) AS context_anonymous_id,
  CAST(NULL AS STRING) AS context_campaign_content,
  CAST(NULL AS STRING) AS context_campaign_id,
  CAST(NULL AS STRING) AS context_campaign_klaviyo_id,
  CAST(NULL AS STRING) AS context_campaign_medium,
  CAST(NULL AS STRING) AS context_campaign_name,
  CAST(NULL AS STRING) AS context_campaign_source,
  CAST(NULL AS STRING) AS context_campaign_term,
  CAST(NULL AS STRING) AS context_country_code,
  CAST(NULL AS STRING) AS context_fb_external_id,
  CAST(NULL AS STRING) AS context_fb_fbc,
  CAST(NULL AS STRING) AS context_fb_fbp,
  CAST(NULL AS STRING) AS context_fueled_external_id,
  CAST(NULL AS STRING) AS context_ga_4_client_id,
  CAST(NULL AS STRING) AS context_ga_4_session_id,
  CAST(NULL AS STRING) AS context_ga_4_user_id,
  CAST(NULL AS STRING) AS context_ip,
  CAST(NULL AS STRING) AS context_klaviyo_exchange_id,
  CAST(NULL AS STRING) AS context_locale,
  CAST(NULL AS STRING) AS context_os_name,
  CAST(NULL AS STRING) AS context_referrer,
  CAST(NULL AS STRING) AS context_source_id,
  CAST(NULL AS STRING) AS context_source_type,
  CAST(NULL AS BOOL) AS context_tracking_consent,
  CAST(NULL AS BOOL) AS context_tracking_consent_analytics,
  CAST(NULL AS BOOL) AS context_tracking_consent_marketing,
  CAST(NULL AS BOOL) AS context_tracking_consent_preferences,
  CAST(NULL AS BOOL) AS context_tracking_consent_sale_of_data,
  CAST(NULL AS STRING) AS context_timezone,
  CAST(NULL AS STRING) AS context_url,
  CAST(NULL AS STRING) AS context_user_agent,
  CAST(NULL AS STRING) AS context_user_id,
  CAST(NULL AS STRING) AS context_version,
  CAST(NULL AS STRING) AS context_library_version,
  CAST(NULL AS STRING) AS context_library_name,
  CAST(NULL AS STRING) AS context_endpoint_version,
  CAST(NULL AS STRING) AS context_passed_ip,
  CAST(NULL AS STRING) AS context_source,
  CAST(NULL AS BOOL) AS context_debug,
  CAST(NULL AS STRING) AS context_app,
  CAST(NULL AS STRING) AS context_request_ip,
  CAST(NULL AS STRING) AS context_session_id,
  CAST(NULL AS STRING) AS context_destination_type,
  CAST(NULL AS STRING) AS context_destination_id,
  CAST(NULL AS STRING) AS context_rudderstack_source,
  CAST(NULL AS BOOL) AS context_offline,
  CAST(NULL AS BOOL) AS context_initialized,
  CAST(NULL AS BOOL) AS context_category_preferences_functional,
  CAST(NULL AS BOOL) AS context_category_preferences_data_sharing,
  CAST(NULL AS BOOL) AS context_category_preferences_analytics,
  CAST(NULL AS BOOL) AS context_category_preferences_advertising,
  -- event_id as the last column
  CAST(NULL AS STRING) AS event_id
FROM (SELECT 1) as dummy
WHERE FALSE

{% endif %}