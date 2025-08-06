{% macro get_shared_event_attributes(schema_name, table_name) %}
    {%- set desired_columns = [
        ('context_anonymous_id', 'STRING'),
        ('context_user_agent', 'STRING'),
        ('context_locale', 'STRING'),
        ('context_timezone', 'STRING'),
        ('context_version', 'STRING'),
        ('context_app', 'STRING'),
        ('context_fb_fbp', 'STRING'),
        ('context_fb_fbc', 'STRING'),
        ('context_source_id', 'STRING'),
        ('context_campaign_name', 'STRING'),
        ('context_campaign_id', 'STRING'),
        ('context_campaign_source', 'STRING'),
        ('context_campaign_medium', 'STRING'),
        ('context_campaign_gclid', 'STRING'),
        ('context_klaviyo_exchange_id', 'STRING'),
        ('context_library_name', 'STRING'),
        ('context_library_version', 'STRING'),
        ('context_os_name', 'STRING'),
        ('context_page_title', 'STRING'),
        ('context_page_path', 'STRING'),
        ('context_page_url', 'STRING'),
        ('context_page_referrer', 'STRING'),
        ('context_page_height', 'INT64'),
        ('context_page_width', 'INT64'),
        ('context_referrer', 'STRING'),
        ('context_ip', 'STRING'),
        ('context_ipv4', 'STRING'),
        ('context_ipv6', 'STRING'),
        ('context_debug', 'BOOL'),
        ('context_initialized', 'BOOL'),
        ('context_offline', 'BOOL'),
        ('context_traits_email', 'STRING'),
        ('context_traits_first_name', 'STRING'),
        ('context_traits_last_name', 'STRING'),
        ('context_traits_name', 'STRING'),
        ('context_traits_phone', 'STRING'),
        ('context_traits_external_customer_id', 'STRING'),
        ('context_traits_shopify_customer_id', 'STRING'),
        ('context_traits_visitor_type', 'STRING'),
        ('context_traits_address_city', 'STRING'),
        ('context_traits_address_state', 'STRING'),
        ('context_traits_address_state_code', 'STRING'),
        ('context_traits_address_country', 'STRING'),
        ('context_traits_address_country_code', 'STRING'),
        ('context_traits_address_postal_code', 'STRING'),
        ('context_traits_address_street', 'STRING')
    ] %}
    {%- set cols_in_relation = adapter.get_columns_in_relation(source(schema_name, table_name)) | map(attribute='name') | list %}

    {%- for col, col_type in desired_columns %}
        {%- if col in cols_in_relation %}
            ,{{ col }}
        {%- else %}
            {%- if col_type == 'STRING' %}
                ,'' as {{ col }}
            {%- elif col_type == 'INT64' %}
                ,CAST(NULL AS INT64) as {{ col }}
            {%- elif col_type == 'BOOL' %}
                ,CAST(NULL AS BOOL) as {{ col }}
            {%- else %}
                ,CAST(NULL AS {{ col_type }}) as {{ col }}
            {%- endif %}
        {%- endif %}
    {%- endfor %}
{% endmacro %}
