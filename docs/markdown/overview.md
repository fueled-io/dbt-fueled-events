{% docs __overview__ %}
{% raw %}

# Fueled DBT Package Development for Track and Identify Events

## Context

This initial documentation page is for planning and project management of Fueled's data warehouse push of Fueled client-side and server-side events.
Later, this page will be turned into public documentation _(though the information is still useful to DBT end users now...)_.

## To Do

[x] Document what Fueled event attributes should be mapped to our Data Warehouse Destination.

[ ] Develop JSON Schema file for validation.

[ ] Ticket out tasks related to implementing event schema.

## Fueled Event Mapping

### Cart Viewed

Client-side event. The Fueled Event Attributes below are pulled from the JSON payloads sent to Fueled's Datahub.

| Fueled Event Attribute  | Warehouse Column       | Data Type    | Required | Example                                                                                                                 | Description/Notes                                                                | v2 adjustments                                     |
| ----------------------- | ---------------------- | ------------ | -------- | ----------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------- |
|                         | etl_channel            | VARCHAR(512) | N/A      | server                                                                                                                  | Added by warehouse adaptor                                                       | Rename from `channel` (if easy)                    |
|                         | etl_destination_id     | VARCHAR(512) | N/A      | 2M6h1LHFhszbSMpIUE9Y7i7U3gb                                                                                             | Added by warehouse adaptor                                                       | Rename from `context_destination_id` (if easy)     |
|                         | etl_destination_type   | VARCHAR(512) | N/A      | RS                                                                                                                      | Added by warehouse adaptor                                                       | Rename from `context_destination_type` (if easy)   |
|                         | etl_event              | VARCHAR(512) | N/A      | cart_viewd                                                                                                              | Added by warehouse adaptor                                                       | Rename from `event` (if easy)                      |
|                         | etl_event_text         | VARCHAR(512) | N/A      | Cart Viewed                                                                                                             | Added by warehouse adaptor                                                       | Rename from `event_text` (if easy)                 |
|                         | id                     | VARCHAR(512) | N/A      | node-c4196e420b3bc06ae71cce50c40b5d36-6db283ac-8ddd-4c85-9a21-c984ed210884                                              | Added by warehouse adaptor. Rename to `event_id` in base transformation          |                                                    |
|                         | etl_received_at        | timestamp    | N/A      | 2023-02-22 22:17:18.516000                                                                                              | Added by warehouse adaptor. Timestamp for when the event was received by Fueled. | Rename from `received_at` (if easy)                |
|                         | etl_rudderstack_source | VARCHAR(512) | N/A      | server                                                                                                                  | Added by warehouse adaptor                                                       | Rename from `context_rudderstack_source` (if easy) |
|                         | etl_source             | VARCHAR(512) | N/A      | client                                                                                                                  | Added by warehouse adaptor                                                       | Rename from `context_source` (if easy)             |
|                         | etl_source_id          | VARCHAR(512) | N/A      | 2M6fwH5ewxUyfyssoShmsrPdl7q                                                                                             | Added by warehouse adaptor                                                       | Rename from `context_source_id` (if easy)          |
|                         | etl_source_type        | VARCHAR(512) | N/A      | HTTP                                                                                                                    | Added by warehouse adaptor                                                       | Rename from `context_source_type` (if easy)        |
| anonymousId             | anonymous_id           | VARCHAR(512) | Yes      | a2df92e4-8dc9-4d09-90de-8e3221276937                                                                                    | Added by warehouse adaptor                                                       | Rename from `context_anonymous_id`                 |
| cartId                  | cart_id                | VARCHAR(512) | Yes      | 123456789                                                                                                               | Not in client-side array. Picked up by Fueled API                                |                                                    |
| context.app             | app                    | VARCHAR(512) | Yes      | client-analytics                                                                                                        |                                                                                  | Add this column                                    |
| context.campaign        | campaign               | JSON         | Yes      | {}                                                                                                                      | A JSON array of campaign information                                             | Add this column - Later split out further          |
| context.clientID        | ga4_clid               | VARCHAR(512) | No       | 2131186945.1683665545                                                                                                   | Google Click Identifier (CLID)                                                   |                                                    |
| context.ip              | user_ipaddress         | VARCHAR(512) | No       | 104.165.71.121                                                                                                          |                                                                                  |                                                    |
| context.library.name    | library_name           | VARCHAR(512) | No       | analytics                                                                                                               |                                                                                  |                                                    |
| context.library.version | library_version        | VARCHAR(512) | No       | 0.11.0                                                                                                                  |                                                                                  |                                                    |
| context.locale          | locale                 | VARCHAR(512) | No       | en-US                                                                                                                   |                                                                                  |                                                    |
| context.os              | os                     | VARCHAR(512) | No       | MacOS                                                                                                                   |                                                                                  |                                                    |
| context.page.height     | height                 | Integer      | No       | 475                                                                                                                     |                                                                                  |                                                    |
| context.page.path       | path                   | VARCHAR(512) | No       | /cart.php                                                                                                               |                                                                                  |                                                    |
| context.page.search     | search                 | VARCHAR(512) | No       | ?utm_campaign=return-to-cart                                                                                            |                                                                                  |                                                    |
| context.page.title      | title                  | VARCHAR(512) | No       | Cart                                                                                                                    |                                                                                  |                                                    |
| context.page.url        | url                    | VARCHAR(512) | No       | https://bigcommerce.com/cart.php                                                                                        |                                                                                  |                                                    |
| context.page.width      | width                  | Integer      | No       | 1191                                                                                                                    |                                                                                  |                                                    |
| context.referrer        | referrer               | VARCHAR(512) | No       | https://bigcommerce.com/product-page                                                                                    |                                                                                  |                                                    |
| context.sessionID       | ga4_session_id         | VARCHAR(512) | No       | 1683665545                                                                                                              |                                                                                  |                                                    |
| context.timezone        | timezone               | VARCHAR(512) | No       |                                                                                                                         |                                                                                  |                                                    |
| context.userAgent       | userAgent              | VARCHAR(512) | No       | "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36" |                                                                                  |                                                    |
| original_timestamp      | original_timestamp     | timestamp    | Yes      | 2023-02-22 22:17:18.516000                                                                                              | The timestamp of when the event occurred in the browser.                         |
| properties.products     | products               | JSON         | Yes      | {}                                                                                                                      | JSON Array of product information                                                |                                                    |
| properties.total        | total                  | Float        | Yes      | 995.50                                                                                                                  |                                                                                  |                                                    |
| userId                  | user_id                | VARCHAR(512) | No       | SH256 hash of email                                                                                                     |                                                                                  |                                                    |
|                         |                        |              |          |                                                                                                                         |                                                                                  |                                                    |
|                         |                        |              |          |                                                                                                                         |                                                                                  |                                                    |
|                         |                        |              |          |                                                                                                                         |                                                                                  |                                                    |

#### Columns to remove from existing implementation, _if easy enough_:

- hash
- sent_at
- timestamp
- uuid_ts

### Checkout Created

| Fueled Event Attribute | Warehouse Column | Data Type | v2 adjustments |
| ---------------------- | ---------------- | --------- | -------------- |
|                        |                  |           |                |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Checkout Started

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Checkout Updated

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Checkout Updated

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Identifies

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Order Cancelled

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Order Completed

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Order Updated

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Product Added

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Product List Viewed

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Product Removed

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Subscription Activated

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Subscription Cancelled

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Subscription Created

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Subscription Deleted

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

### Tracks

| Fueled Event Attribute | Warehouse Column | Data Type |
| ---------------------- | ---------------- | --------- |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |
|                        |                  |           |

{% endraw %}
{% enddocs %}
