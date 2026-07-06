-- CTE: HIGH RISK BORROWER SEGMENTS
-- Uses two CTEs:
-- 1. loan_segments: aggregates by grade+purpose
-- 2. high_risk: filters segments where
--    default rate > 25% and sample size > 10

USE lending_club;

WITH loan_segments AS (
    SELECT 
        grade,
        purpose,
        COUNT(*) AS total_loans,
        ROUND(AVG(loan_amnt), 2) AS avg_loan_amnt,
        ROUND(AVG(int_rate), 2) AS avg_int_rate,
        ROUND(SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) 
              * 100.0 / COUNT(*), 2) AS default_rate_pct
    FROM loans
    GROUP BY grade, purpose
),
high_risk AS (
    SELECT *
    FROM loan_segments
    WHERE default_rate_pct > 25
    AND total_loans > 100
)
SELECT *
FROM high_risk
ORDER BY default_rate_pct DESC
LIMIT 15;