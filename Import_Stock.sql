--import from csv
BULK INSERT dbo.StockPrices
FROM '/cleaned_stock_prices.csv'
WITH
(
    FORMAT='CSV',
    FIRSTROW=2
)
GO