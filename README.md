# SQL Analytics Portfolio

I built this portfolio to demonstrate applied SQL skills in contexts I
actually understand. My background is in healthcare revenue cycle
management and retail analytics, so rather than using generic datasets,
I designed schemas and data that reflect real business problems I have
encountered in my work.

Every query in this repo was written and executed against a live MySQL
database. The actual results are documented at the bottom of each file
so you can see exactly what the query returns and what it means.

---

## Why These Domains

**Healthcare** is where most of my professional experience lives. I work
in RCM and deal with payer denials, claims aging, and provider billing
patterns daily. These four queries reflect the questions I actually ask
about real data at work.

**Retail** comes from three years of data and ecommerce analytics work at
a specialty food retailer. Revenue by category, customer value, and
monthly trends are the core questions any retail analyst needs to answer
quickly.

**Finance** and **Operations** round out the portfolio with risk
classification, write-off analysis, and claims prioritization, skills
that translate across healthcare, insurance, and financial services roles.

---

## Queries

### Healthcare
Revenue cycle management analysis for a multi-payer outpatient practice.

| # | Query | Skills |
|---|-------|--------|
| 01 | [Denial Rate by Payer](healthcare/01_denial_rate_by_payer.sql) | GROUP BY, CASE, aggregation |
| 02 | [Claims Aging Analysis](healthcare/02_claims_aging_analysis.sql) | CASE, GROUP BY, WHERE |
| 03 | [Denied Revenue by Denial Code](healthcare/03_denied_revenue_by_denial_code.sql) | GROUP BY, SUM, ORDER BY |
| 04 | [Provider Performance Comparison](healthcare/04_provider_performance.sql) | GROUP BY, CASE, calculated columns |

### Retail
Sales and customer analysis for a specialty food retailer.

| # | Query | Skills |
|---|-------|--------|
| 05 | [Revenue by Product Category](retail/05_revenue_by_product_category.sql) | GROUP BY, SUM, subquery |
| 06 | [Top Customers by Revenue](retail/06_top_customers_by_revenue.sql) | GROUP BY, SUM, LIMIT |
| 07 | [Monthly Revenue Trend](retail/07_monthly_revenue_trend.sql) | DATE functions, GROUP BY |

### Finance
Risk classification and collections performance analysis.

| # | Query | Skills |
|---|-------|--------|
| 08 | [Transaction Risk Classification](finance/08_transaction_risk_classification.sql) | CASE, GROUP BY, FIELD |
| 09 | [Written Off Revenue by Department](finance/09_written_off_revenue_by_department.sql) | CASE, GROUP BY, SUM |
| 10 | [Average Days to Collect](finance/10_avg_days_to_collect.sql) | AVG, MIN, MAX, GROUP BY |

### Operations
Claims prioritization and payer contract analysis.

| # | Query | Skills |
|---|-------|--------|
| 11 | [High Priority Open Claims](operations/11_high_priority_open_claims.sql) | CASE, WHERE, ORDER BY |
| 12 | [Payer Reimbursement Rate Analysis](operations/12_payer_reimbursement_rate.sql) | CTE, NULLIF, calculated columns |

---

## Tools
MySQL 8.0

## Author
Fatima Iqbal
