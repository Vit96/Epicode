
create database esercizio_finale_SQL;

use esercizio_finale_SQL;





---------------------------------------------------------------------------------------------------------------- Creazione delle Tabelle

CREATE TABLE Nutrizionisti(
    ID_nutrizionista        VARCHAR (255),
    Nome_nutrizionista      VARCHAR (255) NOT NULL,
    Cognome_nutrizionista   VARCHAR(255) NOT NULL,
    Sesso_nutrizionista     VARCHAR(255) NOT NULL,
    Età_nutrizionista       INT NOT NULL,
    Città_nutrizionista     VARCHAR(255) NOT NULL,
    Indirizzo_nutrizionista VARCHAR(255) NOT NULL,
    

		PRIMARY KEY (ID_nutrizionista)
);





CREATE TABLE Personal_trainer(
    ID_personal_trainer         VARCHAR(255),
    Nome_personal_trainer       VARCHAR(255) NOT NULL,
    Cognome_personal_trainer    VARCHAR(255) NOT NULL,
    Sesso_personal_trainer      VARCHAR(255) NOT NULL,
    Età_personal_trainer        INT NOT NULL,
    Città_personal_trainer      VARCHAR(255) NOT NULL,
    Indirizzo_personal_trainer  VARCHAR(255) NOT NULL,


		PRIMARY KEY (ID_personal_trainer)
);





CREATE TABLE Clienti(
    ID_cliente                  VARCHAR(255),
    ID_nutrizionista            VARCHAR(255) NOT NULL,
    ID_personal_trainer         VARCHAR(255) NOT NULL,
    Nome_cliente                VARCHAR(255) NOT NULL,
    Cognome_cliente             VARCHAR(255) NOT NULL,
    Città_cliente               VARCHAR(255) NOT NULL,
    Indirizzo_cliente           VARCHAR(255) NOT NULL,
    Sesso_cliente               VARCHAR(255) NOT NULL,
    Età_cliente                 INT NOT NULL,
    Peso_cliente                DECIMAL(5, 2) NOT NULL,
    Percentuale_massa_grassa    DECIMAL(5, 2) NOT NULL,
    Percentuale_massa_magra     DECIMAL(5, 2) NOT NULL,


		PRIMARY KEY (ID_cliente),
        CONSTRAINT FK_ID_nutrizionista_Nutrizionisti_Clienti FOREIGN KEY (ID_nutrizionista) REFERENCES Nutrizionisti(ID_nutrizionista),
		CONSTRAINT FK_ID_personal_trainer_Personal_trainer_Clienti FOREIGN KEY (ID_personal_trainer) REFERENCES Personal_trainer(ID_personal_trainer) on update cascade on delete no action
);





CREATE TABLE Piano_alimentare(
    Codice_piano_alimentare     VARCHAR(255),
    ID_cliente                  VARCHAR(255),
    ID_nutrizionista            VARCHAR(255),
    Dieta                       VARCHAR(255),


        PRIMARY KEY (Codice_piano_alimentare),
        CONSTRAINT FK_ID_cliente_Clienti_Piano_alimentare FOREIGN KEY (ID_cliente) REFERENCES Clienti(ID_cliente) on update cascade on delete no action,
        CONSTRAINT FK_ID_nutrizionista_Nutrizionisti_Piano_alimentare FOREIGN KEY (ID_nutrizionista) REFERENCES Nutrizionisti(ID_nutrizionista) on update cascade on delete no action
);






CREATE TABLE Programma_di_allenamento(
    Codice_programma_di_allenamento     VARCHAR(255),
    ID_cliente                          VARCHAR(255),
    ID_personal_trainer                 VARCHAR(255),
    Esercizi                            VARCHAR(255),


        PRIMARY KEY (Codice_programma_di_allenamento),
        CONSTRAINT FK_ID_cliente_Clienti_Programma_di_allenamento FOREIGN KEY (ID_cliente) REFERENCES Clienti(ID_cliente) on update cascade on delete no action,
        CONSTRAINT FK_ID_personal_trainer_Personal_trainer_Programma_di_allenamento FOREIGN KEY (ID_personal_trainer) REFERENCES Personal_trainer(ID_personal_trainer) on update cascade on delete no action
);






PER COMODITÁ
-- Al posto delle DIETE, mi limiterò a definire l'obiettivo di ogni tipo di dieta (aumento massa muscolare/dimagrimento/aumento forza)
-- Al posto dei PROGRAMMMI, scriverò un esercizio standard ('panca piana 4x12')







---------------------------------------------------------------------------------------------------------------- Inserimento dei valori nelle tabelle

INSERT INTO Nutrizionisti (ID_nutrizionista, Nome_nutrizionista, Cognome_nutrizionista, Sesso_nutrizionista, Età_nutrizionista, Città_nutrizionista, Indirizzo_nutrizionista)
VALUES

    ('N0001',   'Luca',       'Verdi',      'M',    42,     'Napoli',   'Via Napoli 7'  ),
    ('N0002',   'Laura',      'Esposito',   'F',    30,     'Firenze',  'Via Firenze 23'),
    ('N0003',   'Francesco',  'Russo',      'M',    50,     'Venezia',  'Via Venezia 12'),
    ('N0004',   'Sofia',      'Romano',     'F',    23,     'Torino',   'Via Torino 5'  ),
    ('N0005',   'Luigi',      'Barbieri',   'M',    38,     'Genova',   'Via Genova 34' ),
    ('N0006',   'Chiara',     'Marchi',     'F',    29,     'Bologna',  'Via Bologna 9' ),
    ('N0007',   'Antonio',    'Gentile',    'M',    45,     'Palermo',  'Via Palermo 67');



INSERT INTO Personal_trainer (ID_personal_trainer, Nome_personal_trainer, Cognome_personal_trainer, Sesso_personal_trainer, Età_personal_trainer, Città_personal_trainer, Indirizzo_personal_trainer)
VALUES

    ('PT0001',  'Elisa',    'Russo',        'F',    34,     'Varese',   'Via Varese 11' ),
    ('PT0002',  'Roberto',  'Pellegrini',   'M',    44,     'Palermo',  'Via Palermo 76'),
    ('PT0003',  'Elena',    'Bernardi',     'F',    29,     'Pavia',    'Via Pavia 5'   ),
    ('PT0004',  'Giovanni', 'Martini',      'M',    36,     'Roma',     'Via Roma 18'   ),
    ('PT0005',  'Sofia',    'Galli',        'F',    24,     'Torino',   'Via Torino 29' ),
    ('PT0006',  'Luca',     'Ferrari',      'M',    43,     'Milano',   'Via Milano 6'  ),
    ('PT0007',  'Chiara',   'Rinaldi',      'F',    28,     'Napoli',   'Via Napoli 12' ),
    ('PT0008',  'Alessio',  'Bellini',      'M',    37,     'Firenze',  'Via Firenze 87');




INSERT INTO Clienti (ID_cliente, ID_nutrizionista, ID_personal_trainer, Nome_cliente, Cognome_cliente, Città_cliente, Indirizzo_cliente, Sesso_cliente, Età_cliente, Peso_cliente, Percentuale_massa_grassa, Percentuale_massa_magra)
VALUES

	('C0001',  'N0005', 'PT0008',   'Maria',    'Rossi',    'Roma',    'Via Roma 1',       'F',     35, 80.5, 20.5, 60.0),
    ('C0002',  'N0002', 'PT0003',   'Andrea',   'Bianchi',  'Milano',  'Via Milano 15',    'M',     28, 75.2, 20.0, 80.0),
    ('C0003',  'N0006', 'PT0005',   'Luca',     'Verdi',    'Napoli',  'Via Napoli 7',     'M',     42, 80.0, 30.0, 70.0),
    ('C0004',  'N0007', 'PT0006',   'Sara',     'Mancini',  'Roma',    'Via Firenze 23',   'F',     30, 55.8, 22.5, 77.5),
    ('C0005',  'N0004', 'PT0002',   'Marco',    'Ferrara',  'Milano',  'Via Venezia 12',   'M',     50, 73.7, 26.5, 73.5),
    ('C0006',  'N0001', 'PT0001',   'Sofia',    'Romano',   'Napoli',  'Via Torino 5',     'F',     23, 55.0, 23.0, 77.0),
    ('C0007',  'N0005', 'PT0004',   'Luigi',    'Barbieri', 'Roma',    'Via Genova 34',    'M',     38, 72.3, 28.0, 72.0),
    ('C0008',  'N0007', 'PT0008',   'Chiara',   'Marchi',   'Milano',  'Via Bologna 9',    'F',     29, 68.0, 25.0, 75.0),
    ('C0009',  'N0006', 'PT0003',   'Antonio',  'Gentile',  'Napoli',  'Via Palermo 67',   'M',     45, 82.1, 31.0, 69.0),
    ('C0010',  'N0002', 'PT0005',   'Elena',    'Ricci',    'Roma',    'Via Catania 21',   'F',     33, 65.4, 26.8, 73.2);
    




INSERT INTO Piano_alimentare (Codice_piano_alimentare, ID_cliente, ID_nutrizionista, Dieta)
VALUES

    ('PA0001', 'C0001', 'N0005',    'aumento massa muscolare'   ),
    ('PA0002', 'C0002', 'N0002',    'aumento forza'             ),
    ('PA0003', 'C0003', 'N0006',    'dimagrimento'              ),
    ('PA0004', 'C0004', 'N0007',    'aumento forza'             ),
    ('PA0005', 'C0005', 'N0004',    'aumento massa muscolare'   ),
    ('PA0006', 'C0006', 'N0001',    'aumento massa muscolare'   ),
    ('PA0007', 'C0007', 'N0005',    'dimagrimento'              ),
    ('PA0008', 'C0008', 'N0007',    'aumento massa muscolare'   ),
    ('PA0009', 'C0009', 'N0006',    'aumento massa muscolare'   ),
    ('PA0010', 'C0010', 'N0002',    'aumento forza'             );





INSERT INTO Programma_di_allenamento (Codice_programma_di_allenamento, ID_cliente, ID_personal_trainer, Esercizi)
VALUES

    ('PP0001', 'C0001', 'PT0008',   'panca piana 4x12'  ), 
    ('PP0002', 'C0002', 'PT0003',   'panca piana 4x12'  ),
    ('PP0003', 'C0003', 'PT0005',   'panca piana 4x12'  ),
    ('PP0004', 'C0004', 'PT0006',   'panca piana 4x12'  ),
    ('PP0005', 'C0005', 'PT0002',   'panca piana 4x12'  ),
    ('PP0006', 'C0006', 'PT0001',   'panca piana 4x12'  ),
    ('PP0007', 'C0007', 'PT0004',   'panca piana 4x12'  ),
    ('PP0008', 'C0008', 'PT0008',   'panca piana 4x12'  ),
    ('PP0009', 'C0009', 'PT0003',   'panca piana 4x12'  ),
    ('PP0010', 'C0010', 'PT0005',   'panca piana 4x12'  );       












-------------------------------------------------------------------------------------------------------------------------------- QUERY




-- selezionare tutti i clienti che hanno un'età compresa tra i 25 e 30 anni
SELECT * FROM Clienti WHERE (Età_cliente BETWEEN 25 AND 30)




-- selezionare tutti i clienti il cui cognome inizia per P
SELECT * FROM Clienti WHERE Cognome_cliente LIKE 'B%'




-- visualizzare nome e cognome di chi vive a roma ed ha meno di 30 anni
SELECT Nome_cliente, Cognome_cliente FROM Clienti WHERE Città_cliente = 'Milano' AND Età_cliente < 30



-- contare il numero totale di clienti
SELECT COUNT(*) AS ID_cliente FROM Clienti



-- selezionare tutti i clienti ed ordinarli prima per nome, poi per cognome come sottordinamento
SELECT * FROM Clienti ORDER BY Nome_cliente ASC, Cognome_cliente DESC



-- scegliere un personal trainer e vedere i clienti che ha
SELECT 
    Clienti.ID_personal_trainer,
    Clienti.ID_cliente,
    Clienti.Nome_cliente,
    Clienti.Cognome_cliente
FROM 
    Clienti
ORDER BY Clienti.ID_personal_trainer



-- scegliere un personal trainer e vedere i clienti che ha sopra i 25 anni
SELECT 
    Clienti.ID_personal_trainer,
    Clienti.ID_cliente,
    Clienti.Nome_cliente,
    Clienti.Cognome_cliente
FROM
    Clienti
where Clienti.Età_cliente > 25
ORDER BY Clienti.ID_personal_trainer



-- scegliere e vedere chi gli ha fatto il programma
SELECT 
    Clienti.ID_cliente,
    Clienti.Nome_cliente,
    Clienti.Cognome_cliente,
    Personal_trainer.ID_personal_trainer,
    Personal_trainer.Nome_personal_trainer,
    Personal_trainer.Cognome_personal_trainer
FROM    
    Clienti
INNER JOIN Programma_di_allenamento on Clienti.ID_cliente = Programma_di_allenamento.ID_cliente
INNER JOIN Personal_trainer on Programma_di_allenamento.ID_personal_trainer = Personal_trainer.ID_personal_trainer
GROUP BY Clienti.ID_cliente



-- selezionare tutti i maschi che sono in dimagrimento che pesano sopra i 70 kg
SELECT Nome_cliente, Cognome_cliente, Peso_cliente, Dieta FROM Clienti JOIN Piano_alimentare ON  Clienti.Peso_cliente > 70 AND Piano_alimentare.Dieta = 'dimagrimento'


-- fare una media dell'età dei clienti
SELECT AVG (Età_cliente) FROM Clienti