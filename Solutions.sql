USE sakila;
-- 1. List number of films per category.
SELECT category_id, count(film_id)
FROM film_category
GROUP BY category_id;

-- 2. Display the first and last names, as well as the address, of each staff member.
SELECT * FROM staff;

SELECT * FROM address;

SELECT first_name, last_name, address
FROM staff s
JOIN address a
on s.address_id = a.address_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.

-- USING REGEXP
SELECT DISTINCT staff_id, count(rental_id)
FROM rental
WHERE rental_date REGEXP '^2005-08'
GROUP BY staff_id;
-- USING LIKE
SELECT DISTINCT staff_id, count(rental_id)
FROM rental
WHERE rental_date LIKE '2005-08%'
GROUP BY staff_id;

-- 4. List each film and the number of actors who are listed for that film.
SELECT f.film_id, title, count(fa.actor_id)
FROM film_actor fa
JOIN film f
on fa.film_id = f.film_id
GROUP BY f.film_id, title;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT * FROM customer;
SELECT p.customer_id, last_name, first_name, sum(p.amount)
FROM payment p
LEFT JOIN customer c
on p.customer_id = c.customer_id
GROUP BY p.customer_id, last_name, first_name
ORDER BY last_name asc;

