USE sakila;
-- 1. List number of films per category.
-- select c.name, count(film_id) as 'num_film'
-- from category c
-- join film_category f
-- on c.category_id = f.category_id
-- group by c.name;


-- 2. Display the first and last names, as well as the address, of each staff member.
-- select first_name, last_name, address, postal_code, city 
-- from staff s
-- join address a
-- on s.address_id = a.address_id
-- join city c
-- on a.city_id = c.city_id;


-- 3. Display the total amount rung up by each staff member in August of 2005.
-- select first_name, count(rental_id), date_format(convert(rental_date,date), '%m')
-- from rental r
-- join staff s
-- on r.staff_id = s.staff_id
-- where r.rental_date = '08'
-- group by s.first_name;


-- 4. List each film and the number of actors who are listed for that film.
-- select title, first_name, last_name
-- from film f
-- join film_actor fa
-- on f.film_id = fa.film_id
-- join actor a
-- on fa.actor_id = a.actor_id
-- order by title;


-- 5. Using the tables payment and customer and the JOIN command, 
-- list the total paid by each customer. List the customers alphabetically by last name.
-- select c.first_name, c.last_name, count(p.payment_id)
-- from customer c
-- join payment p
-- on c.customer_id = p.customer_id
-- group by c.first_name, c.last_name
-- order by c.last_name asc;