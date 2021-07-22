USE sakila;
-- 1. List number of films per category.

SELECT DISTINCT g.name AS category, count(*) AS film_amount
FROM film_category fc
JOIN category g
WHERE fc.category_id = g.category_id
GROUP BY fc.category_id
ORDER BY film_amount DESC;

-- 2. Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a
ON s.address_id = a.address_id
;

-- 3. Display the total amount rung up by each staff member in August of 2005.

SELECT p.staff_id, concat(s.first_name, ' ', s.last_name) AS staff_name, sum(amount) AS total_amount_200508
FROM payment p
JOIN staff s
WHERE p.staff_id = s.staff_id
AND month(p.payment_date) = 8
AND year(p.payment_date) = 2005
GROUP BY p.staff_id
;

-- 4. List each film and the number of actors who are listed for that film.

SELECT fa.film_id, f.title, count(*) AS listd_actors
FROM film_actor fa
JOIN film f
ON fa.film_id = f.film_id
GROUP BY fa.film_id
;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer.
-- List the customers alphabetically by last name.

SELECT c.last_name, c.first_name, p.customer_id, p.amount
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name DESC
;