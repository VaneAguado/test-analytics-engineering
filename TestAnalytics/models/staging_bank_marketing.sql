WITH base_data AS (
    SELECT
        *,
        LOWER(TRIM(job)) AS job_normalized,
        LOWER(TRIM(marital)) AS marital_normalized,
        LOWER(TRIM(education)) AS education_normalized,
        LOWER(TRIM(month)) AS month_normalized,
        LOWER(TRIM(poutcome)) AS poutcome_normalized
    FROM
        {{ source('DS_Test', 'raw_bank_marketing') }}
),

filtered_data AS (
    SELECT
        *
    FROM
        base_data
    WHERE
        job IS NOT NULL
        AND marital IS NOT NULL
        AND education IS NOT NULL
        AND month IS NOT NULL
),

final_data AS (
    SELECT
        *,
        CASE
            WHEN poutcome_normalized = 'success' THEN 1
            ELSE 0
        END AS previous_success,
        EXTRACT(MONTH FROM PARSE_DATE('%b', month_normalized)) AS contact_month_numeric,
        CASE
            WHEN age < 30 THEN 'young'
            WHEN age BETWEEN 30 AND 60 THEN 'adult'
            ELSE 'senior'
        END AS age_group
    FROM
        filtered_data
)

SELECT
    age,
    age_group,
    job_normalized AS job,
    marital_normalized AS marital,
    education_normalized AS education,
    campaign,
    previous_success,
    y as conversion,
    contact_month_numeric
FROM
    final_data