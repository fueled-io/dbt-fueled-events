{% docs table_base_cart_viewed %}
    Client-side event. (Note: for now, only fires on the main cart page. Side carts are not supported out out-of-the-box at this time, but can be supported with a small amount of client-side javascript customizations.)
{% enddocs %}

{% docs table_base_checkout_created %}
    Generally a server-side event - but our specification supports client-side implementations. The Fueled Event Attributes are pulled from the JSON payloads sent to Fueled's Datahub.
{% enddocs %}

{% docs table_base_checkout_updated %}
    A server-side event. Fueled Event Attributes are pulled from the JSON payloads sent to Fueled's Datahub.
{% enddocs %}

{% docs table_base_identifies %}
    `identify` events fire whenever a user is identified on a website by providing PII. This can happen at checkout, log in, a newsletter sign-up, and so forth. There are no standard identify “traits”, other than a `user_id` and an `anonyous_id`, which are used together to stitch un-identified and identified engagement with a website or eCommerce store.
{% enddocs %}

{% docs table_base_logged_in %}
    Client-side event. Does not have any event attributes, beyond the standard and context-provided attributes.
{% enddocs %}

{% docs table_base_order_cancelled %}
    Server-side event.
{% enddocs %}

{% docs table_base_order_completed %}
    Generally a server-side event - but our specification supports client-side implementations. Fueled Event Attributes are pulled from the JSON payloads sent to Fueled's Datahub.
{% enddocs %}

{% docs table_base_order_updated %}
    Always a server-side event.
{% enddocs %}

{% docs table_base_pages %}
    `page_view` is a client-side event that fires on all page loads.
{% enddocs %}

{% docs table_base_product_added %}
    Client-side event. Fires when a shopper adds a product to their shopping cart.
{% enddocs %}

{% docs table_base_product_list_viewed %}
    Client-side event. Fires when a shopper visits a Product Collections page.
{% enddocs %}

{% docs table_base_product_removed %}
    Client-side event. Fires when a shopper removes an item from their shopping cart. (Note: for now, listens for events on the main cart page. Side carts are not supported out out-of-the-box at this time, but can be supported with a small amount of client-side javascript customizations.)
{% enddocs %}

{% docs table_base_product_viewed %}
    Client-side event. Fires when someone visits a Product Description Page.
{% enddocs %}

{% docs table_base_products_searched %}
    Client-side event. Fires when someone uses the site-wide search.
{% enddocs %}

{% docs table_base_signed_up %}
    Client-side event. Fires when some signs up for an account. Always accompanied by an `identify` event.
{% enddocs %}

{% docs table_base_subscription_activated %}
    The following documentation covers our ReCharge Payments integration for the Subscription Activated event. The Subscription Activated event is triggered when a user activates a subscription via API or UI.
{% enddocs %}

{% docs table_base_subscription_cancelled %}
    The following documentation covers our ReCharge Payments integration for the Subscription Cancelled event. This event will trigger when a user cancels a subscription via API or UI. An involuntary subscription cancelled due to max retries reached will only trigger the charge/max_retries_reached webhook and not the subscription/cancelled webhook.
{% enddocs %}

{% docs table_base_subscription_created %}
    The following documentation covers our ReCharge Payments integration for the Subscription Created event. This will trigger when a user creates a subscription via API or when a shopper goes through the checkout on UI.
{% enddocs %}

{% docs table_base_tracks %}
    Every track call sent from the source is stored in this table. It does not include the custom properties present in the event's properties but has some standard properties.
{% enddocs %}

{% docs table_base_users %}
    Fueled stores all unique users in this table. Only the latest properties used to identify a user are stored, including the latest `anonymousId`.
{% enddocs %}

{% docs table_base_cart_line_items %}
    Products on each `cart_viewed` event.
{% enddocs %}

{% docs table_base_checkout_line_items %}
    Products on each `checkout_created` and `checkout_updated` event.
{% enddocs %}

{% docs table_base_order_line_items %}
    Products on each `order_completed` and `order_cancelled` event.
{% enddocs %}

{% docs table_base_product_list_viewed_products %}
    Products on each `product_list_viewed` event.
{% enddocs %}