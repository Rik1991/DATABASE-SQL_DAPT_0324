-- Identificate tutti i clienti che non hanno effettuato nessun noleggio a febbraio 2006.
SELECT 
    customer.customer_id, 
    customer.first_name, 
    customer.last_name, 
    customer.email,
    rental.rental_date
FROM
    customer
LEFT JOIN 
    rental ON customer.customer_id = rental.customer_id 
    AND rental.rental_date BETWEEN '2006-02-01' AND '2006-02-28'
    where rental.rental_date is null;
-- Elencate tutti i film che sono stati noleggiati più di 7 volte nell’ultimo quarto del 2005
SELECT 
    film.film_id, film.title, COUNT(*) AS 'total_rental'
FROM
    film
        LEFT JOIN
    inventory ON film.film_id = inventory.film_id
        LEFT JOIN
    rental ON inventory.inventory_id = rental.inventory_id
        AND rental.rental_date BETWEEN '2005-10-01' AND '2005-12-31'
GROUP BY film.film_id
HAVING COUNT(*) > 7;
-- Trovate il numero totale di noleggi effettuati il giorno 2006-02-14.
SELECT 
    COUNT(*) AS 'total_rental',
    DATE(sakila.rental.rental_date) AS 'date_rental'
FROM
    rental
WHERE
    DATE(sakila.rental.rental_date) = '2006-02-14'
GROUP BY rental.rental_date;
-- Calcolate la somma degli incassi generati nei weekend (sabato e domenica).
SELECT 
    SUM(p.amount) AS total_weekend_revenue
FROM
    payment p
        JOIN
    rental r ON p.rental_id = r.rental_id
WHERE
    DAYOFWEEK(r.rental_date) IN (1 , 7);
-- Individuate il cliente che ha speso di più in noleggi.
SELECT 
    customer.first_name,
    customer.last_name,
    SUM(payment.amount) AS 'total_paymentamount'
FROM
    customer
        JOIN
    payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY SUM(payment.amount) DESC
LIMIT 1;
-- elencate i 5 film con la maggior durata media di noleggio
SELECT 
    film.title,
    AVG(DATEDIFF(return_date, rental_date)) AS 'rental_length'
FROM
    rental
        JOIN
    inventory ON inventory.inventory_id = rental.inventory_id
        JOIN
    film ON film.film_id = inventory.film_id
GROUP BY film.film_id
ORDER BY AVG(DATEDIFF(return_date, rental_date)) DESC
LIMIT 5;
-- Calcolate il tempo medio tra due noleggi consecutivi da parte di un cliente.
WITH rental_with_lead AS (
    SELECT 
        r.customer_id, 
        c.first_name,
        c.last_name,
        r.rental_date,
        LEAD(r.rental_date) OVER (PARTITION BY r.customer_id ORDER BY r.rental_date) AS next_rental_date
    FROM 
        rental r
    JOIN 
        customer c ON r.customer_id = c.customer_id
)
SELECT 
    customer_id,
    first_name,
    last_name,
    AVG(TIMESTAMPDIFF(SECOND, rental_date, next_rental_date)) / 3600 AS avg_hours_between_rentals
FROM 
    rental_with_lead
WHERE 
    next_rental_date IS NOT NULL
GROUP BY 
    customer_id, first_name, last_name;
-- Individuate il numero di noleggi per ogni mese del 2005.
SELECT 
    year(rental.rental_date) AS 'year',
    MONTH(rental.rental_date) AS 'month',
    COUNT(rental.rental_id) AS 'total_rental'
FROM
    rental
where YEAR(rental.rental_date) = '2005'
GROUP BY MONTH(rental.rental_date) , YEAR(rental.rental_date);
-- Trovate i film che sono stati noleggiati almeno due volte lo stesso giorno.
select distinct
    film.title
FROM
    rental
        JOIN
    inventory ON inventory.inventory_id = rental.inventory_id
        JOIN
    film ON inventory.film_id = film.film_id
GROUP BY DATE(rental.rental_date) , film.title having COUNT(rental.rental_id) >= 2;
-- Calcolate il tempo medio di noleggio in ore
SELECT 
    AVG(DATEDIFF(rental.return_date, rental.rental_date)) * 24
FROM
    rental;
