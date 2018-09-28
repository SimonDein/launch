-- Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

  SELECT events.name, COUNT(tickets.id) AS tickets_sold
    FROM events
    JOIN tickets
      ON events.id = tickets.event_id
GROUP BY events.name
ORDER BY tickets_sold DESC;