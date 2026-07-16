SELECT 
    prd_id,
    SUBSTR(prd_key, 1, 5) AS cat_id,
    REPLACE(SUBSTR(prd_key, 7, LEN(prd_key)), '-', '_') AS prd_key,
    TRIM(prd_nm) AS prd_nm,

    CASE 
        WHEN prd_cost IS NULL OR prd_cost < 0 THEN 0
        ELSE prd_cost 
    END AS prd_cost,

    CASE 
        WHEN prd_line = 'M' THEN 'Mountain'
        WHEN prd_line = 'R' THEN 'Road'
        WHEN prd_line = 'S' THEN 'Other Sales'
        WHEN prd_line = 'T' THEN 'Touring'
        ELSE 'n/a'
    END AS prd_line,

    prd_start_dt,

    CAST(
        LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt) - 1 
        AS DATE
    ) AS prd_end_dt
FROM
    {{ ref('bronze_crm_prd_info') }}