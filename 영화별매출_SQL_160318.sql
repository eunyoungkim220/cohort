#1.
SELECT
f.film_id,
f.title,
f.rental_rate*COUNT(*) total_rental
FROM
rental r,
film f,
inventory i
WHERE 
r. inventory_id=i.inventory_id
AND i.film_id=f.film_id
GROUP BY 1
;

#2.
DROP TEMPORARY TABLE IF EXISTS revenue_per_film;
CREATE TEMPORARY TABLE revenue_per_film
SELECT
 f.film_id,
 f.title,
 f.rental_rate*COUNT(*) total_rental
FROM
 rental r,
 film f,
 inventory i
WHERE 
 r. inventory_id=i.inventory_id
 AND i.film_id=f.film_id
GROUP BY 1
;


SELECT 
	actor.actor_id
	CONCAT(actor.first_name, actor.last_name) name
	SUM(rfp totla_revue) total_revenue_per_actor
FROM
revenue_per_film rpf , actor a, film_actor fa 
WHERE
 film.film_id=film_actor.film_id
 AND film_actor.actor_id=actor.actor_id
GROUP BY actor.actor_id
ORDER BY totla_revenue_per_actor DESC