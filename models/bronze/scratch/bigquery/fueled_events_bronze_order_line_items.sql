{{ config(
    materialized='ephemeral'
) }}
with
    unnested_order_completed_products as (
        select "order_completed" as event_type, order_id, original_timestamp, unnested_product_column
        from
            {{ source("fueled_events_atomic", "order_completed") }},
            unnest(json_extract_array(products)) as unnested_product_column
    ),

    unnested_order_cancelled_products as (
        select "order_cancelled" as event_type, order_id, original_timestamp, unnested_product_column
        from
            {{ source("fueled_events_atomic", "order_cancelled") }},
            unnest(json_extract_array(products)) as unnested_product_column
    )

select
    event_type,
    order_id,
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
from unnested_order_completed_products
UNION ALL
select
    event_type,
    order_id,
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
from unnested_order_cancelled_products
ORDER BY original_timestamp DESC, order_id, event_type