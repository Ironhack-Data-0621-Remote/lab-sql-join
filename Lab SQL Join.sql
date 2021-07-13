USE sakila;

-- 1. List number of films per category.
select count(f.film_id), c.new_name
from category c
join film_category f
on c.category_id = f.category_id
group by new_name;

-- 2. Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address
from address a
join staff s
on a.address_id = s.address_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.
select s.staff_id, sum(p.amount)
from payment p
join staff s
on p.staff_id = s.staff_id
group by staff_id;

-- 4. List each film and the number of actors who are listed for that film.
select f.title, count(fa.actor_id) as nb_actors
from film f
join film_actor fa
on f.film_id = fa.film_id
group by title;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.last_name, sum(p.amount) as total_paid
from payment p
join customer c
on p.customer_id = c.customer_id
group by c.last_name
order by c.last_name asc;
