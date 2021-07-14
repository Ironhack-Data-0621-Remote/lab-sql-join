USE sakila;
-- 1. List number of films per category.
select name, count(film_id)
from film_category
left join category
on film_category.category_id = category.category_id
group by name;

-- 2. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address
from staff
left join address
on staff.address_id = address.address_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.
select first_name, sum(amount)
from staff
left join payment
on staff.staff_id = payment.staff_id
where MONTH(payment_date)=08 and YEAR(payment_date)=2005
group by first_name;

-- 4. List each film and the number of actors who are listed for that film.
select film.film_id, count(actor_id)
from film
left join film_actor
on film.film_id = film_actor.film_id
group by film.film_id;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select customer.customer_id, last_name, sum(amount)
from customer
left join payment
on customer.customer_id = payment.customer_id
group by last_name
order by last_name asc;

