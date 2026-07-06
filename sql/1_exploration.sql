-- LENDING CLUB LOAN DATA - BASIC EXPLORATION
-- Analyze distribution of loan status
-- (our target variable)

USE lending_club;

SELECT 
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM loans
GROUP BY loan_status
ORDER BY total_loans DESC;