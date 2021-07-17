USE sakila;
-- 1. List number of films per category.
SELECT fc.category_id, name, COUNT(film_id) as 'Number of films'
FROM film_category fc
JOIN category c
ON fc.category_id = c.category_id
GROUP BY category_id;


-- 2. Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address 
FROM staff s
JOIN address a
ON s.address_id = a.address_id;
 

-- 3. Display the total amount rung up by each staff member in August of 2005.
SELECT first_name, last_name, SUM(amount)
FROM staff s
JOIN payment p
ON s.staff_id = p.staff_id
WHERE payment_date >= '2005-08-01' AND payment_date <= '2005-08-31'
GROUP BY first_name, last_name;


-- 4. List each film and the number of actors who are listed for that film.
SELECT title, COUNT(actor_id) as 'number of actors'
FROM film f
JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY title;


-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT first_name, last_name, SUM(amount)
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY first_name, last_name
ORDER BY last_name ASC;


