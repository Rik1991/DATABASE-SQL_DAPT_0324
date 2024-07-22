-- Elencate il numero di tracce per ogni genere in ordine discendente, escludendo quei generi che hanno meno di 10 tracce
SELECT 
    g.Name AS GenreName, COUNT(t.TrackId) AS NumberOfTracks
FROM
    Track t
        JOIN
    Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
HAVING COUNT(t.TrackId) >= 10
ORDER BY NumberOfTracks DESC;
-- Trovate le tre canzoni più costose
SELECT 
    t.Name AS TrackName, t.UnitPrice
FROM
    Track t
ORDER BY t.UnitPrice DESC
LIMIT 3;
--  Elencate gli artisti che hanno canzoni più lunghe di 6 minuti
SELECT DISTINCT
    a.name
FROM
    artist a
        INNER JOIN
    album al ON al.ArtistId = a.ArtistId
        INNER JOIN
    track t ON t.AlbumId = al.AlbumId
WHERE
    t.Milliseconds > 6 * 60 * 1000;
-- Individuate la durata media delle tracce per ogni genere
SELECT 
    g.Name AS GenreName,
    AVG(t.Milliseconds) / 60000 AS AvgDurationMinutes
FROM
    Track t
        JOIN
    Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name;
-- Elencate tutte le canzoni con la parola “Love” nel titolo, ordinandole alfabeticamente prima per genere e poi per nome
SELECT 
    t.name, g.Name
FROM
    track t
        INNER JOIN
    genre g ON t.GenreId = g.GenreId
WHERE
    t.name LIKE '%Love%'
ORDER BY g.Name ASC , t.Name ASC;
-- Trovate il costo medio per ogni tipologia di media
SELECT 
    AVG(t.UnitPrice) AS 'avg_price', m.Name
FROM
    track t
        INNER JOIN
    mediatype m ON m.MediaTypeId = t.MediaTypeId
GROUP BY m.Name;
-- Individuate il genere con più tracce
SELECT 
    COUNT(t.TrackId) AS 'n°_track', g.Name
FROM
    track t
        INNER JOIN
    genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY COUNT(t.TrackId) DESC
LIMIT 1;
-- Trovate gli artisti che hanno lo stesso numero di album dei Rolling Stones
SELECT 
    a.name, COUNT(album.AlbumId) AS 'n°_album'
FROM
    artist a
        INNER JOIN
    album ON a.ArtistId = album.ArtistId
GROUP BY a.name
HAVING COUNT(album.AlbumId) = (SELECT 
        COUNT(album.AlbumId) AS 'n°_album'
    FROM
        artist a
            INNER JOIN
        album ON a.ArtistId = album.ArtistId
    WHERE
        a.name LIKE '%Rolling%');
-- Trovate l’artista con l’album più costoso
SELECT 
    ar.Name AS ArtistName,
    al.Title AS AlbumTitle,
    SUM(t.UnitPrice) AS AlbumCost
FROM
    Track t
        JOIN
    Album al ON t.AlbumId = al.AlbumId
        JOIN
    Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY al.AlbumId
ORDER BY AlbumCost DESC
LIMIT 1;
    