SELECT industry_tag,
    STRING_AGG(CAST(brand_name AS VARCHAR(MAX)), ', ') AS company_names

--- Selects distinct industry and brand name
FROM (
    SELECT DISTINCT industry_tag, brand_name
    FROM StockPrices
) AS unique_brands

GROUP BY industry_tag
ORDER BY industry_tag;