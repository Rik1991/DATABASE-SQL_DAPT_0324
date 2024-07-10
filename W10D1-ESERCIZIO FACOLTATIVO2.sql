CREATE TABLE prodotto (
    IDprodotto INT,
    nomeprodotto VARCHAR(100),
    prezzo DECIMAL(10 , 2 ),
    CONSTRAINT Pk_prodotto PRIMARY KEY (IDprodotto)
);
CREATE TABLE cliente (
    IDcliente INT,
    nome VARCHAR(50),
    mail VARCHAR(100),
    CONSTRAINT Pk_cliente PRIMARY KEY (IDcliente)
);
CREATE TABLE dettaglioordine (
    IDdettaglioordine INT,
    IDcliente INT,
    IDprodotto INT,
    quantità INT,
    CONSTRAINT Pk_dettaglioordine PRIMARY KEY (IDdettaglioordine),
    CONSTRAINT Fk_cliente FOREIGN KEY (IDcliente)
        REFERENCES cliente (IDcliente),
    CONSTRAINT Fk_prodotto FOREIGN KEY (IDprodotto)
        REFERENCES prodotto (IDprodotto)
);
INSERT INTO prodotto VALUES (1, 'Tabelt', 300.00), (2, 'Mouse', 20.00), (3, 'Tastiera', 25.00), (4, 'Monitor', 180.00), (5, 'HHD', 90.00), (6, 'SSD', 200.00), (7, 'RAM', 100.00), (8, 'Router', 80.00), (9, 'Webcam', 45.00), (10, 'GPU', 1250.00), (11, 'Trackpad', 500.00), (12, 'Techmagazine', 5.00), (13, 'Martech', 50.00);
INSERT INTO cliente VALUES (1, 'Antonio', null), (2, 'Battista', 'battista@mailmail.it'), (3, 'Maria', 'maria@posta.it'), (4, 'Franca', 'franca@lettere.it'), (5, 'Ettore', null), (6, 'Arianna', 'arianna@posta.it'), (7, 'Pietro', 'piero@lavoro.it');
INSERT INTO dettaglioordine VALUES (1, 1, 2, 10), (2, 2, 6, 2), (3, 3, 5, 3), (4, 4, 1, 1), (5, 5, 9, 1), (6, 6, 4, 2), (7, 7, 11, 6), (8, 1, 10, 2), (9, 2, 3, 3), (10, 3, 3, 1), (11, 4, 2, 1);
SELECT 
    prodotto.IDprodotto,
    prodotto.nomeprodotto,
    dettaglioordine.IDdettaglioordine,
    prodotto.prezzo,
    dettaglioordine.quantità,
    prodotto.prezzo * dettaglioordine.quantità AS prezzototale
FROM
    dettaglioordine
        JOIN
    prodotto ON dettaglioordine.IDdettaglioordine = prodotto.IDprodotto;
    
