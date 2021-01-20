Use sakila;

-- 1 --
SELECT first_name
FROM sakila.actor
WHERE first_name = 'Scarlett';

-- 2 --
-- FROM sakila.rental;

SELECT count(film_id) AS RentedMovies
FROM sakila.inventory;

SELECT count(film_id) AS AvailableForRent
FROM sakila.inventory;

-- 3 --
SELECT min(length) AS min_duration, max(length) AS max_duration
FROM sakila.film;

-- 4 --
SELECT FLOOR(AVG(length) / 60) as Hours, (FLOOR(AVG(length)) % 60) as Minutes
FROM sakila.film;

-- 5 --
SELECT count(distinct last_name) AS LastName
FROM actor;

-- 6 --
SELECT DATEDIFF(max(rental_date), min(rental_date)) AS DaysOfOperating
FROM rental;

-- 7 --
SELECT *, MONTH(rental_date) AS month, DAY(rental_date) AS day 
FROM rental
LIMIT 20;

-- 8 --
SELECT *, dayofweek(rental_date) AS DayOfWeek from rental;

SELECT *, MONTH(rental_date) AS month, DAY(rental_date) AS day,
CASE
	WHEN DAYOFWEEK(rental_date) = 1 THEN "Weekend"
    WHEN DAYOFWEEK(rental_date) = 7 THEN "Weekend"
    ELSE "Weekday"
END AS day_type
FROM rental;

-- 9 --
select date(max(rental_date))- INTERVAL 30 DAY, date(max(rental_date)) #getting the days
from rental;

select count(rental_id) from sakila.rental
where date(rental_date) between date("2006-01-15") and date("2006-02-14");
