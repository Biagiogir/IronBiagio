-- Lab | SQL Queries - Join Two Tables
use sakila;
#1 Which actor has appeared in the most films?
select a.actor_id, a.first_name, a.last_name, count(a.actor_id)
from actor as a
inner join film_actor as f
on a.actor_id = f.actor_id
group by a.actor_id
order by count(a.actor_id) DESC
limit 1;

#2 Most active customer (the customer that has rented the most number of films)
-- one customer can rent many films but one film can be rented by only one customer
select customer.customer_ID, customer.first_name, customer.last_name, count(rental.rental_ID)
from customer 
inner join rental 
on customer.customer_ID = rental.customer_ID
group by customer_ID
order by count(rental.rental_ID) DESC
limit 1;

# 3 List number of films per category. (How can I take away the first column a.category_ID?)
select a.category_ID, a.name, count(b.film_ID) as "Number of films" from category as a
inner join film_category  as b
on a.category_ID = b.category_ID
group by category_ID
order by count(b.film_ID) DESC;

# 4 Display the first and last names, as well as the address, of each staff member.
select a.first_name, a.last_name, b.address from staff as a
inner join address as b
on a.address_ID = b.address_ID

# 5 Display the total amount rung up by each staff member in August of 2005.
select a.staff_ID, a.first_name, a.last_name, sum(b.amount) as "Total Amount August 2005"
from staff as a
inner join payment as b
on a.staff_ID = b.staff_ID
where b.payment_date like "2005-08%"
group by staff_ID

# 6 List each film and the number of actors who are listed for that film.
select a.film_ID, a.title, count(b.actor_ID) from film as a
inner join film_actor as b
on a.film_ID = b.film_ID
group by film_ID
order by count(b.actor_ID) DESC;

# 7 Using the tables payment and customer and the JOIN command,
# list the total paid by each customer. 
#List the customers alphabetically by last name. 

select a.last_name, a.first_name, sum(b.amount), a.customer_ID from customer as a
inner join payment as b
on a.customer_ID = b.customer_ID
group by a.customer_ID
order by a.last_name 
-- how to reuse the info of a selct later on?

#Bonus: Which is the most rented film? The answer is Bucket Brotherhood 
#This query might require using more than one join statement. Give it a try.

select a.film_ID, a.title, count(c.inventory_ID) from film as a
inner join inventory as b
on a.film_ID = b.film_ID
inner join rental as c
on b.inventory_ID = c.inventory_ID
group by a.film_ID
order by count(c.inventory_ID) DESC
limit 1

