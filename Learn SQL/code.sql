1. SELECT *
FROM survey
LIMIT 10;

2. SELECT question, COUNT(*)
FROM survey
GROUP BY 1;

4. SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

5. WITH funnels AS (
  SELECT q.user_id,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
  FROM quiz q
  LEFT JOIN home_try_on h
    ON q.user_id = h.user_id
  LEFT JOIN purchase p
    ON p.user_id = q.user_id)
SELECT *
FROM funnels
LIMIT 10;

6. WITH funnels AS (
  SELECT q.user_id,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
  FROM quiz q
  LEFT JOIN home_try_on h
    ON q.user_id = h.user_id
  LEFT JOIN purchase p
    ON p.user_id = q.user_id)
SELECT 1.0*COUNT(number_of_pairs)/COUNT(*) AS 'quiz_to_home',
  1.0*SUM(is_purchase)/COUNT(number_of_pairs) AS 'home_to_purchase',
  1.0*SUM(is_purchase)/COUNT(*) AS 'quiz_to_purchase'
FROM funnels;

WITH funnels AS (
  SELECT q.user_id,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
  FROM quiz q
  LEFT JOIN home_try_on h
    ON q.user_id = h.user_id
  LEFT JOIN purchase p
    ON p.user_id = q.user_id)
SELECT COUNT(*) AS 'took_quiz',
	COUNT(number_of_pairs) AS 'tried_at_home',
  SUM(is_purchase) AS 'purchased'
FROM funnels;

WITH funnels AS (
  SELECT q.user_id,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
  FROM quiz q
  LEFT JOIN home_try_on h
    ON q.user_id = h.user_id
  LEFT JOIN purchase p
    ON p.user_id = q.user_id)
  SELECT number_of_pairs, SUM(is_purchase) AS 'purchased',SUM(is_home_try_on) AS 'tried_on'
  FROM funnels
  GROUP by number_of_pairs;

SELECT COUNT(*), style
FROM quiz
GROUP BY 2;

SELECT COUNT(*), style, fit, shape, color
FROM quiz
GROUP BY 2,3,4,5
ORDER BY 1 desc;


SELECT COUNT(*), model_name
FROM purchase
GROUP BY 2
ORDER BY 1 desc;

SELECT COUNT(*), product_id, style, model_name, color, price
FROM purchase
GROUP BY 2,3,4,5,6
ORDER BY 1 desc;

SELECT COUNT(*), style, model_name
FROM purchase
GROUP BY 2,3
ORDER BY 1 desc;

7. SELECT COUNT(*), color, style
FROM quiz
GROUP BY 2, 3
ORDER BY 3,1 desc;

SELECT COUNT(user_id), product_id, style, model_name, color, price
FROM purchase
GROUP BY product_id;




