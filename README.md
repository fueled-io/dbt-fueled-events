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

- [ ] Shopify
- [ ] BigCommerce
- [ ] ReCharge Payments
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
