-- В данном файле представлены все запросы к базе данных Chinook_PostgreSql.sql

-- Разбивка продаж по жанрам в разных странах (Sales breakdown by genre in different countries)
SELECT
    billing_country AS country,
    Genre.Name AS genre,
    SUM(invoice_line.Quantity) AS quantity_sold
FROM
    invoice_line
    JOIN Track ON invoice_line.track_Id = Track.track_Id
    JOIN Genre ON Track.Genre_Id = Genre.Genre_Id
    JOIN Invoice ON invoice_line.Invoice_Id = Invoice.Invoice_Id
GROUP BY
    country, Genre.Name
ORDER BY
    country, quantity_sold DESC;

-- Продажи по годам и странам (Sales by year and country)
SELECT DATE_PART('year', InvoiceDate) AS year, BillingCountry AS country, SUM(Total) AS total_sales
FROM Invoice
GROUP BY year, BillingCountry
ORDER BY year DESC, total_sales DESC;


-- Доля рынка каждого жанра в продажах (Market share of each genre in sales)
SELECT genre.Name AS genre, ROUND(SUM(invoice_line.unit_price * invoice_line.Quantity)::numeric, 2) AS total_revenue, ROUND(100.0 * SUM(invoice_line.unit_price * invoice_line.Quantity) / SUM(SUM(invoice_line.unit_price * invoice_line.Quantity)) OVER(), 2) AS market_share_percentage
FROM invoice_line
JOIN track ON invoice_line.track_id = track.track_id
JOIN Genre ON Track.genre_id = Genre.genre_id
GROUP BY Genre.Name
ORDER BY total_revenue DESC;


-- Количество треков в альбоме (number_tracks_album)
select a.title, g.name, count(*) num_tracks
from album a
join track t on a.album_id = t.album_id
join genre g on t.genre_id = g.genre_id
group by a.title, g.name
having count(*) > 1;

-- Album sales by artist (Продажи альбомов по исполнителям)
SELECT Artist.Name AS artist, COUNT(DISTINCT invoice_line .invoice_line_id) AS albums_sold
FROM invoice_line
JOIN Track ON invoice_line.track_id = Track.track_id
JOIN Album ON Track.album_id = album.album_id
JOIN Artist ON Album.artist_id = Artist.artist_id
GROUP BY Artist.Name
ORDER BY albums_sold DESC;

-- Average track price by genre (Средняя цена трека по жанрам)
SELECT Genre.Name AS genre, AVG(track.unit_price) AS average_price
FROM Track
JOIN Genre ON Track.genre_id = Genre.genre_id
GROUP BY Genre.Name
ORDER BY average_price DESC;

-- 25 albums by number of tracks sold (Топ 25 альбомов по количеству проданных треков)
SELECT Album.Title AS album, Artist.Name AS artist, COUNT(*) AS tracks_sold
FROM invoice_line
JOIN Track ON invoice_line.track_id = Track.track_id
JOIN Album ON Track.album_id = Album.album_id
JOIN Artist ON Album.Artist_Id = Artist.Artist_Id
GROUP BY Album.Title, Artist.Name
ORDER BY tracks_sold DESC
limit 25;

-- Percentage of sales of genre tracks from total sales (Процент продаж треков жанра от общего количества продаж)
SELECT
    Genre.Name AS genre_name,
    COUNT(*) AS track_sales,
    round(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),2) AS percentage_of_total_sales
FROM
    invoice_line
    JOIN Track ON invoice_line .track_id = Track.track_id
    JOIN Genre ON Track.Genre_Id = Genre.Genre_Id
GROUP BY
    Genre.Name
ORDER BY
    track_sales DESC;
