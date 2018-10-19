-- A new customer, 'John Doe', has signed up with our company. His payment token is `EYODHLCN'. Initially, he has signed up for UNIX hosting, DNS, and Whois Registration. Create any SQL statement(s) needed to add this record to the database.

INSERT INTO customers (name, payment_token)
VALUES
('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id)
VALUES
((SELECT id FROM customers WHERE name = 'John Doe'), (SELECT id FROM services WHERE description = 'UNIX hosting')),
((SELECT id FROM customers WHERE name = 'John Doe'), (SELECT id FROM services WHERE description = 'DNS')),
((SELECT id FROM customers WHERE name = 'John Doe'), (SELECT id FROM services WHERE description = 'Whois Registration'));