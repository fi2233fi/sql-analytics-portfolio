-- ============================================================
-- Query 3: Denied Revenue by Denial Code
-- Business Problem: Which denial codes are costing the most?
-- Skills: GROUP BY, SUM, ORDER BY, aggregation
-- ============================================================

SELECT
    denial_code,
    denial_reason,
    COUNT(*) AS total_denials,
    SUM(billed_amount) AS total_denied_revenue,
    ROUND(AVG(billed_amount), 2) AS avg_denied_amount
FROM claims
WHERE status = 'Denied'
GROUP BY denial_code, denial_reason
ORDER BY total_denied_revenue DESC;

-- ============================================================
-- ACTUAL RESULTS
-- denial_code | denial_reason                | total_denials | total_denied_revenue | avg_denied_amount
-- CO-197      | Prior Auth Required          | 10            | 3835.00              | 383.50
-- CO-16       | Missing/Invalid Info         | 6             | 1870.00              | 311.67
-- CO-45       | Charges Exceed Fee Schedule  | 4             | 1815.00              | 453.75
-- CO-4        | Inconsistent Service Info    | 1             | 305.00               | 305.00
--
-- Finding: CO-197 (Prior Auth Required) accounts for the largest
-- share of denied revenue at $3,835 across 10 claims. This is a
-- preventable denial category. Addressing prior authorization
-- workflows upstream could recover the majority of denied revenue.
-- ============================================================
