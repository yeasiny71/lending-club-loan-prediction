-- WINDOW FUNCTIONS
-- RANK loans within each grade by loan amount
-- AVG loan amount per grade as running context

USE lending_club;

SELECT 
    grade,
    loan_amnt,
    int_rate,
    loan_status,
    RANK() OVER (PARTITION BY grade 
                 ORDER BY loan_amnt DESC) AS rank_within_grade,
    ROUND(AVG(loan_amnt) OVER (PARTITION BY grade), 2) AS avg_loan_in_grade,
    ROUND(loan_amnt - AVG(loan_amnt) OVER (PARTITION BY grade), 2) AS diff_from_grade_avg
FROM loans
LIMIT 100;