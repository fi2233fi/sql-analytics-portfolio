-- ============================================================
-- Query 10: Average Days to Collect by Transaction Type
-- Business Problem: Which transaction types take longest to collect?
-- Skills: GROUP BY, AVG, MIN, MAX, ROUND, ORDER BY
-- ============================================================

SELECT
    transaction_type,
    COUNT(*) AS total_transactions,
    ROUND(AVG(days_to_collect), 1) AS avg_days_to_collect,
    MIN(days_to_collect) AS min_days,
    MAX(days_to_collect) AS max_days,
    SUM(amount) AS total_revenue
FROM finance_transactions
GROUP BY transaction_type
ORDER BY avg_days_to_collect DESC;

-- ============================================================
-- ACTUAL RESULTS
-- transaction_type  | total_transactions | avg_days_to_collect | min_days | max_days | total_revenue
-- Patient Payment   | 60                 | 52.4                | 12       | 80       | 10850.00
-- Insurance Payment | 90                 | 19.4                | 14       | 28       | 243875.00
--
-- Finding: Patient payments take 2.7x longer to collect than
-- insurance payments (52.4 vs 19.4 days) while generating only
-- 4.3% of total revenue. The 80 day max on patient payments
-- signals accounts approaching write-off thresholds. Early
-- intervention at 30 days could significantly reduce collection
-- time and bad debt exposure.
-- ============================================================
