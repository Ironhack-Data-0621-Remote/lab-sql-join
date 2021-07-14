USE sakila;

-- 1. List number of films per category.

SELECT name, count(film_id) as c_film
FROM category c
JOIN film_category f
ON c.category_id = f.category_id
GROUP BY name
ORDER BY c_film desc;

-- 2. Display the first and last names, as well as the address, of each staff member.

SELECT first_name, last_name, address, city, postal_code, district
FROM staff s
JOIN address a
ON s.address_id = a.address_id
JOIN city c
ON a.city_id = c.city_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.

SELECT first_name, sum(amount) as s_amount
FROM payment p
JOIN staff s
ON p.staff_id = s.staff_id
WHERE payment_date LIKE '2005-08%'
GROUP BY first_name;

-- 4. List each film and the number of actors who are listed for that film.

SELECT title, count(actor_id) AS n_actors
FROM film f
JOIN film_actor a
ON f.film_id = a.film_id
GROUP BY title
ORDER BY n_actors desc;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.

SELECT first_name, last_name, sum(amount)
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id
GROUP by first_name, last_name
ORDER BY last_name

