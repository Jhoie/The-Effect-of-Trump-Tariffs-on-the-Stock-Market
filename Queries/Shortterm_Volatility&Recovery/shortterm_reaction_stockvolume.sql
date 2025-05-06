--- STOCK VOLUME SHORT TERM VOLATILITY (BEFORE, DURING AND AFTER TARIFF ANNOUNCEMENT)

/* Selecting the first available trading day on or after the announcement that 
is NOT a weekend or public holiday. 
For example, if an announcement was made on Saturday, the actual_event_trading_day
is Monday since the stock market is closed on weekends.*/

WITH ActualEventDays AS (
    SELECT 
        t.Date_News AS event_date,
        t.Tarrif_News,
        MIN(s.Date) AS actual_event_trading_day
    FROM Tarrifs t
    JOIN StockPrices s 
        ON s.Date >= t.Date_News
    GROUP BY t.Date_News, t.Tarrif_News
),

/* Selecting the previous trading day before the announcement that 
is NOT a weekend or public holiday. 
For example, if an announcement was made on Saturday, the prev_trading_day
is Friday*/

PreviousTradingDays AS (
    SELECT 
        a.event_date,
        a.Tarrif_News, 
        a.actual_event_trading_day,
        s.Ticker,
        MAX(s.Date) AS prev_trading_day
    FROM ActualEventDays a
    JOIN StockPrices s 
        ON s.Date < a.actual_event_trading_day
    GROUP BY a.event_date, a.Tarrif_News, a.actual_event_trading_day, s.Ticker
),

/* Selecting the next trading day after the announcement that 
is NOT a weekend or public holiday. 
For example, if an announcement was made on Saturday, the next_trading_day
is Tuesday*/

NextTradingDays AS (
    SELECT 
        a.event_date,
        a.Tarrif_News,
        a.actual_event_trading_day,
        s.Ticker,
        MIN(s.Date) AS next_trading_day
    FROM ActualEventDays a
    JOIN StockPrices s 
        ON s.Date > a.actual_event_trading_day
    GROUP BY a.event_date, a.Tarrif_News, a.actual_event_trading_day, s.Ticker
),

/* Creating a temporary table for all trading days.
Please Note: This logic allows for announcements
that possibly came after market hours.
*/
DateMapped AS (
    SELECT 
        p.event_date,
        p.Tarrif_News,
        p.actual_event_trading_day,
        p.Ticker,
        p.prev_trading_day,
        n.next_trading_day
    FROM PreviousTradingDays p
    JOIN NextTradingDays n 
        ON p.event_date = n.event_date AND p.Ticker = n.Ticker
)

--- The final result

SELECT
    s.Ticker,
    s.Brand_Name,
    d.event_date,
    d.prev_trading_day,
    d.actual_event_trading_day,
    d.next_trading_day,
    d.Tarrif_News,

    /* Select all trading volumes. 
    Volume reflects the level of trading activity and investor interest in a stock.
    */

    MAX(CASE WHEN s.Date = d.prev_trading_day THEN s.Volume END) AS volume_before_event,
    MAX(CASE WHEN s.Date = d.actual_event_trading_day THEN s.Volume END) AS volume_on_event,
    MAX(CASE WHEN s.Date = d.next_trading_day THEN s.Volume END) AS volume_after_event,

    --- Trading activity change before announcement
    ROUND(
        100.0 * (
            MAX(CASE WHEN s.Date = d.actual_event_trading_day THEN s.Volume END) -
            MAX(CASE WHEN s.Date = d.prev_trading_day THEN s.Volume END)
        ) / NULLIF(MAX(CASE WHEN s.Date = d.prev_trading_day THEN s.Volume END), 0), 2
    ) AS pct_change_before_to_event,

    --- Trading activity change after announcement
    ROUND(
        100.0 * (
            MAX(CASE WHEN s.Date = d.next_trading_day THEN s.Volume END) -
            MAX(CASE WHEN s.Date = d.actual_event_trading_day THEN s.Volume END)
        ) / NULLIF(MAX(CASE WHEN s.Date = d.actual_event_trading_day THEN s.Volume END), 0), 2
    ) AS pct_change_event_to_after

FROM StockPrices s
JOIN DateMapped d 
    ON s.Ticker = d.Ticker
    AND s.Date IN (d.prev_trading_day, d.actual_event_trading_day, d.next_trading_day)
GROUP BY s.Ticker, s.Brand_Name, d.event_date, d.prev_trading_day, d.actual_event_trading_day, d.next_trading_day, d.Tarrif_News
ORDER BY s.Ticker, d.event_date;