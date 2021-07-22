-- lab-sql-join
USE sakila;
-- List number of films per category. 

SELECT category, COUNT(*) as num_film
FROM film_list
GROUP BY category 
HAVING num_film 
ORDER BY num_film;

-- Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name AS FirstName, s.last_name AS LastName, a.address AS Address
FROM staff AS s
JOIN address AS a 
ON a.address_id = s.address_id;

-- Display the total amount rung up by each staff member in August of 2005.

SELECT first_name, last_name, SUM(amount) AS rng_amnt
FROM staff s
JOIN payment p
ON s.staff_id = p.staff_id
GROUP BY p.staff_id;

-- List each film and the number of actors who are listed for that film.

SELECT title, COUNT(actor_id) AS num_actors
FROM film f
JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY title;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer.
-- List the customers alphabetically by last name.

SELECT last_name, first_name, SUM(amount) total_paid
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY last_name ASC;