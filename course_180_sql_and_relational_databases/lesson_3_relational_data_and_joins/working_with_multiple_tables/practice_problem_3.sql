-- Write a query that determines what percentage of the customers in the database have purchased a ticket to one or more of the events.

         SELECT COUNT(DISTINCT(tickets.customer_id)) / COUNT(DISTINCT(customers.id))::float * 100
             AS "percentage"
           FROM customers
LEFT OUTER JOIN tickets
             ON customers.id = tickets.customer_id;