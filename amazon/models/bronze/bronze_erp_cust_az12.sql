SELECT 
    *
FROM
{{ source('amazon_databricks', 'cust_az12') }}