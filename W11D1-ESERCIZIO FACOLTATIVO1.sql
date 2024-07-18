-- Cominciate facendo un’analisi esplorativa del database, ad esempio: Fate un elenco di tutte le tabelle. Visualizzate le prime 10 righe della tabella Album. Trovate il numero totale di canzoni della tabella Tracks. Trovate i diversi generi presenti nella tabella Genre. … … Effettuate tutte le query esplorative che vi servono per prendere confidenza con i dati.
SELECT * FROM chinook.album WHERE AlbumId<11;
SELECT count(chinook.track.TrackId) FROM chinook.track;
SELECT * FROM chinook.genre;
-- Recuperate il nome di tutte le tracce e del genere associato.
SELECT chinook.track.Name, chinook.genre.Name FROM chinook.track LEFT JOIN chinook.genre ON chinook.track.GenreId = chinook.genre.GenreId;
-- Recuperate il nome di tutti gli artisti che hanno almeno un album nel database
SELECT chinook.artist.Name FROM chinook.artist INNER JOIN chinook.album ON chinook.artist.ArtistId = chinook.album.ArtistId group by chinook.artist.Name having count(chinook.album.AlbumId)>=1;
--  Esistono artisti senza album nel database? --> si 
SELECT chinook.artist.Name, count(chinook.album.Title) FROM chinook.artist LEFT JOIN chinook.album ON chinook.artist.ArtistId = chinook.album.ArtistId group by chinook.artist.Name HAVING count(chinook.album.Title)=0;
-- Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media.Esiste un modo per recuperare il nome della tipologia di media? --> si
SELECT chinook.track.Name, chinook.genre.Name, chinook.mediatype.Name FROM chinook.track LEFT join chinook.genre ON chinook.track.GenreId = chinook.genre.GenreId LEFT join chinook.mediatype ON chinook.track.MediaTypeId = chinook.mediatype.MediaTypeId;
-- Elencate i nomi di tutti gli artisti e dei loro album
SELECT chinook.artist.Name, chinook.album.Title FROM chinook.artist LEFT JOIN chinook.album ON chinook.artist.ArtistId = chinook.album.ArtistId;