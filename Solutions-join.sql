USE sakila;

-- 1. List number of films per category.
SELECT c.category_id, c.name, COUNT(f.film_id) AS nbr_films
FROM film f
JOIN film_category fc
USING(film_id)
JOIN category c
USING(category_id)
GROUP BY 2
ORDER BY 3 DESC;

-- 2. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address, a.address2
FROM staff s
JOIN address a
USING(address_id);

-- 3. Display the total amount rung up by each staff member in August of 2005.
SELECT s.staff_id, COUNT(r.staff_id) AS films_rented
FROM rental r
JOIN staff s
USING(staff_id)
WHERE MONTH(r.rental_date) = 08 AND YEAR(r.rental_date) = 2005
GROUP BY 1;

-- 4. List each film and the number of actors who are listed for that film.
SELECT f.film_id, f.title, COUNT(fa.actor_id) AS nbr_actors
FROM film f
JOIN film_actor fa
USING(film_id)
GROUP BY 1
ORDER BY 3 DESC;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT p.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_amount_paid
FROM customer c
LEFT JOIN payment p
USING(customer_id)
GROUP BY 1
ORDER BY 3;
