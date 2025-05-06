# The-Effect-of-Trump-Tariffs-on-the-Stock-Market

## Table of Contents

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
* #### Dataset Sources
  - Stock Prices: Historical daily data from Yahoo Finance
  - Tariff News: Compiled using official press releases from BBC and Reed Smith LLP

* #### Data Description
  - stock_prices.csv
Includes date, ticker, open/high/low/close prices, volume, industry, brand name, country, and market close time.
  - tariff_news.csv
Captures tariff event date, summary, targeted country, and the affected sector.

* #### Data Cleaning
  - Data cleaning was done in Python (pandas), including:
  - Removing duplicates and invalid dates
  - Standardizing symbols and formats
  - Handling missing values in industry and brand fields
  - Filtering for U.S.-based stocks only
  - Merging consistent sector and country labels
  - Aligning with valid market-open days
  - Cleaned files are stored in the data/cleaned/ directory.

* #### Analysis
  - Analysis areas included:
  - Volatility Tracking: % price changes before/after announcements
  - Sector Sensitivity: Grouped by industry
  - Recovery Timeline: Days until prices normalized
  - Event Window Analysis: Studied behavior at -1, 0, +1, and +5 trading days
  - SQL handled the heavy lifting, with Python charts backing the visuals.

* #### Logical Reasoning
  - This wasn’t just a numbers exercise — clarity and methodology were key.
  - I defined event windows from the first trading day after announcements, excluded weekends, and structured SQL logic with Common Table Expressions (CTEs) for clarity and efficiency.
  - Volatility was calculated using rolling standard deviations and percent changes. Industry-level insights were derived by joining stock data with sector metadata.
  - Prices weren’t smoothed or inflation-adjusted — I wanted to reflect what real investors saw in real time.

## Key Insights
- Stock prices usually dipped within 24–48 hours of major announcements
- Tech and food sectors saw the highest volatility
- Some brands bounced back in under 3 days; others stayed down
- China-related tariffs triggered the biggest market responses
- Market behavior varied based on the day of the week the news broke

## Recommendations
- This isn’t investment advice — it’s a data story.
- Before acting on any findings, please do your own research or consult a licensed advisor.

## Limitations
- Static Data: Not connected to a live API, so updates won’t reflect
- Time-Bound: Analysis only covers 2016–2020; not meant to forecast
- Open Collaboration: Contributions welcome — let’s build a live dashboard version together

## Tools Used
- SQL (PostgreSQL) – Event-driven analysis
- Python (pandas, matplotlib, seaborn) – Cleaning and visualization
- Jupyter Notebooks – Exploration and plotting
- GitHub – Version control and publishing

## Acknowledgments
Thanks to the finance/data community — especially EntryLevel, DataFam, and others whose feedback helped shape this project.
Big appreciation to Yahoo Finance and USITC for open access to high-quality data.

## Disclaimers
This is a data-driven analysis with no political affiliation.
While Trump’s tariff policies are the case study, the stock market reacts to countless variables.

This project isolates one variable — policy news — to study cause-effect patterns, not to suggest a full economic diagnosis.
