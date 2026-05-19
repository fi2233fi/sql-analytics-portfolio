-- ============================================================
-- Query 12: Payer Reimbursement Rate Analysis
-- Business Problem: Which payers reimburse the highest percentage
-- of billed amounts?
-- Skills: CTE, GROUP BY, SUM, ROUND, NULLIF, calculated columns
-- ============================================================

WITH payer_summary AS (
    SELECT
        payer,
        COUNT(*) AS total_claims,
        SUM(billed_amount) AS total_billed,
        SUM(paid_amount) AS total_paid,
        SUM(CASE WHEN status = 'Paid' THEN 1 ELSE 0 END) AS paid_claims
    FROM claims
    GROUP BY payer
)
SELECT
    payer,
    total_claims,
    total_billed,
    total_paid,
    paid_claims,
    ROUND(total_paid / total_billed * 100, 1) AS reimbursement_rate_pct,
    ROUND(total_paid / NULLIF(paid_claims, 0), 2) AS avg_payment_per_paid_claim
FROM payer_summary
ORDER BY reimbursement_rate_pct DESC;

-- ============================================================
-- ACTUAL RESULTS
-- payer       | total_claims | total_billed | total_paid | paid_claims | reimbursement_rate_pct | avg_payment_per_paid_claim
-- United      | 8            | 3015.00      | 1952.00    | 6           | 64.7                   | 325.33
-- Anthem      | 10           | 3570.00      | 1968.00    | 7           | 55.1                   | 281.14
-- MetroPlus   | 8            | 3140.00      | 1436.00    | 5           | 45.7                   | 287.20
-- Healthfirst | 8            | 2895.00      | 1172.00    | 4           | 40.5                   | 293.00
-- Aetna       | 8            | 3080.00      | 1228.00    | 4           | 39.9                   | 307.00
-- Cigna       | 8            | 2900.00      | 864.00     | 3           | 29.8                   | 288.00
--
-- Finding: United has the highest reimbursement rate at 64.7%
-- while Cigna sits at the bottom at 29.8%. Cigna also had the
-- highest denial rate in Query 1 at 62.5%, making it the most
-- problematic payer across both volume and revenue metrics.
-- Contract renegotiation or stricter prior auth compliance
-- for Cigna claims is warranted.
-- ========
