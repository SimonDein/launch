-- Write a query to retrieve the customer data for every customer who does not currently subscribe to any services.

SELECT DISTINCT customers.*
           FROM customers
                LEFT OUTER JOIN customers_services
                ON customers.id = customers_services.customer_id
                WHERE customers_services.customer_id IS NULL;
