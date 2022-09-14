-- Find the first and last name of every customer who's made a payment of $7.99 
SELECT first_name, last_name
FROM customer 
JOIN payment 
ON customer.customer_id = payment.customer_id
WHERE amount = 7.99





-- Get the name of every film that store_id 1 has in stock (use the inventory table)
SELECT title, description
FROM film 
JOIN inventory  
ON inventory.film_id = film.film_id 
WHERE store_id = 1;




-- Part of your job is thinking about data. Take a look at the ERD for the DVD Rental Database and come up with one question that you think could be solved with joins.

-- find the last name of every custom that got served by "mike" and rented at least 2 movie with penelope guiness

-- Find the first and last name of every customer who's made a payment of $7.99 
SELECT first_name, last_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id 
WHERE amount = 7.99;

-- Get the name of every film that store_id 1 has in stock (use the inventory table)
SELECT title, description
FROM film
JOIN inventory
ON inventory.film_id = film.film_id 
WHERE store_id = 1;

-- What was the most rented film category in the UK?

-- Find all of the customers located in the UK.
SELECT customer.customer_id, first_name, last_name, country_id, rental_id, inventory.film_id, category.category_id, category.name
FROM customer
JOIN address
ON address.address_id = customer.address_id 
JOIN city
ON address.city_id = city.city_id
JOIN rental
ON rental.customer_id = customer.customer_id 
JOIN inventory
ON rental.inventory_id = inventory.inventory_id 
JOIN film_category
ON inventory.film_id = film_category.film_id 
JOIN category
ON film_category.category_id = category.category_id
WHERE country_id = 102;

SELECT category.category_id, category.name, COUNT(category.category_id)
FROM customer
JOIN address
ON address.address_id = customer.address_id 
JOIN city
ON address.city_id = city.city_id
JOIN rental
ON rental.customer_id = customer.customer_id 
JOIN inventory
ON rental.inventory_id = inventory.inventory_id 
JOIN film_category
ON inventory.film_id = film_category.film_id 
JOIN category
ON film_category.category_id = category.category_id
WHERE country_id = 102
GROUP BY category.category_id, category.name
ORDER BY count DESC
LIMIT 1;

-- Find the last name of every customer that got served by mike and rented atleast two movies with Penelope Guiness

-- ALL OF THE FILMS IN INVENTORY THAT HAVE PENELOPE GUINESS
SELECT film_actor.film_id, inventory.inventory_id
FROM film_actor
JOIN inventory
ON film_actor.film_id = inventory.film_id
WHERE actor_id = 1;

-- FIND ALL OF THE RENTALS MADE FOR FILMS IN INVENTORY WITH PENELOPE GUINESS
SELECT film_actor.film_id, inventory.inventory_id, rental.customer_id 
FROM film_actor
JOIN inventory
ON film_actor.film_id = inventory.film_id
JOIN rental
ON rental.inventory_id = inventory.inventory_id 
WHERE actor_id = 1;

-- FIND THE CUSTOMER'S LAST NAME
SELECT film_actor.film_id, inventory.inventory_id, rental.customer_id, customer.last_name
FROM film_actor
JOIN inventory
ON film_actor.film_id = inventory.film_id
JOIN rental
ON rental.inventory_id = inventory.inventory_id 
JOIN customer
ON customer.customer_id = rental.customer_id 
WHERE actor_id = 1;

-- COUNT ALL OF THE TIMES EACH UNIQUE CUSTOMER ID SHOWS UP
SELECT rental.customer_id, customer.last_name, COUNT(rental.customer_id) AS rental_count
FROM film_actor
JOIN inventory
ON film_actor.film_id = inventory.film_id
JOIN rental
ON rental.inventory_id = inventory.inventory_id 
JOIN customer
ON customer.customer_id = rental.customer_id 
WHERE actor_id = 1
GROUP BY rental.customer_id, customer.last_name
HAVING COUNT(rental.customer_id) >= 2
ORDER BY rental_count DESC;