-- Write a query that returns the user id, email address, and number of events for all customers that have purchased tickets to three events.

  SELECT c.id, c.email, COUNT(DISTINCT(t.event_id)) AS events_purchased_tickets_for
    FROM customers AS c
    JOIN tickets AS t
      ON c.id = t.customer_id
GROUP BY c.id
  HAVING COUNT(DISTINCT t.event_id) = 3;