with
    source as (select * from {{ source("fueled_events_atomic", "cart_viewed") }}),

    cart_viewed as (

        select
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

            /* TODO - Add enrichments and additional context array items. */

        from source

    )

select *
from cart_viewed
