with
    unnested_checkout_created_products as (
        select "checkout_created" as event_type, id, original_timestamp, unnested_product_column
        from
            {{ source("fueled_events_atomic", "checkout_created") }},
            unnest(json_extract_array(products)) as unnested_product_column
    ),

    unnested_checkout_updated_products as (
        select "checkout_updated" as event_type, id, original_timestamp, unnested_product_column
        from
            {{ source("fueled_events_atomic", "checkout_updated") }},
            unnest(json_extract_array(products)) as unnested_product_column
    )

select
    event_type,
    id as event_id,
    null as cart_id, /* Need to add this to schema for checkouts. */
    original_timestamp,
    json_extract_scalar(unnested_product_column, '$.is_refunded') as is_refunded,
    json_extract_scalar(unnested_product_column, '$.line_item_id') as line_item_id,
    json_extract_scalar(unnested_product_column, '$.name') as name,
    json_extract_scalar(unnested_product_column, '$.position') as position,
    json_extract_scalar(unnested_product_column, '$.price') as price,
    json_extract_scalar(unnested_product_column, '$.product_id') as product_id,
    json_extract_scalar(unnested_product_column, '$.quantity') as quantity,
    json_extract_scalar(unnested_product_column, '$.sku') as sku,
    json_extract_scalar(unnested_product_column, '$.variant') as variant,
    unnested_product_column
from unnested_checkout_created_products
UNION ALL
select
    event_type,
    id as event_id,
    null as cart_id, /* Need to add this to schema for checkouts. */
    original_timestamp,
    json_extract_scalar(unnested_product_column, '$.is_refunded') as is_refunded,
    json_extract_scalar(unnested_product_column, '$.line_item_id') as line_item_id,
    json_extract_scalar(unnested_product_column, '$.name') as name,
    json_extract_scalar(unnested_product_column, '$.position') as position,
    json_extract_scalar(unnested_product_column, '$.price') as price,
    json_extract_scalar(unnested_product_column, '$.product_id') as product_id,
    json_extract_scalar(unnested_product_column, '$.quantity') as quantity,
    json_extract_scalar(unnested_product_column, '$.sku') as sku,
    json_extract_scalar(unnested_product_column, '$.variant') as variant,
    unnested_product_column
from unnested_checkout_updated_products
ORDER BY original_timestamp DESC, event_id, event_type