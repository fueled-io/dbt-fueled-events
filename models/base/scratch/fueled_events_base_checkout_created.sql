with
    source as (select * from {{ source("fueled_events_atomic", "checkout_created") }}),

    checkout_created as (

        select
            affiliation,
            channel,
            context_destination_id,
            context_destination_type,
            context_ip,
            context_library_name,
            context_library_version,
            context_request_ip,
            context_rudderstack_source,
            context_source,
            context_source_id,
            context_source_type,
            currency,
            discount,
            event,
            event_text,
            id,
            original_timestamp,
            products,
            received_at,
            sent_at,
            tax,
            user_id,
            uuid_ts,
            value,
            coupon,
            context_passed_ip,
            context_session_id,
            context_user_agent,
            context_anonymous_id,
            context_locale,
            context_client_id

        from source

    )

select *
from checkout_created

/*
    cart_id,
    context_destination_id as v_collector,
    context_destination_type v_elt,
    context_ip as user_ipaddress,
    context_library_version as v_tracker,
    context_source as event_source,
    id as event_id,
    original_timestamp as collector_tstamp,
    products,
    received_at as etl_tstamp,
    total,
    user_id,
    context_anonymous_id as domain_userid
*/
