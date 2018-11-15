/*
For this exercise, let's explore the EXPLAIN PostgreSQL statement. It's a very useful SQL statement that lets us analyze the efficiency of our SQL statements.
More specifically, use EXPLAIN to check the efficiency of the query statement we used in the exercise on EXISTS:

SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
First use just EXPLAIN, then include the ANALYZE option as well.
For your answer, list any SQL statements you used, along with the output you get back, and your thoughts on what is happening in both cases.
*/


EXPLAIN SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
                                QUERY PLAN                                
--------------------------------------------------------------------------
 Hash Join  (cost=33.38..66.47 rows=635 width=32)
   Hash Cond: (bidders.id = bids.bidder_id)
   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4)
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4)
               Group Key: bids.bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4)
(7 rows)

/* ------- EXPLAIN Analysis
The explain statement outputs the query plan for running the passed query as well as the estimated cost of each "node" that is part of that plan.
In this example the query plan is made up of five nodes:

 Hash Join
   ->  Seq Scan on bidders
   ->  Hash (cond: bidders.id = bids.bidder_id)
         ->  HashAggregate(group key: bids.bidder_id)
               ->  Seq Scan on bids

- Each node i.e. step - has an estimated cost:
   Hash Join  (cost=33.38..66.47 rows=635 width=32)
- The first number after cost= is the start up cost and the second is the total cost.
- The width is the estimated average of bytes taken up by the rows in the sql statement we're explaining.
- Rows is the estimated number of rows the operation is expected to be run on.
- Each indented note is the child note of the parent. That means the execution of the child note has to finish for the parent to be run.

Once each step has been completed - the query is finished and returns a result.
*/

EXPLAIN ANALYZE SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

Hash Join  (cost=33.38..66.47 rows=635 width=32) (actual time=0.046..0.049 rows=6 loops=1)
   Hash Cond: (bidders.id = bids.bidder_id)
   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.008..0.009 rows=7 loops=1)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4) (actual time=0.025..0.025 rows=6 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4) (actual time=0.019..0.020 rows=6 loops=1)
               Group Key: bids.bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.005..0.008 rows=26 loops=1)
 Planning time: 0.154 ms
 Execution time: 0.091 ms
(10 rows)

/*
---------- EXPLAIN ANALYZE analysis
If we pass the statement above to the ANALYZE KEYWORD, the query is executed and we can analyze the query in a more tangible units - time.
The nodes are the same but an addition has been made to the output. After each estimate, the actual time it took to run the note is also printed.
The acual rows the operation was run on is also printed.
*/