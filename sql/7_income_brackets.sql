-- INCOME BRACKETS vs DEFAULT RATE
-- Uses CASE WHEN to create income segments
-- Analyzes how income level affects
-- loan amount, interest rate and default risk

USE lending_club;

SELECT 
    CASE 
        WHEN annual_inc < 30000  THEN '1. Below 30k'
        WHEN annual_inc < 60000  THEN '2. 30k - 60k'
        WHEN annual_inc < 100000 THEN '3. 60k - 100k'
        WHEN annual_inc < 150000 THEN '4. 100k - 150k'
        ELSE                          '5. Above 150k'
    END AS income_bracket,
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
    ROUND(AVG(int_rate), 2) AS avg_interest_rate,
    ROUND(SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) 
          * 100.0 / COUNT(*), 2) AS default_rate_pct
FROM loans
GROUP BY income_bracket
ORDER BY income_bracket ASC;