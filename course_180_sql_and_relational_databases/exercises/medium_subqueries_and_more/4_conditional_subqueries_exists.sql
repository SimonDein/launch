-- Write a SELECT query that returns a list of names of everyone who has bid in the auction. While it is possible (and perhaps easier) to do this with a JOIN clause, we're going to do things differently: use a subquery with the EXISTS clause instead. Here is the expected output:
SELECT name
  FROM bidders
 WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);


/*
Further Exploration
More often than not, we can get an equivalent result by using a JOIN clause, instead of a subquery. Can you figure out a SELECT query that uses a JOIN clause that returns the same output as our solution above?
*/
SELECT DISTINCT name
  FROM bidders
       JOIN bids
       ON bidders.id = bids.bidder_id;