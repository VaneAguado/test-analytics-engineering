WITH base_data AS (
    SELECT
        age_group,
        conversion
    FROM {{ ref('staging_bank_marketing') }}
),

contacts_summary AS (
    SELECT
        COUNT(*) AS total_contacts,
        SUM(CAST(conversion AS int)) AS successful_contacts
    FROM base_data
),

conversion_rate AS (
    SELECT
        (cast(successful_contacts AS FLOAT64 ) / total_contacts) * 100 AS conversion_rate
    FROM contacts_summary
),

segmentation_age_group AS (
    SELECT
        age_group,
        COUNT(*) AS number_of_customers,
        SUM(CASE WHEN conversion = TRUE THEN 1 ELSE 0 END) AS success_customers,
       (SUM(CASE WHEN conversion = TRUE THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS success_percentage
    FROM base_data
    GROUP BY age_group
)

SELECT
    age_group,
    number_of_customers,
    success_customers,
    success_percentage
FROM
    segmentation_age_group