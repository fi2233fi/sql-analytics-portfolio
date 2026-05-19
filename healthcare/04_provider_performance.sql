-- ============================================================
-- Query 4: Provider Performance Comparison
-- Business Problem: Which providers have the highest denial rates
-- and lowest reimbursement?
-- Skills: GROUP BY, aggregation, CASE, calculated columns
-- ============================================================

SELECT
    provider,
    COUNT(*) AS total_claims,
    SUM(CASE WHEN status = 'Denied' THEN 1 ELSE 0 END) AS total_denials,
    ROUND(
        SUM(CASE WHEN status = 'Denied' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
    ) AS denial_rate_pct,
    SUM(billed_amount) AS total_billed,
    SUM(paid_amount) AS total_paid,
    ROUND(SUM(paid_amount) / SUM(billed_amount) * 100, 1) AS reimbursement_rate_pct
FROM claims
GROUP BY provider
ORDER BY denial_rate_pct DESC;

-- ============================================================
-- ACTUAL RESULTS
-- provider     | total_claims | total_denials | denial_rate_pct | total_billed | total_paid | reimbursement_rate_pct
-- Dr. Patel    | 17           | 11            | 64.7            | 7265.00      | 2420.00    | 33.3
-- Dr. Johnson  | 18           | 6             | 33.3            | 6865.00      | 3600.00    | 52.4
-- Dr. Singh    | 15           | 4             | 26.7            | 4470.00      | 2600.00    | 58.2
--
-- Finding: Dr. Patel has a 64.7% denial rate and collects only
-- 33 cents per dollar billed, nearly half the rate of Dr. Singh.
-- This suggests a documentation or coding issue specific to
-- Dr. Patel's claims that warrants immediate review.
-- ============================================================
