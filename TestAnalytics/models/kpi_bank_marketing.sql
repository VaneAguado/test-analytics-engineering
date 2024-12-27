WITH base_data AS (
    SELECT
        age_group,
        job,
        marital,
        education,
        conversion
    FROM {{ ref('staging_bank_marketing') }}
),

contacts_summary AS (
    SELECT
        COUNT(*) AS total_contacts,
        SUM(CAST(conversion AS int))  AS successful_contacts
    FROM base_data
),

conversion_rate AS (
    SELECT
        (cast(successful_contacts AS FLOAT64 ) / total_contacts) * 100 AS conversion_rate
    FROM contacts_summary
),

segmentation AS (
    SELECT
        age_group,
        job,
        marital,
        education,
        COUNT(*) AS number_of_customers
    FROM base_data
    GROUP BY age_group, job, marital, education
)

SELECT
    conversion_rate,
    successful_contacts AS number_of_successful_contacts,
    age_group,
    job,
    marital,
    education,
    number_of_customers
FROM
    conversion_rate,
    contacts_summary,
    segmentation
ORDER BY
    age_group, job, marital, education