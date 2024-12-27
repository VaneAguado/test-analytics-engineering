WITH base_data AS (
    SELECT
        contact_month_numeric,
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

segmentation_contact_month_numeric AS (
    SELECT
        contact_month_numeric,
        COUNT(*) AS number_of_customers,
        SUM(CASE WHEN conversion = TRUE THEN 1 ELSE 0 END) AS success_customers,
       (SUM(CASE WHEN conversion = TRUE THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS success_percentage
    FROM base_data
    GROUP BY contact_month_numeric
)

SELECT
    contact_month_numeric,
    number_of_customers,
    success_customers,
    success_percentage
FROM
    segmentation_contact_month_numeric
ORDER BY success_percentage DESC