-- DEFAULT RATE BY LOAN PURPOSE
-- Why are borrowers taking loans?
-- Which purposes carry the highest default risk?


USE lending_club;

SELECT 
    purpose,
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
    ROUND(AVG(int_rate), 2) AS avg_interest_rate,
    SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) AS total_defaults,
    ROUND(SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) 
          * 100.0 / COUNT(*), 2) AS default_rate_pct
FROM loans
GROUP BY purpose
ORDER BY default_rate_pct DESC;