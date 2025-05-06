/* STOCK PRICE LONG TERM VOLATILITY AND RECOVERY BY INDUSTRY
1. From the announcement of the first tariff till date
2. From Trump's election victory announcement till date*/


SELECT industry_tag,

    -- Closing price after Trump's election victory announcement
    AVG(CASE WHEN Date = '2024-11-06' THEN Close_Price END) AS close_on_election_day,

    -- Closing before first tariff announcement
    AVG(CASE WHEN Date = '2025-01-31' THEN Close_Price END) AS close_on_first_tariff,

    -- % Change from election victory to first tariff
    ROUND(
        100.0 * (
            AVG(CASE WHEN Date = '2025-01-31' THEN Close_Price END) -
            AVG(CASE WHEN Date = '2024-11-06' THEN Close_Price END)
        ) / NULLIF(AVG(CASE WHEN Date = '2024-11-06' THEN Close_Price END), 0), 
    2) AS pct_change_election_to_tariff,

    -- Closing price on final date in your dataset
    AVG(CASE WHEN Date = '2025-04-15' THEN Close_Price END) AS close_on_final_day,

    -- % Change from first tariff to last day in dataset
    ROUND(
        100.0 * (
            AVG(CASE WHEN Date = '2025-04-15' THEN Close_Price END) -
            AVG(CASE WHEN Date = '2025-01-31' THEN Close_Price END)
        ) / NULLIF(AVG(CASE WHEN Date = '2025-01-31' THEN Close_Price END), 0), 
    2) AS pct_change_tariff_to_final,

    -- % Change from election victory to last day in dataset
    ROUND(
        100.0 * (
            AVG(CASE WHEN Date = '2025-04-15' THEN Close_Price END) -
            AVG(CASE WHEN Date = '2024-11-06' THEN Close_Price END)
        ) / NULLIF(AVG(CASE WHEN Date = '2024-11-06' THEN Close_Price END), 0), 
    2) AS pct_change_election_to_final

FROM StockPrices
GROUP BY Industry_Tag
ORDER BY pct_change_election_to_final,  pct_change_tariff_to_final;