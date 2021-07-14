USE sakila;
-- 1. List number of films per category.
SELECT f.category_id, c.name AS category, COUNT(f.film_id) AS number_of_movies
FROM film_category f
JOIN category c
ON f.category_id = c.category_id
GROUP BY f.category_id;
-- 2. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address, a.address2
FROM staff s
JOIN address a 
ON s.address_id = a.address_id;
-- (Tammy Sanders is a result from a previous lab and got inserted multiple times because i re-ran those sql queries)
-- 3. Display the total amount rung up by each staff member in August of 2005.
SELECT s.staff_id, s.first_name, SUM(p.amount)
FROM staff s
JOIN payment p
ON s.staff_id = p.staff_id
WHERE YEAR(payment_date) = 2005 
AND MONTH(payment_date) = 08
GROUP BY s.staff_id;
-- 4. List each film and the number of actors who are listed for that film.
SELECT f.film_id, f.title AS movie, COUNT(fa.actor_id) AS number_of_actors
FROM film f
JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.film_id;
-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount)
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;