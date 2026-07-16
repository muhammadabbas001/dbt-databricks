SELECT 
    *
FROM
{{ source('amazon_databricks', 'prd_info') }}