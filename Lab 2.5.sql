-- LAB 2.5
USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’. (2 actors)
SELECT *
FROM actor
WHERE first_name = 'Scarlett';
-- There are two actors with the first name Scarlett.

-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(film_id)
FROM film;
-- 1000 films available for rent.
SELECT COUNT(rental_id)
FROM rental;
-- 16044 rentals 

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT min(length) as min_duration, max(length) as max_duration
FROM film;
-- min is 46, max is 185

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT SEC_TO_TIME((avg(length))*60) as 'hours and min'
FROM film;
-- 1:55:16

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(LAST_NAME))
FROM ACTOR;
-- 121 different last names

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT datediff(max(rental_date), min(rental_date))
FROM rental;
-- 266 days

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, date_format(rental_date, '%M') as 'month', date_format(rental_date, '%a') as 'weekday'
FROM rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, date_format(rental_date, '%M') as 'month', date_format(rental_date, '%a') as 'weekday',
case
WHEN (date_format(rental_date, '%a')) in ('Sat', 'Sun') then 'weekend'
else 'workday'
END AS 'day_type'
FROM rental
LIMIT 20;

-- 9. Get release years.
SELECT title, release_year
FROM film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT * 
FROM film
where title like '%armageddon%';
-- 6 films with armageddon in the title

-- 11. Get all films which title ends with APOLLO.
SELECT *
FROM film
WHERE title like '%apollo';
-- 5 films that end with apollo

-- 12. Get 10 the longest films.
SELECT title, length
FROM film
order by length desc
LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT count(special_features)
FROM film
WHERE special_features LIKE '%Behind the Scenes%';
-- 538 film include Behind the Scenes content