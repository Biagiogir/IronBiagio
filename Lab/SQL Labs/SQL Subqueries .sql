# Lab | SQL Subqueries
use sakila;
#1 How many copies of the film Hunchback Impossible exist in the inventory system?
select count(film_id) as "count of copies Hunchback Impossible"
from inventory
where film_id = (select film_id from film where title = "Hunchback Impossible");
#2 List all films whose length is longer than the average of all the films.
select title, film_id, length from film
where length > (select avg(length) from film)

#3 Use subqueries to display all actors who appear in the film Alone Trip.
select actor_id, first_name, last_name from actor
where actor_id in (select actor_id from film_actor
where film_id = (select film_id from film where
title = "Alone Trip"))

#4 Sales have been lagging among young families, and you wish to target all family movies
# for a promotion.
# Identify all movies categorized as family films.
select title as "Family movies" from film
where film_id in (select film_id from film_category
where category_id = ( select category_id from category
where name = "Family"))
#5 Get name and email from customers from Canada using subqueries. Do the same with joins.
# Note that to create a join, you will have to identify the correct tables 
#with their primary keys and foreign keys, that will help you get the relevant information.
select first_name, last_name, email from customer
where address_id in (select address_id from address
where city_id in (select city_id from city
where country_id = (select country_id from country
where country = "Canada")))

select first_name, last_name, email from customer as a
inner join address as b
on a.address_id = b.address_id
inner join city as c
on b.city_id = c.city_id
inner join country as d
on c.country_id = d.country_id
where country = "Canada";

#6 Which are films starred by the most prolific actor? 
#Most prolific actor is defined as the actor that has acted in the most number of films. 
#First you will have to find the most prolific actor and then use that actor_id to find 
#the different films that he/she starred.
select title from film
where film_id IN (select film_id from film_actor
where actor_id = (select actor_id from 
(select actor_id, count(actor_id) as count_movies from film_actor
group by actor_id
order by count_movies DESC
limit 1) as SUB_TABLE));

# 7 Films rented by most profitable customer. You can use the customer table and 
#payment table to find the most profitable customer ie the customer that has made 
#the largest sum of payments
select title from film 
	where film_id in (select film_id from inventory
		where inventory_id in (select inventory_id from rental
			where customer_id = 
				(select customer_id from
					(select customer_id, sum(amount) as total_profit from payment
					group by customer_id
					order by 2 DESC
					limit 1) a )));

# 8 Customers who spent more than the average payments.
select first_name, last_name
from customer
where customer_id in
(select customer_id from
(select customer_id, avg(amount) as avg_p_c from payment
group by 1) a
where avg_p_c > (select avg(amount) as overall_avg from payment));



select first_name, last_name
from customer
where customer_id in
( select customer_id from
(select customer_id, sum(amount) as sum_p_c from payment
group by 1
having sum_p_c > (select sum(amount)/count(distinct customer_id) from payment)) b);
    
##select avg(amount) from payment
        