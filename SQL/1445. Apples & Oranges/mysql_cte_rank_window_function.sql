

WITH cte AS (SELECT sale_date, fruit, sold_num, 
                    RANK() OVER(PARTITION BY fruit
                                ORDER BY sale_date) AS ranking
             FROM Sales)

SELECT t1.sale_date, (t1.sold_num - t2.sold_num) AS diff
FROM cte t1, cte t2
WHERE t1.fruit = 'apples' AND t2.fruit = 'oranges' AND t1.ranking = t2.ranking
ORDER BY 1;


