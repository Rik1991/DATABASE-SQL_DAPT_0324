-- creazione tabella impiegato
CREATE TABLE impiegato (
    CodiceFiscale VARCHAR(100) PRIMARY KEY,
    TitoloStudio VARCHAR(100),
    Nome VARCHAR(100),
    Recapito VARCHAR(100)
);
-- creazione tabella store
CREATE TABLE store (
    CodiceStore INT PRIMARY KEY,
    IndirizzoFisico VARCHAR(100),
    NumeroTelefono VARCHAR(100)
);
-- creazione tabella servizio_impiegato
CREATE TABLE servizio_impiegato (
    IDservizio INT PRIMARY KEY,
    CodiceFiscale VARCHAR(100),
    DataFine VARCHAR(50),
    DataInizio VARCHAR(50),
    CodiceStore INT,
    Carica VARCHAR(100),
    CONSTRAINT Fk_store FOREIGN KEY (CodiceStore)
        REFERENCES store (CodiceStore),
    CONSTRAINT Fk_impiegato FOREIGN KEY (CodiceFiscale)
        REFERENCES impiegato (CodiceFiscale)
);
-- creazione tabella videogioco
CREATE TABLE videogioco (
    IDvideogioco INT PRIMARY KEY,
    Titolo VARCHAR(100),
    AnnoDistribuzione VARCHAR(50),
    Genere VARCHAR(50),
    Sviluppatore VARCHAR(100),
    CostoAcquisto DECIMAL(4 , 2 )
);
-- creazione tabella versione
CREATE TABLE versione (
    IDversione INT PRIMARY KEY,
    remake VARCHAR(100),
    IDvideogioco INT,
    CONSTRAINT Fk_videogioco FOREIGN KEY (IDvideogioco)
        REFERENCES videogioco (IDvideogioco)
);
-- creazione tabella collocazione_videogioco
CREATE TABLE collocazione_videogioco (
    IDcollocazione INT PRIMARY KEY,
    CodiceStore INT,
    IDvideogioco INT,
    CONSTRAINT Fk_videogioco_collocazione_videogioco FOREIGN KEY (IDvideogioco)
        REFERENCES videogioco (IDvideogioco),
    CONSTRAINT Fk_store_collocazione_videogioco FOREIGN KEY (CodiceStore)
        REFERENCES store (CodiceStore)
);
-- inserimento valori all'interno della tabella store
INSERT INTO store (CodiceStore, IndirizzoFisico, NumeroTelefono) VALUES
(1, 'Via Roma 123, Milano', '+39 021 234567'),
(2, 'Corso Italia 456, Roma', '+39 067 654321'),
(3, 'Piazza San Marco 789, Venezia', '+39 041 9876543'),
(4, 'Viale degli Ulivi 234, Napoli', '+39 081 3456789'),
(5, 'Via Torino 567, Torino', '+39 011 8765432'),
(6, 'Corso Vittorio Emanuele 890, Firenze', '+39 055 2345678'),
(7, 'Piazza del Duomo 123, Bologna', '+39 051 8765432'),
(8, 'Via Garibaldi 456, Genova', '+39 010 2345678'),
(9, 'Lungarno Mediceo 789, Pisa', '+39 050 8765432'),
(10, 'Corso Cavour 101, Palermo', '+39 091 2345678');
-- inserimento valori all'interno della tabella impiegato
INSERT INTO impiegato (CodiceFiscale, TitoloStudio, Nome, Recapito) VALUES
('ABC12345XYZ67890', 'Laurea in Economia', 'Mario Rossi', 'mario.rossi@email.com'),
('DEF67890XYZ12345', 'Diploma di Ragioneria', 'Anna Verdi', 'anna.verdi@email.com'),
('GHI12345XYZ67890', 'Laurea in Informatica', 'Luigi Bianchi', 'luigi.bianchi@email.com'),
('JKL67890XYZ12345', 'Laurea in Lingue', 'Laura Neri', 'laura.neri@email.com'),
('MNO12345XYZ67890', 'Diploma di Geometra', 'Andrea Moretti', 'andrea.moretti@email.com'),
('PQR67890XYZ12345', 'Laurea in Psicologia', 'Giulia Ferrara', 'giulia.ferrara@email.com'),
('STU12345XYZ67890', 'Diploma di Elettronica', 'Marco Esposito', 'marco.esposito@email.com'),
('VWX67890XYZ12345', 'Laurea in Giurisprudenza', 'Sara Romano', 'sara.romano@email.com'),
('YZA12345XYZ67890', 'Diploma di Informatica', 'Roberto De Luca', 'roberto.deluca@email.com'),
('BCD67890XYZ12345', 'Laurea in Lettere', 'Elena Santoro', 'elena.santoro@email.com');
-- inserimento valori all'interno della tabella servizio_impiegato
INSERT INTO servizio_impiegato (IDservizio, CodiceFiscale, DataFine, DataInizio, CodiceStore, Carica) VALUES
(1, 'ABC12345XYZ67890', NULL, '2023-01-01', 1, 'Cassiere'),
(2, 'DEF67890XYZ12345', NULL, '2023-02-01', 2, 'Commesso'),
(3, 'GHI12345XYZ67890', NULL, '2023-03-01', 3, 'Magazziniere'),
(4, 'JKL67890XYZ12345', NULL, '2023-04-01', 4, 'Addetto alle vendite'),
(5, 'MNO12345XYZ67890', NULL, '2023-05-01', 5, 'Addetto alle pulizie'),
(6, 'PQR67890XYZ12345', NULL, '2023-06-01', 6, 'Commesso'),
(7, 'STU12345XYZ67890', NULL, '2023-07-01', 7, 'Commesso'),
(8, 'VWX67890XYZ12345', NULL, '2023-08-01', 8, 'Cassiere'),
(9, 'YZA12345XYZ67890', NULL, '2023-09-01', 9, 'Cassiere'),
(10, 'BCD67890XYZ12345', NULL, '2023-10-01', 10, 'Cassiere');
-- inserimento valori all'interno della tabella videogioco
INSERT INTO videogioco (IDvideogioco, Titolo, AnnoDistribuzione, Genere, Sviluppatore, CostoAcquisto) VALUES
(1, 'Fifa 2023', '2023', 'Calcio', 'EA Sports', 49.99),
(2, 'Assassin''s Creed: Valhalla', '2020', 'Action', 'Ubisoft', 59.99),
(3, 'Super Mario Odyssey', '2017', 'Platform', 'Nintendo', 39.99),
(4, 'The Last of Us Part II', '2020', 'Action', 'Naughty Dog', 69.99),
(5, 'Cyberpunk 2077', '2020', 'RPG', 'CD Projekt Red', 49.99),
(6, 'Animal Crossing: New Horizons', '2020', 'Simulation', 'Nintendo', 54.99),
(7, 'Call of Duty: Warzone', '2020', 'FPS', 'Naughty Dog', 0.00),
(8, 'The Legend of Zelda: Breath of the Wild', '2017', 'Action-Adventure', 'CD Projekt Red', 59.99),
(9, 'Fortnite', '2017', 'Battle Royale', 'Nintendo', 0.00),
(10, 'Red Dead Redemption 2', '2018', 'Action-Adventure', 'Epic Games', 39.99);
-- inserimento valori all'interno della tabella collocazione_videogioco
INSERT INTO collocazione_videogioco (IDcollocazione, CodiceStore, IDvideogioco) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);
-- inserimento all'interno della tabella "servizio_impiegato" il campo calcolato "durata_incarico"
ALTER TABLE servizio_impiegato ADD COLUMN durata_incarico INT;
UPDATE servizio_impiegato 
SET 
    durata_incarico = DATEDIFF(STR_TO_DATE(DataFine, '%Y-%m-%d'),
            STR_TO_DATE(DataInizio, '%Y-%m-%d'));
-- inserirmento all'interno del campo "DataFine" della tabella "servizio_impiegato" dei valori di data successivi di 1mese rispetto a "DataInizio"
UPDATE servizio_impiegato
SET DataFine = DATE_FORMAT(DATE_ADD(STR_TO_DATE(DataInizio, '%Y-%m-%d'), INTERVAL 1 MONTH), '%Y-%m-%d');



