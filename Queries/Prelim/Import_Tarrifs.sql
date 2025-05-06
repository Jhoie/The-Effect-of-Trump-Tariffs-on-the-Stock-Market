--import from csv
BULK INSERT dbo.Tarrifs
FROM '/Tarrif_news_updated.csv'
WITH
(
    FORMAT='CSV',
    FIRSTROW=2
)
GO