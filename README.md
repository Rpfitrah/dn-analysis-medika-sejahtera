## Analysis of Delivery Note Return Delays at PT Medika Sejahtera

## Project Overview
PT Medika Sejahtera, a medical equipment distributor operating across the Greater Jakarta area, is experiencing cash flow constraints caused by delays in Delivery Note (DN) returns from healthcare institutions after goods are delivered. This project analyzes delay patterns across institutions and regions, examines the average return timeframe, and evaluates shipping methods that contribute to the issue — with the goal of providing actionable recommendations.

## Business Question
1. Which healthcare institutions have the highest number of delayed DN returns?
2. What is the average DN return time compared to on-time returns?
3. Which regions have the most DN return delays?
4. What delivery methods are commonly used in high-delay regions?

## Tools & Technologies
- **Python** — Pandas, Matplotlib, Seaborn, SQLAlchemy, ipython-sql
- **PostgreSQL** — Database & querying
- **Jupyter Notebook** — Analysis documentation

## Folder Structure
nama-repository/  
│  
├── Dataset/  
│   └── (raw CSV files)  
├── Notebook/  
│   ├── Data_Understanding.ipynb  
│   ├── Data_Cleaning.ipynb  
│   └── EDA.ipynb  
├── dataset_setup.sql  
├── ERD.dbdiagram  
├── df_clean.csv  
└── [README.md](http://readme.md/)

## Summary
After analyzing approximately 680 DN transactions at PT Medika Sejahtera throughout 2024, it was found that nearly 1 in 3 DNs were problematic — either returned late or not returned at all. This occurs because healthcare institutions delay returning the DN after receiving their orders, making it difficult for the company to issue invoices and plan finances accurately.

West Jakarta and Bekasi emerged as the two most problematic regions, accounting for 75 cases combined. Late DNs took an average of 30 days to be returned — 5 times longer than the normal 6-day window. At the institution level, private hospitals dominated the top 10, with 8 out of 10 problematic institutions being private hospitals, and Klinik Safitri recorded the highest number of problematic DNs throughout the year.

Interestingly, in West Jakarta, the issue cannot be attributed to any specific delivery method, as both internal and third-party couriers contributed almost equally. In Bekasi, however, third-party couriers accounted for up to 80% of cases — indicating a need to evaluate external courier performance in that region.

## Insight and Recomendation
### Key Insight
Throughout 2024, nearly 1 in 3 DNs were problematic — either returned late or not returned at all. West Jakarta and Bekasi emerged as the two most problematic regions, accounting for 75 cases combined, where delayed DNs took an average of 30 days to be returned — 5 times longer than the normal 6-day window. At the institution level, private hospitals dominated the top 10 with 8 out of 10 problematic institutions, and Klinik Safitri recorded the highest number of problematic DNs throughout the year.
Interestingly, in West Jakarta, the issue cannot be attributed to any specific delivery method, as both internal and third-party couriers contributed almost equally. In Bekasi, however, third-party couriers accounted for up to 80% of cases.