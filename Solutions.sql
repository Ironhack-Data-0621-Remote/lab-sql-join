USE sakila;
-- 1. List number of films per category.
SELECT f.film_id
FROM category c
JOIN film_category f
ON c.category_id = f.category_id;

-- 2. Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address
FROM staff s
JOIN address a
ON s.address_id = a.address_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.
SELECT COUNT(*)
FROM staff s
RIGHT JOIN rental r
ON s.staff_id = r.staff_id
WHERE rental_date BETWEEN '2005-08-01' AND '2005-08-31';

-- 4. List each film and the number of actors who are listed for that film.
SELECT f.*, COUNT(a.actor_id)
FROM film f
JOIN film_actor a
ON f.film_id = a.film_id
GROUP BY 1;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, SUM(p.amount)
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY 1, 2
ORDER BY 2;