{{ config(
    materialized='ephemeral'
) }}
with
    unnested_cart_viewed_products as (
        select "cart_viewed" as event_type, id, original_timestamp, unnested_product_column
        from
            {{ source("fueled_events_atomic", "cart_viewed") }},
            unnest(json_extract_array(products)) as unnested_product_column
    )

select
    event_type,
    id as event_id,
    null as cart_id, /* Need to add cart_id to cart_viewed schema. */
    original_timestamp,
    json_extract_scalar(unnested_product_column, '$.brand') as brand,
    json_extract_scalar(unnested_product_column, '$.category') as category,
    json_extract_scalar(unnested_product_column, '$.imageUrl') as imageUrl,
    json_extract_scalar(unnested_product_column, '$.name') as name,
    json_extract_scalar(unnested_product_column, '$.position') as position,
    json_extract_scalar(unnested_product_column, '$.price') as price,
    json_extract_scalar(unnested_product_column, '$.productId') as product_id,
    json_extract_scalar(unnested_product_column, '$.quantity') as quantity,
    json_extract_scalar(unnested_product_column, '$.sku') as sku,
    json_extract_scalar(unnested_product_column, '$.url') as url,
    json_extract_scalar(unnested_product_column, '$.variant') as variant,
    unnested_product_column
from unnested_cart_viewed_products
ORDER BY original_timestamp DESC, event_id