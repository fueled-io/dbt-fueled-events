# Fueled DBT Package for Track & Identify Events

### Overview

Fueled is a 1st-party data platform for eCommerce. We integrate with a growing number of eCommerce SaaS applications that fire real-time
events when shoppers engage with a brand. For example, we have integrations into Shopify and BigCommerce to track client-side website engagement,
checkout and purchase events, and so forth. We also have integrations with Yotpo, Gorgias, ReCharge Payments, Loop Returns, and more.

This DBT package is provided to help agencies and brands that are leveraging Fueled to pipe these real-time events into a data warehouse, where they
can analyze engagement and activate this data with downstream tools, like reverse ETLs. With this package, you can stitch together `track` and `identify`
events, build rollups of engagement metrics on a per-customer basis, and more.

### Fueled Source Integrations

Fueled has "Source Integrations" for capturing 1st-party events from the following applications. Those with check markers are supported by this DBT
package at this time. The unchecked Sources will soon have DBT support.

- [x] Shopify
- [x] BigCommerce
- [x] ReCharge Payments
- [ ] Yotpo Reviews
- [ ] Gorgias
- [ ] Loop Returns

### Getting Started

Fueled's DBT packages are provided freely under a the Apache 2 open-source license. To get started, [contact us](https://fueled.io/sign-up) to get
Fueled installed and piping data to your data warehouse. From there:

- Install our DBT packages on DBT Cloud or locally using the DBT CLI.
- Connect this project to your warehouse.
- Model away!

(More robust documentation on getting started coming soon!!)

### Data Warehouse Support

While our goal is to support merchants on all of the major data warehouse platforms (BigQuery, Databricks, Redshift, Snowflake & Postgres), we are
currently building out Fueled for merchants leveraging Redshift, BigQuery, and Snowflake.

### Requirements

- A dataset of web events from Fueled's 1st-party data platform must be available in the database.
- Fueled's [dbt-fueled-utils](https://github.com/fueled-io/dbt-fueled-utils) package.
- dbt-core version 1.4.0 or greater

### Support

Reach out to us and we'll add you to a Slack channel to provide more detailed support.

# Copyright and License

Copyright Fueled, Inc. 2023.

Licensed under the [Apache License, Version 2.0][license] (the "License");
you may not use this software except in compliance with the License.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[license]: http://www.apache.org/licenses/LICENSE-2.0

### Data Enablement Customization

To customize the data transformations provided by this package, you can easily enable or disable specific event transformations. This flexibility allows you to focus on the data that is most relevant to your business needs, without processing unnecessary data.

To do this, Fueled provides a set of boolean flags that can be set in your `dbt_project.yml` file. Each flag corresponds to a different type of event or data source integration. By setting these flags, you control which models are included in your DBT runs.

#### Configuration Example
Below is an example of how you can use these flags in your `dbt_project.yml` file to enable or disable specific transformations:

```yaml
vars:
  fueled_events:
    enable_cart_viewed: true
    enable_checkout_created: true
    enable_logged_in: false  # Disable logged-in event transformations
    enable_order_completed: true
    enable_product_added: false  # Disable product added transformations
    enable_product_viewed: true
    enable_user_attribution: true
```

#### List of Flags
Here are the available flags you can use to control the transformations:

- **enable_cart_viewed**: Enable transformations related to cart views.
- **enable_checkout_created**: Enable transformations related to checkout creation events.
- **enable_logged_in**: Enable transformations related to logged-in events.
- **enable_order_completed**: Enable transformations for completed orders.
- **enable_product_added**: Enable transformations for products added to cart.
- **enable_product_list_viewed**: Enable transformations for viewing product lists.
- **enable_product_removed**: Enable transformations for products removed from cart.
- **enable_product_viewed**: Enable transformations for individual product views.
- **enable_products_searched**: Enable transformations for product search events.
- **enable_signed_up**: Enable transformations for user sign-ups.
- **enable_user_attribution**: Enable user attribution transformations for deeper engagement analysis.

#### List of Variables
Here are the available variables you can tweak to control you analysis:

**fueled__atomic_schema**: Defines the schema (or dataset) where Fueled’s raw (atomic) events are stored.
**landing_page_checkout**: The URL prefix to identify and categorize checkout-related events.
**landing_page_account**:The URL prefix for account management pages, used to classify sign-up, login, and other account-related events.
**direct_channel**: Specifies your primary or direct sales channel. Useful for attribution and tracking direct traffic. Mention your domain to identify
**session_interval**: Determines the session timeout window (in minutes) to group user events into sessions or session id.


# Control whether to include S3 destination data
**include_s3_destination_data**: Determines whether to include S3 destination data in the bronze models. Set to false for projects without S3 data
**s3_destination_date**: Determines the date up to which S3 destination data should be included in the bronze models
