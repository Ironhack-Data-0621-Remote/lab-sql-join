use sakila;
-- 1. List number of films per category.
select name, count(film_id)
from film_category f
join category c
on c.category_id = f.category_id
group by c.category_id;

-- 2. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, a.address
from staff s
left join address a
on s.address_id = a.address_id;
-- 3. Display the total amount rung up by each staff member in August of 2005.
-- not sure if I interpreted "rung up" right, probably not :D 
select sum(amount) as collected_receivables, first_name, last_name
from payment p
join staff s
on s.staff_id = p.staff_id
group by s.staff_id;

-- 4. List each film and the number of actors who are listed for that film.
select fa.film_id, f.title, count(faf.actor_id) as number_of_actors
from film f
left join film_actor fa
on fa.film_id = f.film_id
join actor faf
on fa.actor_id = faf.actor_id
group by film_id
order by film_id;
-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
select last_name, sum(amount) as total_payment_amount
from payment p
join customer c
on p.customer_id = c.customer_id
group by p.customer_id
order by last_name;