with
    source as (select * from {{ source("fueled_events_atomic", "identifies") }}),

    identifies as (

        select
            addresses,
            channel,
            context_client_id,
            context_destination_id,
            context_destination_type,
            context_ip,
            context_library_name,
            context_library_version,
            context_locale,
            context_passed_ip,
            context_request_ip,
            context_rudderstack_source,
            context_session_id,
            context_source,
            context_source_id,
            context_source_type,
            context_traits_addresses,
            context_traits_created_at,
            context_traits_email,
            context_traits_external_customer_id,
            context_traits_first_name,
            context_traits_last_name,
            context_traits_phone,
            context_user_agent,
            created_at,
            email,
            external_customer_id,
            first_name,
            id,
            last_name,
            original_timestamp,
            phone,
            received_at,
            sent_at,
            user_id,
            uuid_ts,
            context_anonymous_id

        from source

    )

select *
from identifies
