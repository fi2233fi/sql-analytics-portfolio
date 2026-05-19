-- ============================================================
-- Query 7: Monthly Revenue Trend
-- Business Problem: How is revenue trending month over month?
-- Skills: DATE functions, GROUP BY, SUM, ORDER BY
-- ============================================================

SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_revenue,
    ROUND(AVG(amount), 2) AS avg_transaction_value
FROM transactions
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY month ASC;

-- ============================================================
-- ACTUAL RESULTS
-- month   | total_transactions | total_revenue | avg_transaction_value
-- 2024-01 | 65                 | 91000.00      | 1400.00
-- 2024-02 | 70                 | 133625.00     | 1908.93
-- 2024-03 | 15                 | 30650.00      | 2043.33
--
-- Finding: Revenue grew 46.8% from January to February while
-- average transaction value increased each month from $1,400 to
-- $2,043. March is partial but shows the highest avg transaction
-- value, suggesting higher value orders are increasing over time.
-- ============================================================
