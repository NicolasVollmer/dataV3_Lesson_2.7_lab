#### Lab | SQL Join (Part I)

# 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name, count(fc.film_id) AS 'number of films'
FROM sakila.category c
INNER JOIN sakila.film_category fc
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY c.name ASC;

# 2. Display the total amount rung up by each staff member in August of 2005.
SELECT s.first_name AS 'staff member', sum(p.amount) AS 'total amount'
FROM sakila.staff s
INNER JOIN sakila.payment p
ON s.staff_id = p.staff_id
GROUP BY s.first_name
ORDER BY s.first_name DESC;

# 3. Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, count(fa.film_id) AS 'appearances' 
FROM sakila.actor a
INNER JOIN sakila.film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY count(fa.film_id) DESC;

# 4. Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name, count(DISTINCT(r.rental_id)) AS 'rentals'
FROM sakila.customer c
JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY c.customer_id ASC;

# 5. Display the first and last names, as well as the address, of each staff member.
SELECT * FROM sakila.staff;
SELECT * FROM sakila.address;

SELECT s.staff_id, s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id
GROUP BY s.staff_id
ORDER BY s.staff_id;

# 6. List each film and the number of actors who are listed for that film.
SELECT f.title, count(fa.actor_id) AS 'featured actors'
FROM sakila.film f
INNER JOIN sakila.film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY f.title ASC;

# 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.last_name, c.first_name, sum(p.amount) AS 'total paid'
FROM sakila.payment p
INNER JOIN sakila.customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name ASC;



