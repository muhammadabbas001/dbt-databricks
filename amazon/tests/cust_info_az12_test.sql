SELECT *
FROM {{ ref('silver_crm_cust_info') }} AS customer
LEFT JOIN {{ ref('silver_erp_cust_az12') }} AS az12
    ON customer.cst_key != az12.cid
WHERE az12.cid IS NULL