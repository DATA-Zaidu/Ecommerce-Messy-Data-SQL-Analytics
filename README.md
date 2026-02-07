
# E-Commerce Analytics on Messy Production Data (SQL & BigQuery)

This project demonstrates an end-to-end analytics workflow on raw,
uncleaned e-commerce data using Google BigQuery.

The datasets contain duplicates, inconsistent date formats, invalid
values, and test users, simulating real-world production environments.

The objective is to transform messy data into reliable analytical
tables and generate actionable business insights using SQL.

---

## Business Problem

The business was experiencing:

- Low repeat purchase rates  
- High customer churn  
- Revenue leakage due to order cancellations  
- Unreliable reporting caused by poor data quality  

Management required a reliable analytics layer to support
data-driven decision-making.

---

## Data Challenges

The raw datasets included:

- Duplicate users and orders  
- Multiple date formats and invalid dates  
- Amount values stored as text  
- Test users mixed with real users  
- Inconsistent categorical values  

Direct analysis on this data would have produced misleading KPIs.

---

## Methodology

The project followed a structured analytics pipeline:

1. Data auditing and profiling  
2. SQL-based data cleaning and standardization  
3. Deduplication using window functions  
4. Creation of reusable analytical views  
5. Business analysis and KPI generation  

All transformations were performed directly in SQL.

---

## Key Analyses

- Funnel Analysis (Visit → Cart → Purchase)  
- Cohort Retention Analysis  
- Churn Detection (30-day inactivity rule)  
- Reactivation Analysis  
- Revenue and Cancellation Analysis  

---

## Key Results

- Funnel conversion rate: ~6.5%  
- Month-1 retention: ~12–13%  
- Customer churn rate: ~66%  
- Order cancellation rate: ~20%  
- Total revenue (delivered orders): ₹33.4M  

These results indicate strong opportunities for improving conversion,
retention, and operational efficiency.

---

## Sample Outputs

Screenshots of key analyses are available in the `screenshots/` folder.

- Funnel performance  
- Retention cohort table  
- Churn distribution  

---

## Tools & Technologies

- SQL (CTEs, Window Functions, Date Functions)  
- Google BigQuery  
- CSV Data Sources  

---

## Project Structure

ecommerce-messy-data-sql-analytics/
│
├── data/
├── sql/
├── insights/
├── screenshots/
└── README.md

---

## Business Impact

This analysis enables stakeholders to:

- Identify critical funnel drop-offs  
- Improve customer retention strategies  
- Reduce churn and reactivation costs  
- Minimize revenue loss from cancellations  
- Build reliable dashboards and reports  

---

## Limitations

- Synthetic data used to simulate production environments  
- Limited historical data window (4 months)  
- No demographic attributes available  

---

## Author

Mohammad Zaid  
Data Analyst | SQL & BigQuery

