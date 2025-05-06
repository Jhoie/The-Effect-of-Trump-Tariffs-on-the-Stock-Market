SELECT ticker, brand_name,

    -- Closing price on election day
    MAX(CASE WHEN Date = '2024-11-06' THEN Close_Price END) AS close_on_election_day,

    -- Closing price on first tariff announcement
    MAX(CASE WHEN Date = '2025-01-31' THEN Close_Price END) AS close_on_first_tariff,

    -- % change: election to first tariff
    ROUND(
        100.0 * (
            MAX(CASE WHEN Date = '2025-01-31' THEN Close_Price END) -
            MAX(CASE WHEN Date = '2024-11-06' THEN Close_Price END)
        ) / NULLIF(MAX(CASE WHEN Date = '2024-11-06' THEN Close_Price END), 0), 
    2) AS pct_change_election_to_tariff,

    -- Closing price on final date in your dataset
    MAX(CASE WHEN Date = '2025-04-14' THEN Close_Price END) AS close_on_final_day,

    -- % change: first tariff to final day
    ROUND(
        100.0 * (
            MAX(CASE WHEN Date = '2025-04-14' THEN Close_Price END) -
            MAX(CASE WHEN Date = '2025-01-31' THEN Close_Price END)
        ) / NULLIF(MAX(CASE WHEN Date = '2025-01-31' THEN Close_Price END), 0), 
    2) AS pct_change_tariff_to_final,

    -- % change: election to final day
    ROUND(
        100.0 * (
            MAX(CASE WHEN Date = '2025-04-14' THEN Close_Price END) -
            MAX(CASE WHEN Date = '2024-11-06' THEN Close_Price END)
        ) / NULLIF(MAX(CASE WHEN Date = '2024-11-06' THEN Close_Price END), 0), 
    2) AS pct_change_election_to_final

FROM StockPrices
GROUP BY ticker, brand_name
ORDER BY pct_change_tariff_to_final ASC