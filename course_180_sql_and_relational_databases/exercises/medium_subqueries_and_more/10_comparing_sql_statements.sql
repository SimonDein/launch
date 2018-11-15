/*
In this exercise, we'll use EXPLAIN ANALYZE to compare the efficiency of two SQL statements. These two statements are actually from the "Query From a Virtual Table" exercise in this set. In that exercise, we stated that our subquery-based solution:

SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;
was actually faster than the simpler equivalent without subqueries:

SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;
In this exercise, we will demonstrate this fact.

Run EXPLAIN ANALYZE on the two statements above. Compare the planning time, execution time, and the total time required to run these two statements. Also compare the total "costs". Which statement is more efficient and why?
*/

-- SUBQUERY OUTPUT
                                          QUERY PLAN
-----------------------------------------------------------------------------------------------------------------
Aggregate  (cost=37.15..37.16 rows=1 width=8) (actual time=0.038..0.038 rows=1 loops=1)
  ->  HashAggregate  (cost=32.65..34.65 rows=200 width=4) (actual time=0.033..0.035 rows=6 loops=1)
        Group Key: bids.bidder_id
        ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.006..0.012 rows=26 loops=1)
Planning time: 0.096 ms
Execution time: 0.164 ms
(6 rows)

-- NON-SUBQUERY OUTPUT

                                        QUERY PLAN
-----------------------------------------------------------------------------------------------------------------
Limit  (cost=35.65..35.65 rows=1 width=4) (actual time=0.541..0.541 rows=1 loops=1)
  ->  Sort  (cost=35.65..36.15 rows=200 width=4) (actual time=0.541..0.541 rows=1 loops=1)
        Sort Key: (count(bidder_id)) DESC
        Sort Method: top-N heapsort  Memory: 25kB
        ->  HashAggregate  (cost=32.65..34.65 rows=200 width=4) (actual time=0.017..0.018 rows=6 loops=1)
              Group Key: bidder_id
              ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.003..0.004 rows=26 loops=1)
Planning time: 1.621 ms
Execution time: 1.486 ms
(9 rows)


/* --- COMPARISON
Let's start by comparing the top most node estimates of both queries:
  Aggregate  (cost=37.15..37.16 rows=1 width=8) (actual time=0.038..0.038 rows=1 loops=1)
  Limit  (cost=35.65..35.65 rows=1 width=4) (actual time=0.541..0.541 rows=1 loops=1)

The estimated start-up- as well as total cost of both nodes are very close.
However when we look at the actual time it took to run the nodes, we can clearly see that the non-subquery took much
much longer than the subquery.

If we look at the next node of the non-subquery - sort, we'll notice that it isn't present in the query plan of the subquery.
But if we look at the rest of the quries and compare, we'll see that it's almost identical from the HashAggregate node and down.
The sort node in the non-subquery statement is also a costly one. And understanderbly the query ends up being more expensive than the subquery.

The planning and execution time of each of the queries:

Subquery:
  Planning time: 0.096 ms
  Execution time: 0.164 ms
  Cost: 37.16

Non-subquery:
  Planning time: 1.621 ms
  Execution time: 1.486 ms
  Cost: 35.65

From the point of planning and execution time alone the subquery is clearly the fastest option in this case and with the data that's currenly in the tables. However this can look very different on a bigger scale database and the resource cost on the system that has to run the queries also has to be taken into acount. 
*/