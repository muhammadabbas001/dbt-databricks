SELECT 
    cst_id,
    cst_key,
    TRIM(cst_firstname) AS cst_firstname,
    TRIM(cst_lastname) AS cst_lastname,
    CASE WHEN cst_marital_status = 'M' THEN 'Married'
         WHEN cst_marital_status = 'S' THEN 'Single'
         ELSE 'n/a'
    END AS cst_marital_status,
    CASE WHEN cst_gndr = 'M' THEN 'Male'
         WHEN cst_gndr = 'F' THEN 'Female'
         ELSE 'n/a'
    END AS cst_gndr,
    cst_create_date
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
    FROM {{ ref('bronze_crm_cust_info') }}
    WHERE cst_id IS NOT NULL
)
WHERE flag_last = 1;