SELECT ticker, brand_name,

    -- Trading volume on election day
    MAX(CASE WHEN Date = '2024-11-06' THEN Volume END) AS volume_on_election_day,

    -- Trading volume on first tariff announcement
    MAX(CASE WHEN Date = '2025-01-31' THEN Volume END) AS volume_on_first_tariff,

    -- % change in volume: election to first tariff
    ROUND(
        100.0 * (
            MAX(CASE WHEN Date = '2025-01-31' THEN Volume END) -
            MAX(CASE WHEN Date = '2024-11-06' THEN Volume END)
        ) / NULLIF(MAX(CASE WHEN Date = '2024-11-06' THEN Volume END), 0), 
    2) AS pct_volume_change_election_to_tariff,

    -- Trading volume on final date
    MAX(CASE WHEN Date = '2025-04-14' THEN Volume END) AS volume_on_final_day,

    -- % change in volume: first tariff to final day
    ROUND(
        100.0 * (
            MAX(CASE WHEN Date = '2025-04-14' THEN Volume END) -
            MAX(CASE WHEN Date = '2025-01-31' THEN Volume END)
        ) / NULLIF(MAX(CASE WHEN Date = '2025-01-31' THEN Volume END), 0), 
    2) AS pct_volume_change_tariff_to_final,

    -- % change in volume: election to final day
    ROUND(
        100.0 * (
            MAX(CASE WHEN Date = '2025-04-14' THEN Volume END) -
            MAX(CASE WHEN Date = '2024-11-06' THEN Volume END)
        ) / NULLIF(MAX(CASE WHEN Date = '2024-11-06' THEN Volume END), 0), 
    2) AS pct_volume_change_election_to_final

FROM StockPrices
GROUP BY ticker, brand_name
ORDER BY pct_volume_change_election_to_final, pct_volume_change_tariff_to_final;