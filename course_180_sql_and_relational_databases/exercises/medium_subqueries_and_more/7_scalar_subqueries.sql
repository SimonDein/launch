/*
For this exercise, use a scalar subquery to determine the number of bids on each item.
The entire query should return a table that has the name of each item along with the number of bids on an item.
*/

SELECT items.name, 
       (SELECT COUNT(bids.id) FROM bids WHERE items.id = bids.item_id)
       FROM items;

/* Further Exploration
If we wanted to get an equivalent result, without using a subquery, then we would have to use a LEFT OUTER JOIN. Can you come up with the equivalent query that uses a JOIN clause?
*/
  SELECT items.name, COUNT(bids.id)
    FROM items
         LEFT OUTER JOIN bids
         ON items.id = bids.item_id
GROUP BY items.id;
