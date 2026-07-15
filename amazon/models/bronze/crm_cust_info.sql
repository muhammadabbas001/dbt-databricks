SELECT 
    *
FROM
{{ source('amazon_databricks', 'cust_info') }}