/*
Question 1:
Topic: DISTINCT
Task: Create a list of all the different (distinct) replacement costs of the films.
Question: What's the lowest replacement cost?
*/
SELECT DISTINCT replacement_cost 
FROM film
ORDER BY replacement_cost

/*
Question 2:
Topic: CASE + GROUP BY
Task: Write a query that gives an overview of how many films have replacement costs in the following cost ranges
	low: 9.99 - 19.99
	medium: 20.00 - 24.99
	high: 25.00 - 29.99
Question: How many films have a replacement cost in the "low" group?
*/
-- Approach 1
SELECT
CASE 
	WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low'
	WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'medium'
	WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 'high'
END AS replacement_cost_category,
COUNT(*)
FROM film
GROUP BY replacement_cost_category
ORDER BY COUNT(*) DESC

-- Approach 2
SELECT
CASE 
	WHEN replacement_cost <= 19.99 THEN 'low'
	WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'medium'
	WHEN replacement_cost > 24.99 THEN 'high'
END AS replacement_cost_category,
COUNT(*)
FROM film
GROUP BY replacement_cost_category
ORDER BY COUNT(*) DESC

/*
Question 3:
Topic: JOIN
Task: Create a list of the film titles including their title, length, and category name ordered 
descendingly by length. Filter the results to only the movies in the category 'Drama' or 'Sports'.
Question: In which category is the longest film and how long is it?
*/

-- Approach 1
SELECT title, name AS category, length
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE name IN ('Drama', 'Sports')
ORDER BY length DESC

-- Approach 2
SELECT  title, name, length
FROM film f
LEFT JOIN film_category fc ON f.film_id=fc.film_id
LEFT JOIN category c ON c.category_id=fc.category_id
WHERE name = 'Sports' OR name = 'Drama'
ORDER BY length DESC

/*
Question 4:
Topic: JOIN & GROUP BY
Task: Create an overview of how many movies (titles) there are in each category (name).
Question: Which category (name) is the most common among the films?
*/
SELECT name AS category, COUNT(*)
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY category
ORDER BY count DESC

/*
Question 5:
Topic: JOIN & GROUP BY
Task: Create an overview of the actors' first and last names and in how many movies they appear in.
Question: Which actor is part of most movies??
*/

-- Approach 1
SELECT first_name, last_name, COUNT(*) 
FROM actor a
INNER JOIN film_actor f ON a.actor_id = f.actor_id
GROUP BY first_name, last_name
ORDER BY COUNT(*) DESC

-- Approach 2
SELECT first_name, last_name, COUNT(*)
FROM actor a
LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
GROUP BY first_name, last_name
ORDER BY COUNT(*) DESC

/*
Question 6:
Topic: LEFT JOIN & FILTERING
Task: Create an overview of the addresses that are not associated to any customer.
Question: How many such addresses are there?
*/
SELECT * FROM address a
LEFT JOIN customer c
ON c.address_id = a.address_id
WHERE customer_id IS NULL

/*
Question 7:
Topic: JOIN & GROUP BY
Task: Create an overview of the sales to determine from which city (we are interested 
in the city in which the customer lives, not where the store is) the most sales occur.
Question: What city is that and how much is the amount?
*/

-- Approach 1
SELECT city, SUM(amount) AS sales 
FROM city ci
INNER JOIN address a ON ci.city_id = a.city_id
INNER JOIN customer cu ON a.address_id = cu.address_id
INNER JOIN payment p ON cu.customer_id = p.customer_id
GROUP BY city
ORDER BY sales DESC

-- Approach 2
SELECT city, SUM(amount)
FROM payment p 
LEFT JOIN customer c ON p.customer_id = c.customer_id
LEFT JOIN address a ON a.address_id = c.address_id
LEFT JOIN city ci ON ci.city_id = a.city_id
GROUP BY city
ORDER BY SUM(amount) DESC

/*
Question 8:
Topic: JOIN & GROUP BY
Task: Create an overview of the revenue (sum of amount) grouped by a column in the format "country, city".
Question: Which country, city has the least sales?
*/

-- Approach 1
SELECT 
	country || ', ' || city AS "country, city", 
	SUM(amount) AS sales
FROM country co
INNER JOIN city ci ON co.country_id = ci.country_id
INNER JOIN address a ON ci.city_id = a.city_id
INNER JOIN customer cu ON a.address_id = cu.address_id
INNER JOIN payment p ON cu.customer_id = p.customer_id
GROUP BY "country, city"
ORDER BY sales 

-- Approach 2
SELECT 
	country ||', ' ||city,
	SUM(amount)
FROM payment p 
LEFT JOIN customer c ON p.customer_id=c.customer_id
LEFT JOIN address a ON a.address_id=c.address_id
LEFT JOIN city ci ON ci.city_id=a.city_id
LEFT JOIN country co ON co.country_id=ci.country_id
GROUP BY country ||', ' ||city
ORDER BY 2 ASC

/*
Question 9:
Topic: Uncorrelated subquery
Task: Create a list with the average of the sales amount each staff_id has per customer.
Question: Which staff_id makes on average more revenue per customer?
*/

-- Approach 1
SELECT
staff_id,
CASE 
	WHEN staff_id = 1 THEN ROUND(AVG(total_amount), 2) 
	WHEN staff_id = 2 THEN ROUND(AVG(total_amount), 2)
END avg_sales
FROM 
	(SELECT customer_id, staff_id, SUM(amount) AS total_amount 
	FROM payment 
	GROUP BY customer_id, staff_id)
GROUP BY staff_id

-- Approach 2
SELECT staff_id, ROUND(AVG(total),2) as avg_amount 
FROM 
	(SELECT SUM(amount) as total, customer_id, staff_id
	FROM payment
	GROUP BY customer_id, staff_id) a 
GROUP BY staff_id

/*
Question 10:
Topic: EXTRACT + Uncorrelated subquery
Task: Create a query that shows average daily revenue of all Sundays.
Question: What is the daily average revenue of all Sundays?
*/
SELECT 
AVG(total)
FROM 
	(SELECT
	 SUM(amount) as total,
	 DATE(payment_date),
	 EXTRACT(dow from payment_date) as weekday
	 FROM payment
	 WHERE EXTRACT(dow from payment_date) = 0
	 GROUP BY DATE(payment_date),weekday) daily

/*
Question 11:
Topic: Correlated subquery
Task: Create a list of movies - with their length and their replacement cost - that 
are longer than the average length in each replacement cost group.
Question: Which two movies are the shortest on that list and how long are they?
*/
SELECT title, length, replacement_cost
FROM film f1
WHERE length > (SELECT 
				ROUND(AVG(length), 2) AS avg_length
				FROM film f2
				WHERE f1.replacement_cost = f2.replacement_cost)
ORDER BY length

/*
Question 12:
Topic: Uncorrelated subquery
Task: Create a list that shows the "average customer lifetime value" grouped by the different districts.

Example:
If there are two customers in "District 1" where one customer has a total (lifetime) spent of $1000 
and the second customer has a total spent of $2000 then the "average customer lifetime spent" in this district is $1500.
So, first, you need to calculate the total per customer and then the average of these totals per district.

Question: Which district has the highest average customer lifetime value?
*/

-- Approach 1
SELECT 
district, 
ROUND(AVG(total_amount), 2) AS avg_customer_lifetime_value
FROM	(SELECT c.customer_id, c.address_id, SUM(amount) AS total_amount 
		FROM customer c
		INNER JOIN payment p ON c.customer_id = p.customer_id
		GROUP BY c.customer_id, c.address_id) b  
INNER JOIN address a ON b.address_id = a.address_id
GROUP BY district
ORDER BY avg_customer_lifetime_value DESC

--Approach 2
SELECT
district,
ROUND(AVG(total),2) avg_customer_spent
FROM
	(SELECT c.customer_id, district, SUM(amount) total
	FROM payment p
	INNER JOIN customer c ON c.customer_id = p.customer_id
	INNER JOIN address a ON c.address_id = a.address_id
	GROUP BY district, c.customer_id) sub
GROUP BY district
ORDER BY 2 DESC

/*
Question 13:
Topic: Correlated query

Task: Create a list that shows all payments including the payment_id, amount, and the 
film category (name) plus the total amount that was made in this category. Order the 
results ascendingly by the category (name) and as second order criterion by the payment_id ascendingly.

Question: What is the total revenue of the category 'Action' and what is the lowest payment_id in that category 'Action'?
*/

-- Joining payment ids with their corresponding category names and amount 
SELECT payment_id, name, amount
FROM 
	(SELECT film_id, c.category_id, name 
	FROM film_category fc 
	INNER JOIN category c 
	ON fc.category_id = c.category_id) a
INNER JOIN inventory i ON a.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN payment p ON r.rental_id = p.rental_id

-- List of total amount by category 
SELECT a.category_id, name, SUM(amount) AS total_amount
FROM 
	(SELECT film_id, c.category_id, name 
	FROM film_category fc 
	INNER JOIN category c 
	ON fc.category_id = c.category_id) a
INNER JOIN inventory i ON a.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY a.category_id, name
ORDER BY name

-- Final query
-- Approach 1
SELECT payment_id, t1.name AS genre, amount, total_amount 
FROM 
	(SELECT a.category_id, payment_id, a.name, amount
	FROM 
		(SELECT film_id, c.category_id, name 
		FROM film_category fc 
		INNER JOIN category c 
		ON fc.category_id = c.category_id) a
	INNER JOIN inventory i ON a.film_id = i.film_id
	INNER JOIN rental r ON i.inventory_id = r.inventory_id
	INNER JOIN payment p ON r.rental_id = p.rental_id) t1
LEFT JOIN 
	(SELECT a.category_id, a.name, SUM(amount) AS total_amount
	FROM 
		(SELECT film_id, c.category_id, name 
		FROM film_category fc 
		INNER JOIN category c 
		ON fc.category_id = c.category_id) a
	INNER JOIN inventory i ON a.film_id = i.film_id
	INNER JOIN rental r ON i.inventory_id = r.inventory_id
	INNER JOIN payment p ON r.rental_id = p.rental_id
	GROUP BY a.category_id, name
	ORDER BY name) t2
ON t1.category_id = t2.category_id
ORDER BY genre, payment_id

-- Approach 2
SELECT title, amount, name, payment_id,
	(SELECT SUM(amount) FROM payment p
	LEFT JOIN rental r ON r.rental_id = p.rental_id
	LEFT JOIN inventory i ON i.inventory_id = r.inventory_id
	LEFT JOIN film f ON f.film_id = i.film_id
	LEFT JOIN film_category fc ON fc.film_id = f.film_id
	LEFT JOIN category c1 ON c1.category_id = fc.category_id
	WHERE c1.name = c.name)
FROM payment p
LEFT JOIN rental r ON r.rental_id = p.rental_id
LEFT JOIN inventory i ON i.inventory_id = r.inventory_id
LEFT JOIN film f ON f.film_id = i.film_id
LEFT JOIN film_category fc ON fc.film_id = f.film_id
LEFT JOIN category c ON c.category_id = fc.category_id
ORDER BY name


/*
Question 14:
Topic: Correlated and uncorrelated subqueries (nested)
Task: Create a list with the top overall revenue of a film title (sum of amount per title) for each category (name).
Question: Which is the top-performing film in the animation category?
*/

-- Total revenue by film title
SELECT f.film_id, title, SUM(amount) AS revenue
FROM film f 
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.film_id, title

-- Revenue by film_id and category_id
SELECT a.film_id, a.category_id, name, SUM(amount) AS total_amount
FROM 
	(SELECT film_id, c.category_id, name 
	FROM film_category fc 
	INNER JOIN category c 
	ON fc.category_id = c.category_id) a
INNER JOIN inventory i ON a.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY a.film_id, a.category_id, name
ORDER BY a.category_id

-- Max revenue in each genre by film 
SELECT film_id, category_id, name AS genre, MAX(total_amount) AS max_revenue 
FROM (SELECT a.film_id, a.category_id, name, SUM(amount) AS total_amount
FROM 
	(SELECT film_id, c.category_id, name 
	FROM film_category fc 
	INNER JOIN category c 
	ON fc.category_id = c.category_id) a
INNER JOIN inventory i ON a.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY a.film_id, a.category_id, name
ORDER BY a.category_id)
GROUP BY film_id, category_id, genre

-- Final query
-- Approach 1
SELECT t1.film_id, title, name, revenue
FROM 
	(SELECT f.film_id, title, SUM(amount) AS revenue
	FROM film f 
	INNER JOIN inventory i ON f.film_id = i.film_id
	INNER JOIN rental r ON i.inventory_id = r.inventory_id
	INNER JOIN payment p ON r.rental_id = p.rental_id
	GROUP BY f.film_id, title) t1
INNER JOIN 
	(SELECT film_id, category_id, name, MAX(total_amount) 
	FROM (SELECT a.film_id, a.category_id, name, SUM(amount) AS total_amount
			FROM 
				(SELECT film_id, c.category_id, name 
				FROM film_category fc 
				INNER JOIN category c 
				ON fc.category_id = c.category_id) a
				INNER JOIN inventory i ON a.film_id = i.film_id
				INNER JOIN rental r ON i.inventory_id = r.inventory_id
				INNER JOIN payment p ON r.rental_id = p.rental_id
				GROUP BY a.film_id, a.category_id, name
				ORDER BY a.category_id)
		GROUP BY film_id, category_id, name) t2
ON t1.film_id = t2.film_id
WHERE name = 'Animation'
ORDER BY revenue DESC

-- Approach 2
SELECT title, name, SUM(amount) as total
FROM payment p
LEFT JOIN rental r ON r.rental_id = p.rental_id
LEFT JOIN inventory i ON i.inventory_id = r.inventory_id
LEFT JOIN film f ON f.film_id = i.film_id
LEFT JOIN film_category fc ON fc.film_id = f.film_id
LEFT JOIN category c ON c.category_id = fc.category_id
GROUP BY name,title
HAVING SUM(amount) = (SELECT MAX(total) 
						FROM 
							(SELECT title, name, SUM(amount) as total
			          		FROM payment p LEFT JOIN rental r ON r.rental_id = p.rental_id
			          		LEFT JOIN inventory i ON i.inventory_id = r.inventory_id
				  			LEFT JOIN film f ON f.film_id = i.film_id
				  			LEFT JOIN film_category fc ON fc.film_id = f.film_id
				  			LEFT JOIN category c1 ON c1.category_id = fc.category_id
				  			GROUP BY name,title) sub
			   			WHERE c.name=sub.name)