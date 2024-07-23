-- Scoprite quanti clienti si sono registrati nel 2006.
SELECT 
    COUNT(sakila.customer.customer_id) AS 'customer_number',
    YEAR(create_date) AS 'registration_year'
FROM
    customer
GROUP BY registration_year
HAVING registration_year = 2006;
-- Trovate il numero totale di noleggi effettuati il giorno 1/1/2006.
SELECT 
    DATE(sakila.rental.rental_date) AS 'date_rental',
    COUNT(sakila.rental.rental_id) AS 'total_rental'
FROM
    sakila.rental
WHERE
    DATE(sakila.rental.rental_date) = '2006-01-01'
GROUP BY DATE(sakila.rental.rental_date);
-- Elencate tutti i film noleggiati nell’ultima settimana e tutte le informazioni legate al cliente che li ha noleggiati.
SELECT 
    rental.rental_id,
   date(rental.rental_date) as rentaldate,
    rental.return_date,
    film.film_id,
    film.title,
    film.description,
    film.release_year,
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.email,
    address.address,
    address.address2,
    address.district,
    city.city,
    address.postal_code,
    address.phone
FROM
    rental
        JOIN
    customer ON sakila.customer.customer_id = sakila.rental.customer_id
        JOIN
    inventory ON sakila.inventory.inventory_id = sakila.rental.inventory_id
        JOIN
    film ON sakila.film.film_id = sakila.inventory.film_id
        JOIN
    address ON sakila.address.address_id = sakila.customer.address_id
        JOIN
    city ON sakila.city.city_id = sakila.address.city_id
WHERE
    DATE(rental.rental_date) >= DATE_SUB('2006-02-14', INTERVAL 7 day);
-- Calcolate la durata media del noleggio per ogni categoria di film.
SELECT 
    sakila.category.name,
    AVG(DATEDIFF(return_date, rental_date)) as 'avg_rental_length'
FROM
    rental
        JOIN
    sakila.inventory ON sakila.inventory.inventory_id = sakila.rental.inventory_id
        JOIN
    film_category ON sakila.film_category.film_id = sakila.inventory.film_id
        JOIN
    category ON sakila.category.category_id = sakila.film_category.category_id
    group by sakila.category.name;
-- trovare la durata del noleggio più lungo
select DATEDIFF(return_date, rental_date) as 'rental_length' from rental order by DATEDIFF(return_date, rental_date) desc limit 1;
