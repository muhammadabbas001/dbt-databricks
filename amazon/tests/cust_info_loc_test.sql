SELECT *
FROM {{ ref('silver_crm_cust_info') }} AS customer
LEFT JOIN {{ ref('silver_erp_loc_a101') }} AS a10
    ON customer.cst_key != a10.cid
WHERE a10.cid IS NULL