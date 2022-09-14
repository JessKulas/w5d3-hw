INSERT INTO product (title, description, price)
VALUES 
	('shoes', 'really neat shoes', 99.99);


INSERT INTO seller (name, address, contact_number)
VALUES 
	('Cool Hat Store', '123 Park St', '1231231234'),
	('Funny Shirt Store', '124 Park St', '319023321');

INSERT INTO inventory (product_id, seller_id, stock_qty)
VALUES
	(2, 1, 25),
	(1, 2, 13),
	(2, 2, 3);
	
SELECT *
FROM product 
LEFT JOIN inventory
ON inventory.product_id = product.product_id;

SELECT *
FROM product 
inner JOIN inventory
ON inventory.product_id = product.product_id;

-- find all of the carts for our customers, if they dont have a cart, still display their name

SELECT *
FROM cart 
JOIN customer 
ON cart.customer_id = customer.customer_id;

-- find the product info for every item in cart_item table
SELECT *
FROM cart_item
INNER JOIN product 
ON product.product_id = cart_item.product_id;

-- find the product and seller information for each item in inventory
SELECT *
FROM product p  
JOIN inventory  
ON inventory.product_id = product.product_id
JOIN seller s ON inventory.seller_is = seller.seller_id;

-- find the first and last names of all customers who have product in their cart
SELECT first_name, last_name
FROM cart_item 
JOIN cart 
ON cart.cart_id = cart_item.cart_id 
JOIN customer_id 
ON customer.customer_id = cart.customer_id WHERE product_id = 1;

















