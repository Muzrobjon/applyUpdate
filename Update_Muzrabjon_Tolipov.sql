UPDATE film
SET rental_duration = 21,
    rental_rate = 9.99
WHERE film_id = 1;

- - - - - - 

-- Find a customer with at least 10 rental and 10 payment records.
SELECT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(*) >= 10
AND (SELECT COUNT(*) FROM payment WHERE customer_id = customer.customer_id) >= 10
LIMIT 1;

-- Update the customer's personal data.
UPDATE customer
SET first_name = 'Muzrabjon',
    last_name = 'Tolipov',
    address_id = (SELECT address_id FROM address LIMIT 1)
WHERE customer_id = (SELECT customer_id FROM customer WHERE customer.customer_id >= 10 AND (SELECT COUNT(*) FROM payment WHERE customer_id = customer.customer_id) >= 10 LIMIT 1);

- - - - - - 

UPDATE customer
SET create_date = CURRENT_DATE
WHERE customer_id = (SELECT customer_id FROM customer WHERE customer.customer_id >= 10 AND (SELECT COUNT(*) FROM payment WHERE customer_id = customer.customer_id) >= 10 LIMIT 1);