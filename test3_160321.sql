
SELECT
 date_format(fr.first_time, "%Y%m") cohort_formatted, 
 date_format(r.rental_date, "%Y%m") rental_date_formated, 
 cs.num cohort_size,
 SUM(p.amount) month_revenue,
 SUM(p.amount)/cs.num RPU
FROM
 rental r 
 JOIN first_rental fr
 ON r.customer_id = fr.customer_id
 JOIN cohort_size cs
 ON cs.month = LEFT(fr.first_time, 7)
 JOIN payment p
 ON p.rental_id = r.rental_id
GROUP BY 1, 2
;