# The-Effect-of-Trump-Tariffs-on-the-Stock-Market

## Navigation

- [Overview](#overview)
- [Analysis Process](#analysis-process)
  - Data sources 
  - Data description 
  - Data cleaning
  - Analysis 
  - Logical reasoning 
- [Key Insights](#key-insights)
- [Recommendations](#recommendations) 
- [Limitations](#limitations) 
- [Tools](#tools-used)
- [Acknowledgments](#acknowledgments) 
- [Disclaimers](#disclaimers) 

## Overview
This project explores how U.S. stock markets responded to President Donald Trump’s tariff announcements — specifically looking at volatility, industry-specific reactions, and how quickly stock prices bounced back.

The goal was to unpack how political actions ripple through financial systems, using real market data, structured SQL logic, and Python for data cleaning.


## Analysis Process
The analysis followed a structured path: identify key policy events, align them with stock price activity, and measure market reaction in terms of volatility and recovery timelines.
* #### Data Sources
  - Tariff News: Compiled using official press releases from BBC and Reed Smith LLP
  - Stock Prices: Historical daily data from Yahoo Finance and Nidula Elgiriyewithana's Daily Updated Stock Prices Dataset

* #### Data Description
  - tariff_news.csv
    | Column Name | Description  |
    |------------ |---------------|
    | Date_News   | Date of tariff's public announcement |
    | Tariff_News | Information about the tarrif |
    
  - stock_prices.csv
    | Column Name | Description  |
    |------------ |---------------|
    | Date        | The date of the stock price data |
    | Ticker      | Ticker symbol for the stock|
    | Open_Price  | The opening price of the stock on that date |
    | High        | The highest price the stock reached during the trading day | 
    | Low         | The lowest price the stock reached during the trading day |
    | Close_Price | The closing price of the stock on that date |
    | Volume      | The trading volume, i.e., the number of shares traded on that date|
    | Dividends   | Dividends paid on that date (if any)|
    | Stock_Splits| Information about stock splits (if any)|
    | Brand_Name  | The name of the brand or company|
    | Industry_Tag| The industry category or sector to which the brand belongs|
    | Country     | The country where the brand is headquartered or primarily operates |
    | Time        | The time of the stock price data |
  


* #### Data Cleaning
  The stock prices dataset was preprocessed using Python to ensure consistency and optimize performance before ingestion into the SQL database. The following cleaning steps were applied:

  - Date Range Filtering: The dataset was filtered to include only stock price data between November 1, 2024, and April 15, 2025—corresponding to the period following Trump’s return to political activity. This significantly reduced the dataset size, improving the efficiency of downstream processing.
  - Removal of Blank Columns: Columns containing only null or empty values were identified and dropped to eliminate redundancy.
  - Deduplication: Duplicate rows were removed to maintain data integrity and prevent skewed results during analysis.
  - Data Type Normalization: Numeric and date columns were converted to appropriate data types to ensure compatibility with SQL ingestion and querying.

* #### Analysis
  A series of SQL queries were designed and executed to examine how the stock market responded to tariff-related announcements during the selected period. The analysis focused on the relationship between political-economic events and stock price behavior across different companies and industries. Key components of the analysis included:

  - Volatility Analysis: Calculated short-term and long-term price and volume fluctuations before and after tariff announcements to assess immediate market reaction. This involved identifying the previous and next valid trading days relative to each announcement and computing percentage changes in closing prices.
  - Recovery Patterns: Investigated how quickly stocks rebounded following a negative reaction, using a custom logic to track recovery timelines and price thresholds over subsequent trading days.
  - Industry Sensitivity Assessment: Grouped stocks by sector (e.g., food, tech, apparel, aviation, healthcare, etc.) to identify which industries were most affected by tariff measures, based on aggregated volatility and recovery metrics.
  - Event Timing Alignment: Mapped each tariff announcement to the actual first trading day the market could react, accounting for weekends and non-trading holidays to ensure accuracy in the event-based analysis.
  - SQL Optimization: Common Table Expressions (CTEs) were used extensively to modularize logic and improve query readability and scalability across multiple event scenarios.

## Key Insights
- **Spotify Emerged as a Strong Performer:** Among individual stocks, Spotify maintained a +40% gain from election through April 15, showing minimal disruption from tariff-related news. This indicates lower exposure to global trade and steady investor confidence.
- **Tesla and Amazon Faced Reversals:** Both stocks saw strong early gains but dropped over 30% post-tariff, reflecting sharp market corrections likely tied to policy uncertainty and global supply chain exposure.
-  **Market Reactions Varied by Industry:** Sectors like cryptocurrency, logistics, and aviation initially surged after the election but experienced sharp declines post-tariff, suggesting high sensitivity to trade policy. In contrast, consumer sectors like fast food showed more stability and resilience.
- **Apple Showed High Trading Activity Despite Price Dip:** Apple had an 85% surge in trading volume post-election, signaling strong investor interest—even as its price declined. This suggests it was a focal point in market discussions around tariffs.
- **Volume Reinforced Sentiment Trends:** Stocks like Tesla and Amazon had significant volume drops after the election, mirroring price declines and indicating fading investor enthusiasm. In contrast, McDonald’s and Spotify saw stable or increasing volume, supporting their stronger price performance.

## More Insights

## Recommendations
- This isn’t investment advice, it’s a data project. Before acting on any findings, please do your own research or consult a licensed advisor.


