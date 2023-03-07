SELECT p.product_id, p.product_title, COUNT(*) AS review_count 
FROM review_id_table r 
JOIN products p ON r.product_id = p.product_id 
GROUP BY p.product_id, p.product_title 
ORDER BY review_count DESC 
LIMIT 10;

SELECT products.product_title, COUNT(*) AS review_count 
FROM review_id_table 
JOIN products ON review_id_table.product_id = products.product_id 
GROUP BY products.product_title 
ORDER BY review_count DESC;

SELECT r.product_id, AVG(v.star_rating) AS avg_rating 
FROM review_id_table r 
JOIN vine_table v ON r.review_id = v.review_id 
GROUP BY r.product_id 
ORDER BY avg_rating DESC 
LIMIT 10;

SELECT review_id_table.product_id, 
    AVG(helpful_votes) AS avg_helpful_votes, 
    AVG(total_votes) AS avg_total_votes 
FROM review_id_table 
JOIN vine_table ON review_id_table.review_id = vine_table.review_id 
GROUP BY review_id_table.product_id;

SELECT r.product_id, p.product_title,
    COUNT(*) FILTER (WHERE v.star_rating = 5) * 100.0 / COUNT(*) AS pct_5_star 
FROM review_id_table r
JOIN vine_table v ON r.review_id = v.review_id
JOIN products p ON r.product_id = p.product_id
GROUP BY r.product_id, p.product_title
ORDER BY pct_5_star DESC 
LIMIT 3;

SELECT review_id_table.customer_id, 
    COUNT(DISTINCT review_id_table.product_id) AS reviewed_products 
FROM review_id_table 
GROUP BY review_id_table.customer_id 
ORDER BY reviewed_products DESC 
LIMIT 5;

SELECT COUNT(*) / COUNT(DISTINCT customer_id) AS avg_reviews_per_customer 
FROM review_id_table;





