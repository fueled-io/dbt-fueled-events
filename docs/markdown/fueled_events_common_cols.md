{% docs col__hash %} URL parameters after a hashtag. {% enddocs %}
{% docs col_address_address %} Street address. {% enddocs %}
{% docs col_address_city %} Address city. {% enddocs %}
{% docs col_address_company %} Company name on address (optional). {% enddocs %}
{% docs col_address_country %} Address country. {% enddocs %}
{% docs col_address_country_code %} Address country code. {% enddocs %}
{% docs col_address_email %} Email address associated with an address block. {% enddocs %}
{% docs col_address_first_name %} First name on an address block. {% enddocs %}
{% docs col_address_last_name %} Last name on an address block. {% enddocs %}
{% docs col_address_phone %} Phone number on an address block. {% enddocs %}
{% docs col_address_postal_code %} Address Postal code. {% enddocs %}
{% docs col_address_state %} Address state. {% enddocs %}
{% docs col_address_street %} Street address on an address block. {% enddocs %}
{% docs col_addresses %} Addresses array. {% enddocs %}
{% docs col_affiliation %} The source of an order or checkout: `web`, `pos` (point of sale), `recurring subscription`, etc. {% enddocs %}
{% docs col_anonymous_id %} The website visitor's anonymous ID passed on all events. Can be used to stitch a session. {% enddocs %}
{% docs col_billing_address_address %} Billing address street address. {% enddocs %}
{% docs col_billing_address_city %} Billing address city. {% enddocs %}
{% docs col_billing_address_company %} Company name on a billing address (optional). {% enddocs %}
{% docs col_billing_address_country %} Billing address country. {% enddocs %}
{% docs col_billing_address_country_code %} Billing address country code. {% enddocs %}
{% docs col_billing_address_email %} Email address associated with a billing address block. {% enddocs %}
{% docs col_billing_address_first_name %} First name associated with a billing address block. {% enddocs %}
{% docs col_billing_address_last_name %} Last name associated with a billing address block. {% enddocs %}
{% docs col_billing_address_phone %} Phone number associated with a billing address block. {% enddocs %}
{% docs col_billing_address_postal_code %} Billing address postal code. {% enddocs %}
{% docs col_billing_address_street %} Street address associated with a billing address block. {% enddocs %}
{% docs col_billing_address_state %} State associated with a billing address block. {% enddocs %}
{% docs col_brand %} A brand, usually associated with a specific product. {% enddocs %}
{% docs col_cart_id %} The `cart_id` associated with a shopping cart. Used to link client-side shopping engagement with server-side checkout and order tracking.{% enddocs %}
{% docs col_category %} A product collectino or category. {% enddocs %}
{% docs col_channel %} Identifies the source of the event. Permitted values are `mobile`, `web`, `server` and `sources`. {% enddocs %}
{% docs col_charge_interval_frequency %} ReCharge charge interval frequency. {% enddocs %}
{% docs col_checkout_id %} The `checkout_id` associated with a purchase. For Shopify, this is identical to the `cart_id`. For BigCommerce, this is distinct from the `cart_id`. {% enddocs %}
{% docs col_context_anonymous_id %} The website visitor's anonymous ID passed on all events. Can be used to stitch a session. {% enddocs %}
{% docs col_context_app %} Example: `client-analytics` {% enddocs %}
{% docs col_context_campaign_content %} Parsed from UTM codes on the associated client-side event. {% enddocs %}
{% docs col_context_campaign_gclid %} The Google Click Identifier associated with a visit from a paid Google Ad. {% enddocs %}
{% docs col_context_campaign_id %} Parsed from UTM codes on the associated client-side event. {% enddocs %}
{% docs col_context_campaign_medium %} Parsed from UTM codes on the associated client-side event. {% enddocs %}
{% docs col_context_campaign_name %} Parsed from UTM codes on the associated client-side event. {% enddocs %}
{% docs col_context_campaign_profile %} Parsed from UTM codes on the associated client-side event. {% enddocs %}
{% docs col_context_campaign_source %} Parsed from UTM codes on the associated client-side event. {% enddocs %}
{% docs col_context_campaign_term %} Parsed from UTM codes on the associated client-side event. {% enddocs %}
{% docs col_context_client_id %} Google Client ID - Pulled in if Fueled's Google Analytics 4 connector is enabled. {% enddocs %}
{% docs col_context_debug %} Debugging model on client-side events. {% enddocs %}
{% docs col_context_destination_id %} Destination ID from RudderStack adaptor. {% enddocs %}
{% docs col_context_destination_type %} Destination Type from RudderStack adaptor. {% enddocs %}
{% docs col_context_initialized %} Indicates that the library has been initiated. {% enddocs %}
{% docs col_context_ip %} Website visitor's IP address. {% enddocs %}
{% docs col_context_library_name %} RudderStack library name. {% enddocs %}
{% docs col_context_library_version %} RudderStack library version. {% enddocs %}
{% docs col_context_locale %} The website visitor's locale. Example: `en-US`. {% enddocs %}
{% docs col_context_offline %} Indicator of an offline event (not generally applicable). {% enddocs %}
{% docs col_context_os_name %} The OS of the website visitor's device. {% enddocs %}
{% docs col_context_page_hash %} URL parameters after a hashtag. {% enddocs %}
{% docs col_context_page_height %} The page height. {% enddocs %}
{% docs col_context_page_path %} The path of the page URL. {% enddocs %}
{% docs col_context_page_referrer %} Referrer for the client-side event. {% enddocs %}
{% docs col_context_page_search %} The search string at the end of the URL. {% enddocs %}
{% docs col_context_page_title %} The page title. {% enddocs %}
{% docs col_context_page_url %} The page URL. {% enddocs %}
{% docs col_context_page_width %} The width of the page. {% enddocs %}
{% docs col_context_passed_ip %} An IP address passed through the domain proxy. Represents the original site visitor's IP address. {% enddocs %}
{% docs col_context_referrer %} Referrer for the client-side event.  {% enddocs %}
{% docs col_context_request_ip %} The IP address associated with the event request. (Not generally used.) {% enddocs %}
{% docs col_context_rudderstack_source %} The RudderStack source adaptor. {% enddocs %}
{% docs col_context_session_id %} The Google Analytics 4 Session ID (when available). {% enddocs %}
{% docs col_context_source %} Event source. {% enddocs %}
{% docs col_context_source_id %} Event source ID. {% enddocs %}
{% docs col_context_source_type %} Event source type. {% enddocs %}
{% docs col_context_timezone %} The timezone of the site visitor's web browser. {% enddocs %}
{% docs col_context_user_agent %} The user agent for the website visito. {% enddocs %}
{% docs col_coupon %} A coupon associated with a checkout or purchase. {% enddocs %}
{% docs col_created_at %} `created_at` can have different meanings on different event types. For subscription events, it refers to when the subscription started. For users, it represents when a user account was created. {% enddocs %}
{% docs col_currency %} The currency associated with an eCommerce event. {% enddocs %}
{% docs col_discount %} A discount associated with a checkout or purchase-related event. {% enddocs %}
{% docs col_email %} A user's email address. {% enddocs %}
{% docs col_ended_at %} The timestamp associated with a subscription (ReCharge Payments) ended. {% enddocs %}
{% docs col_end_reason %} The reason that a subscription (ReCharge Payments) ended. {% enddocs %}
{% docs col_event %} The type of event - machine-readable. {% enddocs %}
{% docs col_event_text %} The type of event - human-readable. {% enddocs %}
{% docs col_external_customer_id %} An external customer ID, such as a Shopify Customer ID or BigCommerce Customer ID. {% enddocs %}
{% docs col_first_name %} A user's first name. {% enddocs %}
{% docs col_has_queued_charges %} Indicates that a subscription (ReCharge Payments) has queued charges. {% enddocs %}
{% docs col_height %} The page height. {% enddocs %}
{% docs col_id %} The event ID - a unique ID for each event. {% enddocs %}
{% docs col_image_url %} The primary image URL associated with a product. {% enddocs %}
{% docs col_is_skippable %} Indicates that a subscription is "skippable." {% enddocs %}
{% docs col_is_swappable %} Indicates that a subscription is "swappable." {% enddocs %}
{% docs col_last_name %} A user's last name. {% enddocs %}
{% docs col_list_id %} The ID of a collection/product category. {% enddocs %}
{% docs col_loaded_at %} The timestamp representing when an event was loaded into the warehouse. {% enddocs %}
{% docs col_max_retries_reached %} An indicator that the maximum number of retries on a subscription billing event have been reached. {% enddocs %}
{% docs col_name %} `name` can mean different things in different contexts. Can be the `name` of a web page that's been viewed. Can be the full name of a user. {% enddocs %}
{% docs col_next_charge_scheduled_at %} Timestamp for when the next charge (ReCharge Payments) has been scheduled. {% enddocs %}
{% docs col_order_discount %} The discount on an order. {% enddocs %}
{% docs col_order_id %} An order's Order ID. {% enddocs %}
{% docs col_order_billing_address_address %} Billing street address on an order. {% enddocs %}
{% docs col_order_billing_address_city %} Billing city on an order. {% enddocs %}
{% docs col_order_billing_address_company %} Company associated with the address on an order. {% enddocs %}
{% docs col_order_billing_address_country %} The country associated with the billing address on an order. {% enddocs %}
{% docs col_order_billing_address_country_code %} The country code associated with the billing address on an order. {% enddocs %}
{% docs col_order_billing_address_email %} The email address associated with the billing address on an order. {% enddocs %}
{% docs col_order_billing_address_first_name %} The first name associated with the billing address on an order. {% enddocs %}
{% docs col_order_billing_address_last_name %} The last name associated with the billing address on an order. {% enddocs %}
{% docs col_order_billing_address_phone %} The phone number associated with the billing address on an order. {% enddocs %}
{% docs col_order_billing_address_postal_code %} The postal code associated with the billing address on an order. {% enddocs %}
{% docs col_order_billing_address_street %} The street address associated with the billing address on an order. {% enddocs %}
{% docs col_order_billing_address_state %} The state associated with a billing address on an order. {% enddocs %}
{% docs col_order_cart_id %} The `cart_id` on an order. {% enddocs %}
{% docs col_order_coupon %} The coupon on an order. {% enddocs %}
{% docs col_order_currency %} The currency code on an order. {% enddocs %}
{% docs col_order_interval_frequency %} The interveral frequency on a subscription. {% enddocs %}
{% docs col_order_interval_unit %} The unit (`days`, `weeks`, `months`) used for subscription order intervals. {% enddocs %}
{% docs col_order_order_id %} An order's Order ID. {% enddocs %}
{% docs col_order_products %} Products array on an order. {% enddocs %}
{% docs col_order_revenue %} Order revenue. {% enddocs %}
{% docs col_order_status %} The order's status. {% enddocs %}
{% docs col_order_subtotal %} The subtotal on an order. {% enddocs %}
{% docs col_order_tax %} The taxes on an order. {% enddocs %}
{% docs col_order_total %} The total value of an order. {% enddocs %}
{% docs col_order_type %} The type of order. {% enddocs %}
{% docs col_order_value %} The order value. {% enddocs %}
{% docs col_original_timestamp %} The original timestamp associated with a website visitor's initiation of a client-side event. {% enddocs %}
{% docs col_path %} The page path on a `page_view` event. {% enddocs %}
{% docs col_payment_type %} The payment method type on an order. {% enddocs %}
{% docs col_phone %} A user's phone number. {% enddocs %}
{% docs col_position %} The position of a product on a Collections page. {% enddocs %}
{% docs col_product_id %} The unique identifier for a product. {% enddocs %}
{% docs col_products %} The products array. {% enddocs %}
{% docs col_price %} The price of a product. {% enddocs %}
{% docs col_query %} The query string on a `products_searched` event. {% enddocs %}
{% docs col_quantity %} The quantity of products on an `add_to_cart` event, an order line item, etc. {% enddocs %}
{% docs col_received_at %} The timestamp of when the an event was received by Fueled's DataHub. {% enddocs %}
{% docs col_referrer %} The page referrer on a `page_view` event. {% enddocs %}
{% docs col_revenue %} The `revenue` on an order. {% enddocs %}
{% docs col_search %} The search string on a `page_view` event. {% enddocs %}
{% docs col_sent_at %} The timestamp of when an event was sent to Fueled's DataHub. {% enddocs %}
{% docs col_sku %} The SKU associated with a product. {% enddocs %}
{% docs col_sku_override %} A SKU override. {% enddocs %}
{% docs col_shipping %} The shipping costs charged to a shopper on an order. {% enddocs %}
{% docs col_started_at %} col_started_at {% enddocs %}
{% docs col_status %} Status {% enddocs %}
{% docs col_subtotal %} The subtotal of an order (does not include taxes or shipping.) {% enddocs %}
{% docs col_tax %} The taxes associated with an order. {% enddocs %}
{% docs col_timestamp %} Timestamp {% enddocs %}
{% docs col_title %} The page title on a `page_view` event. {% enddocs %}
{% docs col_total %} The `total` on an `order_completed` event. {% enddocs %}
{% docs col_type %} Type {% enddocs %}
{% docs col_updated_at %} The timestamp for when an event was updated. {% enddocs %}
{% docs col_url %} The page URL on a `page_view` event. {% enddocs %}
{% docs col_user_id %} The user ID of an identified website visitor or customer. Generally Fueled uses email for this ID. {% enddocs %}
{% docs col_uuid_ts %} The UUID timestamp {% enddocs %}
{% docs col_value %} `value` can mean different things in different contexts. On `product_viewed` or `product_added` events, it is the value of the product. {% enddocs %}
{% docs col_variant %} A product variant ID. {% enddocs %}
{% docs col_width %} The page width on a `page_view` event. {% enddocs %}