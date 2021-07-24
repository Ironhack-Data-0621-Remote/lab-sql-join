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
SELECT s.staff_id, CONCAT(s.first_name,' ',s.last_name) AS employee, sum(p.amount) AS total
FROM sakila.staff AS s
INNER JOIN sakila.payment AS p
ON s.staff_id = p.staff_id
WHERE month(p.payment_date) = 8 AND year(p.payment_date) = 2005
GROUP BY s.staff_id;

-- 4. List each film and the number of actors who are listed for that film.
select fa.film_id, f.title, count(fa.actor_id)
from film_actor fa
right join film f
on fa.film_id = f.film_id
group by fa.film_id, f.title;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total
from payment p
left join customer c
on p.customer_id = c.customer_id
group by c.customer_id
order by c.last_name;