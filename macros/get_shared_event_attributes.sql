{% macro get_shared_event_attributes(schema_name, table_name) %}

    {%- set column_names = dbt_utils.get_filtered_columns_in_relation(
        from=source(schema_name, table_name),
        except=[
            "context_anonymous_id",
            "context_request_ip",
            "channel",
            "context_app",
            "context_client_id",
            "context_destination_id",
            "context_destination_type",
            "context_initialized",
            "context_offline",
            "context_request_ip",
            "context_rudderstack_source",
            "context_session_id",
            "context_source_id",
            "context_source_type",
            "event",
            "event_text",
            "loaded_at",
            "received_at",
            "sent_at",
            "timestamp",
        ],
    ) %}

    {%- for column_name in column_names -%}
        {%- if not loop.last -%}
            {%- if "context_" in column_name -%}, {{ column_name }}{%- endif %}
        {%- else %} {%- if "context_" in column_name %}, {{ column_name }} {%- endif %}
        {%- endif -%}

    {%- endfor -%}

{% endmacro %}
