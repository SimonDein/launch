/*
This exercise will be a bit longer than the previous ones, but the logical operators we'll cover are all closely related.

Write an SQL query that returns the names of all items that have bids of less than 100 dollars. To accomplish this, use an ANY clause, along with a subquery.
*/
SELECT name AS "Bids Less Than 100 Dollars"
  FROM items
 WHERE 100.00 > ANY (SELECT bids.amount FROM bids WHERE bids.item_id = items.id);


-- Finally, write the same query that you used to get the result above, but replace your ANY clause with an ALL clause. You shouldn't have to use any JOINs to finish this exercise.

SELECT name AS "Bids Less Than 100 Dollars"
  FROM items
 WHERE 100.00 > ALL (SELECT bids.amount FROM bids WHERE bids.item_id = items.id);

/* NOTE

In this example ANY returns three items where ALL returns 4.
This spotligthts one of the big differences between ALL and ANY -
ANY returns false if no rows where returned in the subquery where -
ALL will return true even if no rows where returned and so an item with no bids
on it will also be seen an item with with no bids under 100 dollars and ANY will not.
*/
