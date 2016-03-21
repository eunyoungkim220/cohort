
SELECT
 r.customer_id,
 MIN(r.rental_date)
FROM
 rental r 
GROUP BY 1
;