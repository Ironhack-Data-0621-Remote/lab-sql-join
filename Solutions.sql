USE sakila;
-- 1. List number of films per category.
-- 2. Display the first and last names, as well as the address, of each staff member.
-- 3. Display the total amount rung up by each staff member in August of 2005.
-- 4. List each film and the number of actors who are listed for that film.
-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.


USE sakila;
-- 1. List number of films per category.

SELECT c.name as category_name, COUNT(fc.film_id) as number_of_films
FROM sakila.film_category fc 
JOIN sakila.film f  
ON fc.film_id=f.film_id
JOIN category c 
ON c.category_id=fc.category_id
GROUP BY fc.category_id
ORDER BY fc.category_id ASC;


-- 2. Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address, a.district, a.city_id
FROM sakila.staff s
JOIN sakila.address a  
ON s.address_id=a.address_id;
-- a.address2 = NULL 


-- 3. Display the total amount rung up by each staff member in August of 2005.

SELECT DISTINCT staff_id, count(rental_id) AS amount_rentals
FROM rental
WHERE rental_date REGEXP '^2005-08'
GROUP BY staff_id;


-- 4. List each film and the number of actors who are listed for that film.

SELECT f.title, COUNT(fa.actor_id)
FROM sakila.film f
JOIN sakila.film_actor fa   
ON f.film_id=fa.film_id
GROUP BY f.title
ORDER BY f.title ASC;


-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.

SELECT p.customer_id, SUM(p.amount) as sum_amount, c.last_name
FROM sakila.payment p 
JOIN sakila.customer c
ON c.customer_id=p.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name ASC;
