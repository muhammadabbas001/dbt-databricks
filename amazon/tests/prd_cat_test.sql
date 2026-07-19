SELECT prd_key
FROM {{ ref('silver_crm_prd_info') }} AS p
LEFT JOIN {{ ref('silver_erp_px_cat_g1v2') }} AS c
    ON p.prd_key != c.id
WHERE c.id IS NULL