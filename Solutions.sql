USE sakila;
-- 1. List number of films per category.

select fc.category_id, c.name, count(f.title) as number_of_films
from film_category fc
join film f
on fc.film_id = f.film_id
join category c
on fc.category_id = c.category_id
group by fc.category_id
order by fc.category_id;

-- 2. Display the first and last names, as well as the address, of each staff member.

select s.first_name, s.last_name, a.address, a.district, a.postal_code
from staff s
join address a
on s.address_id = a.address_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.

select s.first_name, s.last_name, count(r.rental_id)
from staff s
join rental r
on s.staff_id = r.staff_id
where month(r.rental_date) = 05 and year(r.rental_date) = 2005
group by s.first_name, s.last_name;


-- 4. List each film and the number of actors who are listed for that film.

select f.title, count(a.actor_id)
from film f
join film_actor a
on f.film_id = a.film_id
group by f.title;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select sum(p.amount) as total_paid, c.first_name, c.last_name
from payment p
join customer c
on p.customer_id = c.customer_id
group by c.first_name, c.last_name
order by c.last_name;
