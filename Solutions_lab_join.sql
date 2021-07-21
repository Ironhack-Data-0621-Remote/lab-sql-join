USE sakila;
-- 1. List number of films per category.
SELECT category_id, count(film_id) as film_nb
FROM film_category
GROUP BY category_id
ORDER BY category_id;  

-- 2. Display the first and last names, as well as the address, of each staff member.
SELECT* FROM staff;
-- I dont't know if it's normal but I get only NULL values in this table. 

SELECT first_name, last_name, address
FROM staff
RIGHT JOIN address
on staff.address_id = address.address_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.
SELECT staff.staff_id, count(rental_id)
FROM staff
RIGHT JOIN rental
on staff.staff_id = rental.staff_id
WHERE DATE(rental_date) BETWEEN DATE ('2005-08-01') AND DATE('2005-08-31')
GROUP BY staff.staff_id;

-- 4. List each film and the number of actors who are listed for that film.
SELECT film.film_id, count(actor_id) as actor_nb
FROM film
RIGHT JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY film.film_id; 

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT customer.last_name, SUM(amount) as total_paid
FROM payment
LEFT JOIN customer
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY customer.last_name; 
