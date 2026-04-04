CREATE TABLE h1b_2025 AS
SELECT * FROM h1b_q1_cleaned
UNION ALL
SELECT * FROM h1b_q2_cleaned
UNION ALL
SELECT * FROM h1b_q3_cleaned
UNION ALL
SELECT * FROM h1b_q4_cleaned;

select * from h1b_2025;

DESCRIBE h1b_q1_cleaned;
DESCRIBE h1b_q2_cleaned;
DESCRIBE h1b_q3_cleaned;
DESCRIBE h1b_q4_cleaned;

UPDATE h1b_2025
SET case_status = 'Withdrawn'
WHERE TRIM(case_status) = 'Certified-Withdrawn';

UPDATE h1b_2025
SET case_status = 'Withdrawn'
WHERE LOWER(TRIM(case_status)) LIKE 'certified-withdrawn%';

SELECT DISTINCT case_status
FROM h1b_2025;
UPDATE h1b_2025
SET case_status = 'Withdrawn'
WHERE case_status = 'Certified - Withdrawn';
SELECT case_status, LENGTH(case_status)
FROM h1b_2025
GROUP BY case_status;

set sql_safe_updates = 0;


-- ANALYSIS QUESTIONS
SELECT COUNT(*) AS total_applications
FROM h1b_2025;

SELECT case_status, COUNT(*) AS total
FROM h1b_2025
GROUP BY case_status
ORDER BY total DESC;

SELECT employer_name, COUNT(*) AS total_cases
FROM h1b_2025
GROUP BY employer_name
ORDER BY total_cases DESC
LIMIT 10;

SELECT worksite_state, COUNT(*) AS total_jobs
FROM h1b_2025
GROUP BY worksite_state
ORDER BY total_jobs DESC
LIMIT 10;

SELECT job_title, ROUND(AVG(yearly_salary),2) AS avg_salary
FROM h1b_2025
WHERE yearly_salary IS NOT NULL
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 10;

SELECT visa_class, COUNT(*) AS total
FROM h1b_2025
GROUP BY visa_class;

SELECT worksite_state, ROUND(AVG(yearly_salary),2) AS avg_salary
FROM h1b_2025
GROUP BY worksite_state
ORDER BY avg_salary DESC
LIMIT 10;

SELECT quarter_2025, COUNT(*) AS total_cases
FROM h1b_2025
GROUP BY quarter_2025
ORDER BY TOTAL_CASES;

SELECT case_status, COUNT(*) 
FROM h1b_2025
GROUP BY case_status;

-- to find duplicates and ignore them by choosing only distinct 
select distinct case_number from h1b_2025;

CREATE TABLE h1b_clean AS
SELECT DISTINCT *
FROM h1b_2025;

select * from h1b_clean;





