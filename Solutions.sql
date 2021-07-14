USE sakila;
-- 1. List number of films per category.
select name, count(film_id)
from category c
join film_category fc
on c.category_id = fc.category_id;

-- 2. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address
from staff s
left join address a
on s.address_id = a.address_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.
-- I dont get the question

-- 4. List each film and the number of actors who are listed for that film.
select title, count(actor_id)
from film f
left join film_actor af
on f.film_id = af.film_id
group by title;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select last_name, first_name, sum(amount)
from customer c
left join payment p
on c.customer_id=p.customer_id
group by last_name, first_name
order by last_name;
