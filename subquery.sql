-- subqueries
-- find the average payment in the payments table and return every payment thats above average
SELECT avg (amount)
FROM payment;

-- now find every payment above avg
SELECT *
FROM payment 
WHERE amount > 4.2006;

-- do this with a subquery

SELECT *
FROM payment 
WHERE amount > (
	SELECT avg (amount)
	FROM payment
);

-- find a customers info who has a total payment above 175
SELECT customer_id
FROM payment 
GROUP BY customer_id
HAVING sum(amount) > 175;

SELECT customer_id, irst_name, last_night
FROM payment 
JOIN customer 
ON customer.customer_id = payment.customer_id 
GROUP BY customer_id, first_name, last_night
HAVING sum(amount) > 175;


-- write a subquery to find all of the films that have a language of english

SELECT language_id
FROM "language" 
WHERE name='English';

SELECT *
FROM film
WHERE language_id IN (
	SELECT language_id
	FROM "language" 
	WHERE name='English'
);


-- find the last name of every custom that got served by "mike" and rented at least 2 movie with penelope guiness




