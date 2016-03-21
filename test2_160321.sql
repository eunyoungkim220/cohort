# Cohort Size
DROP TEMPORARY TABLE IF EXISTS cohort_size;
CREATE TEMPORARY TABLE cohort_size
SELECT
 LEFT(first_time, 7) Month,
 COUNT(*) num
FROM
 first_rental
GROUP BY 1
;