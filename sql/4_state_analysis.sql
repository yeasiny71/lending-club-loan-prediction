-- TOP 10 STATES BY LOAN VOLUME & DEFAULT RATE
-- State is extracted from address column
-- using SUBSTRING_INDEX string function

USE lending_club;

SELECT 
    SUBSTRING(SUBSTRING_INDEX(address, ', ', -1), 1, 2) AS state,
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
    ROUND(SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) 
          * 100.0 / COUNT(*), 2) AS default_rate_pct
FROM loans
GROUP BY state
ORDER BY total_loans DESC
LIMIT 10;