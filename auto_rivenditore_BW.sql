-- creazione tabelle
CREATE TABLE proprietario (
    CF_proprietario VARCHAR(16) PRIMARY KEY,
    Nome VARCHAR(100),
    Targa VARCHAR(20),
    Anno_acquisto YEAR,
    Anno_vendita YEAR,
    Città_residenza VARCHAR(100),
    FOREIGN KEY (Targa) REFERENCES auto(targa)
);
CREATE TABLE concessionaria (
    nome_concessionaria VARCHAR(100) PRIMARY KEY,
    telefono VARCHAR(20),
    indirizzo VARCHAR(100),
    città VARCHAR(100),
    regione VARCHAR(100),
    responsabile VARCHAR(100)
);
CREATE TABLE auto (
    prezzo DECIMAL(10, 2),
    targa VARCHAR(20) PRIMARY KEY,
    nome_concessionaria VARCHAR(100),
    marca VARCHAR(100),
    colore VARCHAR(50),
    cilindrata INT,
    tipo_cambio VARCHAR(50),
    FOREIGN KEY (nome_concessionaria) REFERENCES concessionaria(nome_concessionaria)
);
CREATE TABLE cliente (
    CF_cliente VARCHAR(16) PRIMARY KEY,
    Nome VARCHAR(100),
    Città_residenza VARCHAR(100)
);
CREATE TABLE auto_vendute (
    ID_auto_vendute INT AUTO_INCREMENT PRIMARY KEY,
    prezzo_vendita DECIMAL(10, 2),
    targa VARCHAR(20),
    CF_cliente VARCHAR(16),
    data_vendita DATE,
    FOREIGN KEY (targa) REFERENCES auto(targa),
    FOREIGN KEY (CF_cliente) REFERENCES cliente(CF_cliente)
);
-- inserimento valori all'interno delle tabelle
INSERT INTO concessionaria (nome_concessionaria, telefono, indirizzo, città, regione, responsabile) VALUES
('Milano Auto', '+39 02 1234567', 'Via Roma 10', 'Milano', 'Lombardia', 'Giovanni Rossi'),
('Torino Auto', '+39 011 7654321', 'Via Torino 20', 'Torino', 'Piemonte', 'Mario Bianchi'),
('Napoli Auto', '+39 081 8765432', 'Via Napoli 30', 'Napoli', 'Campania', 'Luca Verdi'),
('Firenze Auto', '+39 055 3456789', 'Via Firenze 40', 'Firenze', 'Toscana', 'Francesco Neri'),
('Roma Auto', '+39 06 6543210', 'Via Roma 50', 'Roma', 'Lazio', 'Antonio Esposito');
INSERT INTO auto (prezzo, targa, nome_concessionaria, marca, colore, cilindrata, tipo_cambio) VALUES
(15000, 'AA111AA', 'Milano Auto', 'Fiat', 'Rosso', 1200, 'Manuale'),
(20000, 'BB222BB', 'Milano Auto', 'Volkswagen', 'Blu', 1600, 'Automatico'),
(18000, 'CC333CC', 'Torino Auto', 'Ford', 'Rosso', 1400, 'Manuale'),
(22000, 'DD444DD', 'Napoli Auto', 'Renault', 'Nero', 2000, 'Automatico'),
(25000, 'EE555EE', 'Firenze Auto', 'Audi', 'Bianco', 1800, 'Manuale'),
(15000, 'FF666FF', 'Roma Auto', 'BMW', 'Rosso', 1500, 'Manuale'),
(17000, 'GG777GG', 'Milano Auto', 'Mercedes', 'Argento', 1700, 'Automatico'),
(16000, 'HH888HH', 'Torino Auto', 'Toyota', 'Verde', 1300, 'Manuale'),
(21000, 'II999II', 'Napoli Auto', 'Peugeot', 'Rosso', 1900, 'Automatico'),
(24000, 'JJ101JJ', 'Firenze Auto', 'Opel', 'Giallo', 1600, 'Manuale'),
(18000, 'KK202KK', 'Roma Auto', 'Fiat', 'Rosso', 1500, 'Manuale'),
(17000, 'LL303LL', 'Milano Auto', 'Volkswagen', 'Blu', 1400, 'Automatico'),
(16000, 'MM404MM', 'Milano Auto', 'Ford', 'Rosso', 1200, 'Manuale'),
(19000, 'NN505NN', 'Milano Auto', 'Renault', 'Nero', 1600, 'Automatico'),
(20000, 'OO606OO', 'Firenze Auto', 'Audi', 'Bianco', 2000, 'Manuale'),
(22000, 'PP707PP', 'Milano Auto', 'BMW', 'Rosso', 1800, 'Manuale'),
(24000, 'QQ808QQ', 'Torino Auto', 'Mercedes', 'Argento', 1700, 'Automatico'),
(26000, 'RR909RR', 'Milano Auto', 'Toyota', 'Verde', 1300, 'Manuale'),
(27000, 'SS010SS', 'Milano Auto', 'Peugeot', 'Rosso', 1900, 'Automatico'),
(30000, 'TT111TT', 'Firenze Auto', 'Opel', 'Giallo', 1600, 'Manuale'),
(32000, 'UU212UU', 'Milano Auto', 'Fiat', 'Blu', 1500, 'Automatico'),
(15000, 'VV313VV', 'Milano Auto', 'Volkswagen', 'Rosso', 1600, 'Manuale'),
(18000, 'WW414WW', 'Milano Auto', 'Ford', 'Nero', 1400, 'Automatico'),
(19000, 'XX515XX', 'Roma Auto', 'Renault', 'Bianco', 1200, 'Manuale'),
(20000, 'YY616YY', 'Milano Auto', 'Audi', 'Rosso', 1800, 'Manuale'),
(17000, 'ZZ717ZZ', 'Milano Auto', 'BMW', 'Argento', 2000, 'Automatico');
INSERT INTO cliente (CF_cliente, Nome, Città_residenza) VALUES
('CF00001', 'Luca Rossi', 'Milano'),
('CF00002', 'Mario Bianchi', 'Roma'),
('CF00003', 'Giulia Verdi', 'Napoli'),
('CF00004', 'Paolo Neri', 'Firenze'),
('CF00005', 'Anna Esposito', 'Torino'),
('CF00006', 'Marco Ferri', 'Milano'),
('CF00007', 'Luisa Lombardi', 'Napoli'),
('CF00008', 'Alessandro De Luca', 'Roma'),
('CF00009', 'Elena Fabbri', 'Firenze'),
('CF00010', 'Sara Conti', 'Milano'),
('CF00011', 'Simone Russo', 'Torino'),
('CF00012', 'Francesca Fontana', 'Milano'),
('CF00013', 'Matteo Rinaldi', 'Napoli'),
('CF00014', 'Laura Greco', 'Roma'),
('CF00015', 'Davide Giordano', 'Milano'),
('CF00016', 'Chiara Mancini', 'Firenze'),
('CF00017', 'Stefano Colombo', 'Milano'),
('CF00018', 'Federica Ricci', 'Torino'),
('CF00019', 'Valerio Caruso', 'Napoli'),
('CF00020', 'Silvia Galli', 'Milano'),
('CF00021', 'Roberto Cattaneo', 'Roma'),
('CF00022', 'Caterina Bianco', 'Napoli'),
('CF00023', 'Giorgio Santini', 'Firenze'),
('CF00024', 'Irene Sartori', 'Torino'),
('CF00025', 'Gabriele Moretti', 'Milano'),
('CF00026', 'Giovanni Martini', 'Roma'),
('CF00027', 'Martina Bruno', 'Napoli'),
('CF00028', 'Filippo Testa', 'Firenze'),
('CF00029', 'Lucia Guerra', 'Milano'),
('CF00030', 'Lorenzo De Angelis', 'Roma');
INSERT INTO proprietario (CF_proprietario, Nome, Targa, Anno_acquisto, Anno_vendita, Città_residenza) VALUES
('CF00001', 'Luca Rossi', 'AA111AA', 2010, 2012, 'Milano'),
('CF00002', 'Mario Bianchi', 'AA111AA', 2013, 2015, 'Roma'),
('CF00003', 'Giulia Verdi', 'BB222BB', 2010, 2014, 'Napoli'),
('CF00004', 'Paolo Neri', 'CC333CC', 2011, 2016, 'Firenze'),
('CF00005', 'Anna Esposito', 'DD444DD', 2012, 2018, 'Torino'),
('CF00006', 'Marco Ferri', 'EE555EE', 2013, 2020, 'Milano'),
('CF00007', 'Luisa Lombardi', 'FF666FF', 2010, 2017, 'Napoli'),
('CF00008', 'Alessandro De Luca', 'GG777GG', 2014, 2020, 'Roma'),
('CF00009', 'Elena Fabbri', 'HH888HH', 2011, 2015, 'Firenze'),
('CF00010', 'Sara Conti', 'II999II', 2016, 2019, 'Milano'),
('CF00011', 'Simone Russo', 'JJ101JJ', 2010, 2013, 'Torino'),
('CF00012', 'Francesca Fontana', 'KK202KK', 2011, 2014, 'Milano'),
('CF00013', 'Matteo Rinaldi', 'LL303LL', 2010, 2015, 'Napoli'),
('CF00014', 'Laura Greco', 'MM404MM', 2013, 2016, 'Roma'),
('CF00015', 'Davide Giordano', 'NN505NN', 2011, 2017, 'Milano'),
('CF00016', 'Chiara Mancini', 'OO606OO', 2010, 2014, 'Firenze'),
('CF00017', 'Stefano Colombo', 'PP707PP', 2012, 2019, 'Milano'),
('CF00018', 'Federica Ricci', 'QQ808QQ', 2010, 2018, 'Torino'),
('CF00019', 'Valerio Caruso', 'RR909RR', 2011, 2020, 'Napoli'),
('CF00020', 'Silvia Galli', 'SS010SS', 2013, 2016, 'Milano'),
('CF00021', 'Roberto Cattaneo', 'TT111TT', 2011, 2015, 'Roma'),
('CF00022', 'Caterina Bianco', 'UU212UU', 2014, 2020, 'Napoli'),
('CF00023', 'Giorgio Santini', 'VV313VV', 2012, 2016, 'Firenze'),
('CF00024', 'Irene Sartori', 'WW414WW', 2011, 2019, 'Torino'),
('CF00025', 'Gabriele Moretti', 'XX515XX', 2010, 2018, 'Milano'),
('CF00026', 'Giovanni Martini', 'YY616YY', 2013, 2019, 'Roma'),
('CF00027', 'Martina Bruno', 'ZZ717ZZ', 2010, 2016, 'Napoli'),
('CF00028', 'Filippo Testa', 'AA111AA', 2015, 2020, 'Firenze'),
('CF00029', 'Lucia Guerra', 'BB222BB', 2011, 2017, 'Milano'),
('CF00030', 'Lorenzo De Angelis', 'CC333CC', 2012, 2020, 'Roma');
INSERT INTO auto_vendute (ID_auto_vendute, prezzo_vendita, targa, CF_cliente, data_vendita) VALUES
(1, 15000, 'AA111AA', 'CF00001', '2010-05-10'),
(2, 20000, 'BB222BB', 'CF00003', '2011-06-15'),
(3, 18000, 'CC333CC', 'CF00004', '2012-07-20'),
(4, 22000, 'DD444DD', 'CF00005', '2013-08-25'),
(5, 25000, 'EE555EE', 'CF00006', '2014-09-30'),
(6, 15000, 'FF666FF', 'CF00007', '2015-10-05'),
(7, 17000, 'GG777GG', 'CF00008', '2016-11-10'),
(8, 16000, 'HH888HH', 'CF00009', '2017-12-15'),
(9, 21000, 'II999II', 'CF00010', '2018-01-20'),
(10, 24000, 'JJ101JJ', 'CF00011', '2019-02-25'),
(11, 18000, 'KK202KK', 'CF00012', '2015-03-30'),
(12, 17000, 'LL303LL', 'CF00013', '2015-04-05'),
(13, 16000, 'MM404MM', 'CF00014', '2015-05-10'),
(14, 19000, 'NN505NN', 'CF00015', '2015-06-15'),
(15, 20000, 'OO606OO', 'CF00016', '2015-07-20'),
(16, 22000, 'PP707PP', 'CF00017', '2015-08-25'),
(17, 24000, 'QQ808QQ', 'CF00018', '2015-09-30'),
(18, 26000, 'RR909RR', 'CF00019', '2015-10-05'),
(19, 27000, 'SS010SS', 'CF00020', '2015-11-10'),
(20, 30000, 'TT111TT', 'CF00021', '2015-12-15');
-- Marca e Colore delle Auto di che costano più di 10.000 € 
SELECT 
    marca, colore
FROM
    auto
WHERE
    prezzo > 10000;
-- Tutti i proprietari di un’auto di colore ROSSO 
SELECT 
    proprietario.Nome, proprietario.Targa, auto.colore
FROM
    proprietario
        JOIN
    auto ON proprietario.Targa = auto.targa
WHERE
    auto.colore = 'Rosso';
-- Costo totale di tutte le auto con Cilindrata superiore a 1600 
SELECT 
    SUM(prezzo) AS Costo_Totale
FROM
    auto
WHERE
    cilindrata > 1600;
-- Targa e Nome del proprietario delle Auto in una concessionaria della Città di Roma 
SELECT 
    proprietario.Targa, proprietario.Nome
FROM
    proprietario
        JOIN
    auto ON proprietario.Targa = auto.targa
        JOIN
    concessionaria ON auto.nome_concessionaria = concessionaria.nome_concessionaria
WHERE
    concessionaria.città = 'Roma';
-- Per ogni Concessionaria, il numero di Auto 
SELECT 
    nome_concessionaria, COUNT(*) AS Numero_Auto
FROM
    auto
GROUP BY nome_concessionaria;
-- Il Responsabile di Concessionaria di tutte le auto con Cambio Automatico e Anno Acquisto 2010
SELECT DISTINCT
    concessionaria.responsabile
FROM
    auto
        JOIN
    concessionaria ON auto.nome_concessionaria = concessionaria.nome_concessionaria
        JOIN
    proprietario ON auto.targa = proprietario.Targa
WHERE
    auto.tipo_cambio = 'Automatico'
        AND proprietario.Anno_acquisto = 2010;
-- Per ciascuna TARGA il colore, il prezzo e la città in cui si trova il veicolo 
SELECT 
    auto.targa, auto.colore, auto.prezzo, concessionaria.città
FROM
    auto
        JOIN
    concessionaria ON auto.nome_concessionaria = concessionaria.nome_concessionaria;
-- Le auto con almeno tre Proprietari 
SELECT 
    Targa, count(CF_proprietario)
FROM
    proprietario
GROUP BY Targa
HAVING COUNT(*) >= 3;
-- La targa delle auto vendute nel 2015 
SELECT 
    targa
FROM
    auto_vendute
WHERE
    YEAR(data_vendita) = 2015;
-- La regione con più auto 
SELECT 
    concessionaria.regione, COUNT(auto.targa) AS Numero_Auto
FROM
    auto
        JOIN
    concessionaria ON auto.nome_concessionaria = concessionaria.nome_concessionaria
GROUP BY concessionaria.regione
ORDER BY Numero_Auto DESC
LIMIT 1;
-- La Targa delle auto che si trovano a Milano, con cambio automatico, colore rosso, di proprietari residenti a Milano
SELECT 
    auto.targa
FROM
    auto
        JOIN
    proprietario ON auto.targa = proprietario.Targa
WHERE
    auto.colore = 'Rosso'
        AND auto.tipo_cambio = 'Automatico'
        AND proprietario.Città_residenza = 'Milano';
-- Il fatturato per concessionaria ordinato per anno (decrescente)
SELECT 
    concessionaria.nome_concessionaria,
    YEAR(auto_vendute.data_vendita) AS Anno,
    SUM(auto_vendute.prezzo_vendita) AS Fatturato
FROM
    auto_vendute
        JOIN
    auto ON auto_vendute.targa = auto.targa
        JOIN
    concessionaria ON auto.nome_concessionaria = concessionaria.nome_concessionaria
GROUP BY concessionaria.nome_concessionaria , Anno
ORDER BY Anno DESC;
-- Il margine di guadagno (prezzo vendita-prezzo acquisto/prezzo vendita) per ogni auto venduta
SELECT 
    auto_vendute.targa,
    (auto_vendute.prezzo_vendita - auto.prezzo) / auto_vendute.prezzo_vendita AS Margine_Guadagno
FROM
    auto_vendute
        JOIN
    auto ON auto_vendute.targa = auto.targa;
-- aggiornamento prezzo auto vendute per far si che il margine di guadagno sia pari al 10%
UPDATE auto_vendute av
        JOIN
    auto a ON av.targa = a.targa 
SET 
    av.prezzo_vendita = a.prezzo + (a.prezzo * 0.10)
WHERE
    av.prezzo_vendita <= a.prezzo;
-- Guadagno netto per concessionaria per anno (decrescente)
SELECT 
    concessionaria.nome_concessionaria,
    YEAR(auto_vendute.data_vendita) AS Anno,
    SUM(auto_vendute.prezzo_vendita - auto.prezzo) AS Guadagno_Netto
FROM
    auto_vendute
        JOIN
    auto ON auto_vendute.targa = auto.targa
        JOIN
    concessionaria ON auto.nome_concessionaria = concessionaria.nome_concessionaria
GROUP BY concessionaria.nome_concessionaria , Anno
ORDER BY Guadagno_Netto DESC;



















