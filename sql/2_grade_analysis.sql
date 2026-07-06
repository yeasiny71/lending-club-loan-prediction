-- DEFAULT RATE BY LOAN GRADE
-- LendingClub assigns grades A-G to loans
-- Higher grade = lower risk
-- Calculates actual default rate per grade

USE lending_club;

SELECT 
    grade,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) AS total_defaults,
    ROUND(SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) 
          * 100.0 / COUNT(*), 2) AS default_rate_pct,
    ROUND(AVG(int_rate), 2) AS avg_interest_rate
FROM loans
GROUP BY grade
ORDER BY grade ASC;