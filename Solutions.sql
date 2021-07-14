USE sakila;
-- 1. List number of films per category.
select c.name as category, count(f.film_id) as films
from film f
left join film_category fc
on f.film_id = fc.film_id
join category c
on fc.category_id = c.category_id
group by c.name;

-- 2. Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address, a.address2, a.district, a.postal_code
from staff s
join address a
on s.address_id = a.address_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.
select s.first_name, s.last_name, count(r.staff_id) as rung_up
from rental r
left join staff s
on r.staff_id = s.staff_id
where r.rental_date like '2005-08%'
group by r.staff_id, s.first_name, s.last_name;

-- 4. List each film and the number of actors who are listed for that film.
select fa.film_id, f.title, count(fa.actor_id)
from film_actor fa
right join film f
on fa.film_id = f.film_id
group by fa.film_id, f.title;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_paid
from payment p
left join customer c
on p.customer_id = c.customer_id
group by c.customer_id
order by c.last_name;