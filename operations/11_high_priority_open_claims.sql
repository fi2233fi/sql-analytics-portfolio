-- ============================================================
-- Query 11: High Priority Open Claims
-- Business Problem: Which denied claims need immediate follow up?
-- Skills: WHERE, ORDER BY, CASE
-- ============================================================

SELECT
    claim_id,
    patient_last_name,
    provider,
    payer,
    denial_code,
    denial_reason,
    billed_amount,
    days_outstanding,
    CASE
        WHEN days_outstanding >= 45 THEN 'Critical'
        WHEN days_outstanding >= 30 THEN 'Urgent'
        ELSE 'Monitor'
    END AS priority_level
FROM claims
WHERE status = 'Denied'
ORDER BY days_outstanding DESC;

-- ============================================================
-- ACTUAL RESULTS: 21 denied claims returned
-- 5 Critical (45+ days): C009, C025, C012, C002, C034
-- 11 Urgent (30-44 days): C043, C011, C029, C004, C027,
--                         C005, C037, C019, C016, C046, C007
-- 5 Monitor (under 30 days): C022, C014, C031, C039, C048
--
-- Finding: 5 claims are in Critical status at 45+ days,
-- all flagged CO-197 Prior Auth Required. Dr. Patel appears
-- across the majority of Critical and Urgent rows, consistent
-- with the provider performance findings in Query 4. Immediate
-- outreach required on Critical claims to avoid timely filing
-- limit violations.
-- ============================================================
