USE sakila;

-- 1. List number of films per category.
SELECT c.name, count(film_id) as film_count 
FROM film_category fc
JOIN category c 
ON fc.category_id = c.category_id
GROUP BY c.name;

-- 2. Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address, address2, postal_code, city, country
FROM staff s
JOIN address a
ON s.address_id = a.address_id
JOIN city c
ON a.city_id = c.city_id
JOIN country cn
ON c.country_id = cn.country_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.
SELECT first_name, last_name, sum(amount) as total_amount
FROM payment p
JOIN staff s
ON p.staff_id = s.staff_id
WHERE YEAR(payment_date) = 2005 AND MONTH(payment_date) = 8
GROUP BY first_name, last_name;

-- 4. List each film and the number of actors who are listed for that film.
SELECT title, count(actor_id) as no_of_actors
FROM film f
JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY title;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT last_name, first_name, c.customer_id, sum(amount) as payment_total
FROM customer c 
LEFT JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY  c.customer_id
ORDER BY last_name;
