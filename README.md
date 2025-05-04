# The-Effect-of-Trump-Tariffs-on-the-Stock-Market

## Table of Contents

~ Overview
~ Dataset
~ Analysis Process
~ Key Insights
~ Built With
~ Acknowledgments
~ Disclaimer


## [Overview](#overview)
This portfolio project explores the effect of former U.S. President Donald Trump’s tariff announcements on the U.S. stock market. By analyzing market volatility, industry-specific sensitivities, and recovery patterns, this project uncovers how political decisions can influence investor sentiment and market behavior. 

Using SQL to extract event-specific data windows and Python for visual storytelling, the project offers a data-driven narrative of how sectors like tech, food, and manufacturing responded to tariff shocks.

📊 Dataset
This analysis uses two key datasets:

Stock Prices Dataset:
Daily historical prices for selected U.S. stocks (Open, High, Low, Close, Volume), along with associated industry and country labels.

~200,000+ records

Fields: ticker, date, close_price, industry, brand_name

Tariff Announcements Dataset:
Contains the date, description, and country target of each Trump-era tariff announcement.

Includes ~20 key policy events spanning multiple sectors and years.

Fields: date_news, tariff_news, affected_country, industry

Both datasets were cleaned and imported into a PostgreSQL database. From there, event windows were defined and used to create new analytical tables for volatility and recovery calculations.

🔍 Analysis Process
To answer the key economic questions, I took the following steps:

Define Event Trading Day:
Identify the first actual trading day after a tariff was announced (to avoid weekends and market holidays).

Calculate Pre-Event and Post-Event Prices:
Capture the closing prices on the day before, the day of, and several days after each event.

Volatility Analysis:
Compute percentage price changes and rolling standard deviations across event windows to assess short-term market volatility.

Industry Sensitivity Breakdown:
Group stocks by sector to determine which industries responded most dramatically.

Recovery Timeline Mapping:
Track how many days it took for stock prices to return to pre-announcement levels—if at all.

🔗 Links
📌 SQL Query Scripts Folder

📒 Exploratory Python Notebook

📈 Final Charts & Visuals Folder

📂 Cleaned Datasets

🧠 Query Logic Documentation

🛠 Built With
PostgreSQL – Data querying and transformation

Python – Analysis and visualizations (pandas, matplotlib, seaborn)

Jupyter Notebook – Presentation of insights

Git/GitHub – Version control and portfolio hosting

💡 Key Insights
📉 Volatility spiked sharply within 1–2 trading days of each tariff announcement.

📊 Technology and food sectors were most sensitive to tariff-related news.

⏳ Recovery rates varied: Some stocks rebounded in 3–5 days, others never did within the 10-day window.

🌍 Tariffs on Chinese and EU goods triggered larger swings than those targeting smaller economies.

🧾 Certain brands like McDonald's and Boeing showed remarkable resilience.

📅 Timing matters: Announcements made midweek showed faster price adjustments than those made on Fridays.

📐 Price distributions post-event skewed lower, indicating bearish sentiment immediately after announcements.

🙏 Acknowledgments
Special thanks to publicly available financial datasets like Yahoo Finance and macroeconomic sources like the United States International Trade Commission (USITC) for the foundational data. Grateful also to the DataFam and analytics communities for ongoing feedback on this project.
