-- ============================================================
-- Query 2: Claims Aging Analysis
-- Business Problem: How long are claims sitting unpaid?
-- Skills: CASE, GROUP BY, aggregation, ORDER BY
-- ============================================================

SELECT
    payer,
    COUNT(*) AS total_claims,
    ROUND(AVG(days_outstanding), 1) AS avg_days_outstanding,
    SUM(CASE WHEN days_outstanding > 30 THEN 1 ELSE 0 END) AS over_30_days,
    SUM(CASE WHEN days_outstanding > 45 THEN 1 ELSE 0 END) AS over_45_days
FROM claims
WHERE status = 'Denied'
GROUP BY payer
ORDER BY avg_days_outstanding DESC;

-- ============================================================
-- ACTUAL RESULTS
-- payer        | total_claims | avg_days_outstanding | over_30_days | over_45_days
-- Cigna        | 5            | 40.0                 | 4            | 2
-- Healthfirst  | 4            | 38.5                 | 3            | 1
-- Aetna        | 4            | 38.3                 | 3            | 0
-- MetroPlus    | 3            | 35.7                 | 2            | 0
-- Anthem       | 3            | 32.7                 | 2            | 0
-- United       | 2            | 32.0                 | 1            | 0
--
-- Finding: Cigna and Healthfirst have the highest aging risk.
-- Cigna has 2 claims exceeding 45 days, approaching timely filing
-- limits. All payers average over 30 days on denied claims,
-- indicating a systemic follow-up gap.
-- ============================================================
