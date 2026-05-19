-- ============================================================
-- Query 1: Denial Rate by Payer
-- Business Problem: Which payers are denying the most claims?
-- Skills: GROUP BY, aggregation, CASE, calculated columns
-- ============================================================

SELECT
    payer,
    COUNT(*) AS total_claims,
    SUM(CASE WHEN status = 'Denied' THEN 1 ELSE 0 END) AS total_denials,
    ROUND(
        SUM(CASE WHEN status = 'Denied' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
    ) AS denial_rate_pct
FROM claims
GROUP BY payer
ORDER BY denial_rate_pct DESC;

-- ============================================================
-- ACTUAL RESULTS
-- payer        | total_claims | total_denials | denial_rate_pct
-- Cigna        | 8            | 5             | 62.5
-- Aetna        | 8            | 4             | 50.0
-- Healthfirst  | 8            | 4             | 50.0
-- MetroPlus    | 8            | 3             | 37.5
-- Anthem       | 10           | 3             | 30.0
-- United       | 8            | 2             | 25.0
--
-- Finding: Cigna has the highest denial rate at 62.5%, more than
-- double United's rate of 25%. Aetna and Healthfirst are tied at
-- 50%, suggesting prior authorization workflows need review across
-- multiple payers.
-- ============================================================
