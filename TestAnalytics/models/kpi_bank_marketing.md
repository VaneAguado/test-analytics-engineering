{%  docs kpi_bank_marketing %}
## VIEW NAME
kpi_bank_marketing
## View Definition
The dataset originates from a pre-existing model, "staging_bank_marketing," which was normalized and refined to maximize its relevance for the current process. The primary business objective is to develop a Data Mart that empowers the marketing team to evaluate campaign performance, emphasizing key metrics such as conversion rates, successful contact counts, and customer segmentation insights.

## Primary and Foreign keys
*   There is no primary key, but each record is unique. 
## Refresh
 This data was collected specifically for the current study and is not subject to periodic refresh or updates.
## Notes
The data from the preceding process was utilized to select key columns essential for achieving the KPIs, including age_group, job, marital, education, and conversion. These columns were deliberately chosen to enable population segmentation into categories that highlight behavioral trends associated with conversion rates attained through the campaign.
## Tags
bank, marketing, campaign
###  Sources
*   model.staging_bank_marketing
## Business Units
Commercial
## Important Column Definitions
(See Columns in dbt source defintion for details)
{%  enddocs   %}