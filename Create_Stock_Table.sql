-- Create Stock Table
-- Columns were renamed for ease
CREATE TABLE StockPrices (
    Date DATE NOT NULL,
    Ticker VARCHAR(10) NOT NULL,
    Open_Price FLOAT,
    High FLOAT,
    Low FLOAT,
    Close_Price FLOAT,
    Volume FLOAT,
    Dividends FLOAT,
    Stock_Splits FLOAT,
    Brand_Name VARCHAR(100),
    Industry_Tag VARCHAR(100),
    Country VARCHAR(50),
    Time TIME,
    PRIMARY KEY (Ticker, Date)
);