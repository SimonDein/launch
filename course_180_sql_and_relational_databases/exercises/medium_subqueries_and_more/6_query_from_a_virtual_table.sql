/*
For this exercise, we'll make a slight departure from how we've been using subqueries. We have so far used subqueries to filter our results using a WHERE clause. In this exercise, we will build that filtering into the table that we will query. Write an SQL query that finds the largest number of bids from an individual bidder.

For this exercise, you must use a subquery to generate a result table (or virtual table), and then query that table for the largest number of bids.

Your output should look like this:

  max
------
    9
(1 row)
*/

SELECT max(bids_per_bidder.count) FROM
(SELECT count(bids.id) FROM bids GROUP BY bids.bidder_id) AS bids_per_bidder;

/* Psuedo
In the sub-query we select the amount of bids that has been placed by each bidder by grouping them by bids.bidder_id.
Then we select the max (highest number) from the coolumn "count" virtual table "bids_per_bidder", both of which was made in the sub-qeury.

Note that the column name is "virtual" and is the column name returned by the COUNT aggregate function.
And the table name is created by the alias.
*/