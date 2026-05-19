-- ============================================================
-- Query 8: Transaction Risk Classification
-- Business Problem: How much revenue sits in each risk tier?
-- Skills: CASE, GROUP BY, SUM, FIELD, subquery
-- ============================================================

SELECT
    risk_flag,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_revenue,
    ROUND(AVG(days_to_collect), 1) AS avg_days_to_collect,
    ROUND(SUM(amount) * 100.0 / (SELECT SUM(amount) FROM finance_transactions), 1) AS revenue_share_pct
FROM finance_transactions
GROUP BY risk_flag
ORDER BY FIELD(risk_flag, 'High', 'Medium', 'Low');

-- ============================================================
-- ACTUAL RESULTS
-- risk_flag | total_transactions | total_revenue | avg_days_to_collect | revenue_share_pct
-- High      | 24                 | 3330.00       | 62.5                | 2.2
-- Medium    | 18                 | 19110.00      | 32.3                | 12.5
-- Low       | 48                 | 130395.00     | 17.8                | 85.3
--
-- Finding: High risk transactions average 62.5 days to collect
-- and represent only 2.2% of total revenue, making them prime
-- write-off candidates. Low risk accounts drive 85.3% of revenue
-- at under 18 days average collection time, confirming the
-- importance of protecting and prioritizing these accounts.
-- ============================================================
