SELECT *
FROM {{ ref('silver_crm_sales_details') }} AS sales
LEFT JOIN {{ ref('silver_crm_prd_info') }} AS product
    ON sales.sls_prd_key != product.prd_key
LEFT JOIN {{ ref('silver_crm_cust_info') }} AS customer
    ON sales.sls_cust_id != customer.cst_key
WHERE product.prd_key IS NULL AND customer.cst_key IS NULL