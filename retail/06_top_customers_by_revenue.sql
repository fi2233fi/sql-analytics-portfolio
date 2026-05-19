-- ============================================================
-- Query 6: Top Customers by Revenue
-- Business Problem: Who are the highest value customers?
-- Skills: GROUP BY, SUM, ORDER BY, LIMIT
-- ============================================================

SELECT
    customer_id,
    customer_segment,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_spent,
    ROUND(AVG(amount), 2) AS avg_order_value
FROM transactions
GROUP BY customer_id, customer_segment
ORDER BY total_spent DESC
LIMIT 5;

-- ============================================================
-- ACTUAL RESULTS
-- customer_id | customer_segment | total_transactions | total_spent | avg_order_value
-- CUST10      | Wholesale        | 12                 | 45600.00    | 3800.00
-- CUST07      | Wholesale        | 12                 | 37000.00    | 3083.33
-- CUST08      | Wholesale        | 12                 | 34600.00    | 2883.33
-- CUST01      | Wholesale        | 12                 | 29400.00    | 2450.00
-- CUST05      | Wholesale        | 12                 | 26700.00    | 2225.00
--
-- Finding: All top 5 customers by revenue are Wholesale accounts.
-- CUST10 leads at $45,600 with the highest avg order value of
-- $3,800. Wholesale segment drives disproportionate revenue and
-- warrants dedicated account management and retention efforts.
-- ============================================================
