--1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name
FROM customer 
JOIN address 
ON customer.address_id = address.address_id
WHERE district = 'Texas';





--2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT payment.customer_id
    FROM payment
    GROUP BY payment.customer_id, payment.amount 
    HAVING amount > 6.99
);




--3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);


--4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name
FROM customer 
JOIN address 
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id 
JOIN country 
ON city.country_id = country.country_id 
WHERE country = 'Nepal'


--5. Which staff member had the most transactions?
SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id 
ORDER BY count DESC
LIMIT 1;


--6. How many movies of each rating ARE there?
SELECT rating
FROM film
ORDER BY rating;






--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT payment.customer_id
    FROM payment
    GROUP BY payment.customer_id, payment.amount 
    HAVING  count(payment_id) = 1 AND amount > 6.99
);


--8. How many free rentals did our stores give away?
SELECT count(*)
FROM payment
WHERE amount = 0;






