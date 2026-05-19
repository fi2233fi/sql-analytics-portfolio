-- ============================================================
-- Query 5: Revenue by Product Category
-- Business Problem: Which product categories drive the most revenue?
-- Skills: GROUP BY, SUM, ROUND, ORDER BY, subquery
-- ============================================================

SELECT
    product_category,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_revenue,
    ROUND(AVG(amount), 2) AS avg_transaction_value,
    ROUND(SUM(amount) * 100.0 / (SELECT SUM(amount) FROM transactions), 1) AS revenue_share_pct
FROM transactions
GROUP BY product_category
ORDER BY total_revenue DESC;

-- ============================================================
-- ACTUAL RESULTS
-- product_category | total_transactions | total_revenue | avg_transaction_value | revenue_share_pct
-- Spices           | 30                 | 62820.00      | 2094.00               | 41.0
-- Nuts             | 24                 | 45735.00      | 1905.63               | 29.9
-- Grains           | 18                 | 36060.00      | 2003.33               | 23.5
-- Dried Fruits     | 18                 | 8550.00       | 475.00                | 5.6
--
-- Finding: Spices account for 41% of total revenue and have the
-- highest average transaction value at $2,094. Dried Fruits
-- represents only 5.6% of revenue despite equal transaction volume
-- to Grains, suggesting a pricing or demand gap worth investigating.
-- ============================================================
