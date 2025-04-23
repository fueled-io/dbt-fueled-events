{{ config(
    enabled = var('enable_checkout_created', true) and check_dependencies([
      {"schema": var("fueled_events_atomic", 'default_schema'), "table": "checkout_created"}
    ]),
    materialized = 'view'
) }}


select  
  *
from {{ref("fueled_events_bronze_checkout_created")}}