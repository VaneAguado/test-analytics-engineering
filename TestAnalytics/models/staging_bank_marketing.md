{%  docs staging_bank_marketing %}
## VIEW NAME
staging_bank_marketing
## View Definition
The data is related with direct marketing campaigns of a Portuguese banking institution. The marketing campaigns were based on phone calls. Often, more than one contact to the same client was required, in order to access if the product (bank term deposit) would be ('yes') or not ('no') subscribed. 
## Primary and Foreign keys
*   There is no primary key, but each record is unique. 
## Refresh
 This data was collected specifically for the current study and is not subject to periodic refresh or updates.
## Notes
The dataset underwent normalization to eliminate extraneous whitespace and standardize text to lowercase, ensuring case-insensitive search functionality. Furthermore, records with null values in key analytical columns were excluded to maintain data integrity. Lastly, enhancements were made to columns such as month, age, and poutcome, optimizing their contribution to the insights provided by the model's visualization.
## Tags
bank, marketing, campaign
###  Sources
*   test-analytics-engineering.DS_Test.raw_bank_marketing
## Business Units
Commercial
## Important Column Definitions
(See Columns in dbt source defintion for details)
{%  enddocs   %}