-- Recuperate tutte le tracce che abbiano come genere “Pop” o “Rock”.
SELECT chinook.track.Name, chinook.genre.Name FROM chinook.track left join chinook.genre on chinook.track.GenreId = chinook.genre.GenreId where chinook.genre.Name IN ("Pop", "Rock");
-- Elencate tutti gli artisti e/o gli album che inizino con la lettera “A”.
select chinook.artist.Name, chinook.album.Title FROM chinook.artist INNER JOIN chinook.album ON chinook.artist.ArtistId = chinook.album.ArtistId WHERE chinook.artist.Name LIKE "A%" AND chinook.album.Title LIKE "A%";
select chinook.artist.Name, chinook.album.Title FROM chinook.artist INNER JOIN chinook.album ON chinook.artist.ArtistId = chinook.album.ArtistId WHERE chinook.artist.Name LIKE "A%" or chinook.album.Title LIKE "A%";
-- Elencate tutte le tracce che hanno come genere “Jazz” o che durano meno di 3 minuti.
SELECT chinook.track.Name, chinook.genre.Name, (chinook.track.Milliseconds*1.66667e-5) as "Durata_(minuti)" FROM chinook.track LEFT join chinook.genre ON chinook.genre.GenreId = chinook.track.GenreId WHERE chinook.genre.Name = "Jazz" or chinook.track.Milliseconds < 3/1.66667e-5;
-- Recuperate tutte le tracce più lunghe della durata media.
SELECT chinook.track.Name, (chinook.track.Milliseconds*1.66667e-5) as "Durata_(minuti)", (select avg(chinook.track.Milliseconds*1.66667e-5) FROM chinook.track) AS "AVG" FROM chinook.track WHERE chinook.track.Milliseconds > (select avg(chinook.track.Milliseconds) FROM chinook.track);
-- Individuate i generi che hanno tracce con una durata media maggiore di 4 minuti.
SELECT chinook.genre.Name AS GenreName, AVG(chinook.track.Milliseconds) / 60000 AS AvgDurationMinutes
FROM chinook.track
JOIN chinook.genre ON chinook.track.GenreId = chinook.genre.GenreId
GROUP BY chinook.genre.Name
HAVING AvgDurationMinutes > 4;
-- Individuate gli artisti che hanno rilasciato più di un album.
select chinook.artist.Name, count(chinook.album.AlbumId) AS "N°_ALBUM" FROM chinook.artist LEFT JOIN chinook.album ON chinook.artist.ArtistId = chinook.album.ArtistId GROUP BY chinook.artist.Name HAVING count(chinook.album.AlbumId) > 1;
-- Trovate la traccia più lunga in ogni album
SELECT 
    a.Title AS AlbumTitle, t.Name AS TrackName, t.Milliseconds
FROM
    Track t
        JOIN
    Album a ON t.AlbumId = a.AlbumId
WHERE
    t.Milliseconds = (SELECT 
            MAX(t2.Milliseconds)
        FROM
            Track t2
        WHERE
            t2.AlbumId = t.AlbumId);
-- Individuate la durata media delle tracce per ogni album.
SELECT chinook.album.Title, avg(chinook.track.Milliseconds) AS "AVG_TRACK_LENGTH" FROM chinook.album LEFT JOIN chinook.track ON chinook.album.AlbumId = chinook.track.AlbumId group by chinook.album.AlbumId;
-- Individuate gli album che hanno più di 20 tracce e mostrate il nome dell’album e il numero di tracce in esso contenute
SELECT a.Title AS AlbumTitle, COUNT(t.TrackId) AS NumberOfTracks
FROM Album a
JOIN Track t ON a.AlbumId = t.AlbumId
GROUP BY a.Title
HAVING COUNT(t.TrackId) > 20
order by NumberOfTracks ASC;



