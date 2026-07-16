SELECT 
    *
FROM
{{ source('amazon_databricks', 'px_cat_g1v2') }}