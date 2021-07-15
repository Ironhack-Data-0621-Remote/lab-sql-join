USE sakila;

-- 1. List number of films per category.

SELECT c.name, count(fc.film_id) as film
FROM film_category fc
JOIN category c
ON fc.category_id = c.category_id
GROUP BY fc.category_id;

-- 2. Display the first and last names, as well as the address, of each staff member.
-- tables needed are staff (first name, last name, staff id) and address (address)

SELECT s.first_name, s.last_name, a.address
FROM address a
JOIN staff s 
ON a.address_id = s.address_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.
-- tables needed are staff (first name, last name, staff id) and rental (staff_id, rental_id, rental_date)
-- I dont undestand why my where statement doesnt work

SELECT s.first_name, s.last_name, count(r.rental_id) as rentals,
RANK() over(order by count(r.rental_id) desc) as "RANK"
FROM rental r 
JOIN staff s 
ON r.staff_id = s.staff_id
GROUP BY r.staff_id
WHERE year(r.rental_date) = 2005
AND month(r.rental_date) = 8;


select 
sum(case when year(rental_date) = 2006 and month(rental_date) = 2 then 1 else 0 end) as last_month_activity
from rental;

-- 4. List each film and the number of actors who are listed for that film.
-- tables needed are film_actor (film_id, actor_id) and film (title)

SELECT f.title, count(distinct(fa.actor_id)) as no_of_actors
FROM film f
JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY no_of_actors desc;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
-- JOIN ON customer_id
-- GROUP customer_id 
-- calculate rental_id * amount

SELECT c.last_name, (count(p.rental_id) * p.amount) as total_paid
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name;