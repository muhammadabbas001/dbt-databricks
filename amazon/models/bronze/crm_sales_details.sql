SELECT 
    *
FROM
{{ source('amazon_databricks', 'sales_details') }}