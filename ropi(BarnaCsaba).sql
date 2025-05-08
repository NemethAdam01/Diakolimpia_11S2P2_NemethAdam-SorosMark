-- Adatbázis létrehozása (ha még nem létezik)
CREATE DATABASE IF NOT EXISTS DiakolimpiaRoplabda;
USE DiakolimpiaRoplabda;

-- Táblák létrehozása

-- Csapatok tábla
CREATE TABLE Csapatok (
    CsapatID INT PRIMARY KEY AUTO_INCREMENT,
    CsapatNev VARCHAR(255) NOT NULL UNIQUE,
    Csoport CHAR(1) NOT NULL
);

-- Játékosok tábla
CREATE TABLE Jatekosok (
    JatekosID INT PRIMARY KEY AUTO_INCREMENT,
    CsapatID INT NOT NULL,
    Vezeteknev VARCHAR(255) NOT NULL,
    Keresztnev VARCHAR(255) NOT NULL,
    FOREIGN KEY (CsapatID) REFERENCES Csapatok(CsapatID)
);

-- Edzők tábla
CREATE TABLE Edzok (
    EdzoID INT PRIMARY KEY AUTO_INCREMENT,
    Vezeteknev VARCHAR(255) NOT NULL,
    Keresztnev VARCHAR(255) NOT NULL,
    CsapatID INT,
    FOREIGN KEY (CsapatID) REFERENCES Csapatok(CsapatID)
);

-- Bírák tábla
CREATE TABLE Birak (
    BiroID INT PRIMARY KEY AUTO_INCREMENT,
    Vezeteknev VARCHAR(255) NOT NULL,
    Keresztnev VARCHAR(255) NOT NULL
);

-- Mérkőzések tábla
CREATE TABLE Merkozesek (
    MerkozesID INT PRIMARY KEY AUTO_INCREMENT,
    HazaiCsapatID INT NOT NULL,
    VendegCsapatID INT NOT NULL,
    BiroID INT,
    EredmenyHazai INT,
    EredmenyVendeg INT,
    MerkozesDatum DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (HazaiCsapatID) REFERENCES Csapatok(CsapatID),
    FOREIGN KEY (VendegCsapatID) REFERENCES Csapatok(CsapatID),
    FOREIGN KEY (BiroID) REFERENCES Birak(BiroID)
);

-- Kiállítások tábla
CREATE TABLE KiAllitasok (
    KiAllitasID INT PRIMARY KEY AUTO_INCREMENT,
    JatekosID INT NOT NULL,
    MerkozesID INT NOT NULL,
    KiAllitasIdopont DATETIME,
    Ok VARCHAR(255),
    FOREIGN KEY (JatekosID) REFERENCES Jatekosok(JatekosID),
    FOREIGN KEY (MerkozesID) REFERENCES Merkozesek(MerkozesID)
);

-- Sérülések tábla
CREATE TABLE Serulesek (
    SerulesID INT PRIMARY KEY AUTO_INCREMENT,
    JatekosID INT NOT NULL,
    MerkozesID INT,
    SerulesIdopont DATETIME,
    Leiras VARCHAR(255),
    FOREIGN KEY (JatekosID) REFERENCES Jatekosok(JatekosID),
    FOREIGN KEY (MerkozesID) REFERENCES Merkozesek(MerkozesID)
);

-- Adatok generálása

-- Csapatnevek és csoportok (20 csapat 4 csoportban)
INSERT INTO Csapatok (CsapatNev, Csoport) VALUES
('Kiskunfélegyházi Sasok', 'A'),
('Szegedi Oroszlánok', 'A'),
('Kecskeméti Gepárdok', 'A'),
('Bajai Bikák', 'A'),
('Kalocsai Kócsagok', 'B'),
('Pécsi Párducok', 'B'),
('Szolnoki Sólymok', 'B'),
('Debreceni Delfinek', 'B'),
('Győri Griffek', 'C'),
('Miskolci Mammutok', 'C'),
('Egri Egyszarvúak', 'C'),
('Szombathelyi Skorpiók', 'C'),
('Veszprémi Villámok', 'D'),
('Zalaegerszegi Zebrák', 'D'),
('Soproni Sárkányok', 'D'),
('Kaposvári Kobrák', 'D'),
('Békéscsabai Baglyok', 'A'),
('Hódmezővásárhelyi Hiúzok', 'B'),
('Szentendrei Szitakötők', 'C'),
('Esztergomi Elefántok', 'D');

INSERT INTO Jatekosok (CsapatID, Vezeteknev, Keresztnev) VALUES
(1, 'Nagy', 'István'), (1, 'Kiss', 'László'), (1, 'Horváth', 'József'), (1, 'Szabó', 'Béla'), (1, 'Molnár', 'Zoltán'), (1, 'Varga', 'Sándor'), (1, 'Tóth', 'Ferenc'), (1, 'Papp', 'Gábor'), (1, 'Oláh', 'Attila'), (1, 'Farkas', 'Károly'),
(2, 'Gábor', 'István'), (2, 'Balogh', 'László'), (2, 'Kovács', 'József'), (2, 'Lakatos', 'Béla'), (2, 'Takács', 'Zoltán'), (2, 'Szűcs', 'Sándor'), (2, 'Simon', 'Ferenc'), (2, 'Fehér', 'Gábor'), (2, 'Bíró', 'Attila'), (2, 'Pál', 'Károly'),
(3, 'Nagy', 'Tibor'), (3, 'Kiss', 'András'), (3, 'Horváth', 'Péter'), (3, 'Szabó', 'Tamás'), (3, 'Molnár', 'Mihály'), (3, 'Varga', 'Krisztián'), (3, 'Tóth', 'Norbert'), (3, 'Papp', 'Viktor'), (3, 'Oláh', 'Dávid'), (3, 'Farkas', 'Richárd'),
(4, 'Gábor', 'Tibor'), (4, 'Balogh', 'András'), (4, 'Kovács', 'Péter'), (4, 'Lakatos', 'Tamás'), (4, 'Takács', 'Mihály'), (4, 'Szűcs', 'Krisztián'), (4, 'Simon', 'Norbert'), (4, 'Fehér', 'Viktor'), (4, 'Bíró', 'Dávid'), (4, 'Pál', 'Richárd'),
(5, 'Nagy', 'István'), (5, 'Kiss', 'László'), (5, 'Horváth', 'József'), (5, 'Szabó', 'Béla'), (5, 'Molnár', 'Zoltán'), (5, 'Varga', 'Sándor'), (5, 'Tóth', 'Ferenc'), (5, 'Papp', 'Gábor'), (5, 'Oláh', 'Attila'), (5, 'Farkas', 'Károly'),
(6, 'Gábor', 'István'), (6, 'Balogh', 'László'), (6, 'Kovács', 'József'), (6, 'Lakatos', 'Béla'), (6, 'Takács', 'Zoltán'), (6, 'Szűcs', 'Sándor'), (6, 'Simon', 'Ferenc'), (6, 'Fehér', 'Gábor'), (6, 'Bíró', 'Attila'), (6, 'Pál', 'Károly'),
(7, 'Nagy', 'Tibor'), (7, 'Kiss', 'András'), (7, 'Horváth', 'Péter'), (7, 'Szabó', 'Tamás'), (7, 'Molnár', 'Mihály'), (7, 'Varga', 'Krisztián'), (7, 'Tóth', 'Norbert'), (7, 'Papp', 'Viktor'), (7, 'Oláh', 'Dávid'), (7, 'Farkas', 'Richárd'),
(8, 'Gábor', 'Tibor'), (8, 'Balogh', 'András'), (8, 'Kovács', 'Péter'), (8, 'Lakatos', 'Tamás'), (8, 'Takács', 'Mihály'), (8, 'Szűcs', 'Krisztián'), (8, 'Simon', 'Norbert'), (8, 'Fehér', 'Viktor'), (8, 'Bíró', 'Dávid'), (8, 'Pál', 'Richárd'),
(9, 'Nagy', 'István'), (9, 'Kiss', 'László'), (9, 'Horváth', 'József'), (9, 'Szabó', 'Béla'), (9, 'Molnár', 'Zoltán'), (9, 'Varga', 'Sándor'), (9, 'Tóth', 'Ferenc'), (9, 'Papp', 'Gábor'), (9, 'Oláh', 'Attila'), (9, 'Farkas', 'Károly'),
(10, 'Gábor', 'István'), (10, 'Balogh', 'László'), (10, 'Kovács', 'József'), (10, 'Lakatos', 'Béla'), (10, 'Takács', 'Zoltán'), (10, 'Szűcs', 'Sándor'), (10, 'Simon', 'Ferenc'), (10, 'Fehér', 'Gábor'), (10, 'Bíró', 'Attila'), (10, 'Pál', 'Károly'),
(11, 'Nagy', 'Tibor'), (11, 'Kiss', 'András'), (11, 'Horváth', 'Péter'), (11, 'Szabó', 'Tamás'), (11, 'Molnár', 'Mihály'), (11, 'Varga', 'Krisztián'), (11, 'Tóth', 'Norbert'), (11, 'Papp', 'Viktor'), (11, 'Oláh', 'Dávid'), (11, 'Farkas', 'Richárd'),
(12, 'Gábor', 'Tibor'), (12, 'Balogh', 'András'), (12, 'Kovács', 'Péter'), (12, 'Lakatos', 'Tamás'), (12, 'Takács', 'Mihály'), (12, 'Szűcs', 'Krisztián'), (12, 'Simon', 'Norbert'), (12, 'Fehér', 'Viktor'), (12, 'Bíró', 'Dávid'), (12, 'Pál', 'Richárd'),
(13, 'Nagy', 'István'), (13, 'Kiss', 'László'), (13, 'Horváth', 'József'), (13, 'Szabó', 'Béla'), (13, 'Molnár', 'Zoltán'), (13, 'Varga', 'Sándor'), (13, 'Tóth', 'Ferenc'), (13, 'Papp', 'Gábor'), (13, 'Oláh', 'Attila'), (13, 'Farkas', 'Károly'),
(14, 'Gábor', 'István'), (14, 'Balogh', 'László'), (14, 'Kovács', 'József'), (14, 'Lakatos', 'Béla'), (14, 'Takács', 'Zoltán'), (14, 'Szűcs', 'Sándor'), (14, 'Simon', 'Ferenc'), (14, 'Fehér', 'Gábor'), (14, 'Bíró', 'Attila'), (14, 'Pál', 'Károly'),
(15, 'Nagy', 'Tibor'), (15, 'Kiss', 'András'), (15, 'Horváth', 'Péter'), (15, 'Szabó', 'Tamás'), (15, 'Molnár', 'Mihály'), (15, 'Varga', 'Krisztián'), (15, 'Tóth', 'Norbert'), (15, 'Papp', 'Viktor'), (15, 'Oláh', 'Dávid'), (15, 'Farkas', 'Richárd'),
(16, 'Gábor', 'Tibor'), (16, 'Balogh', 'András'), (16, 'Kovács', 'Péter'), (16, 'Lakatos', 'Tamás'), (16, 'Takács', 'Mihály'), (16, 'Szűcs', 'Krisztián'), (16, 'Simon', 'Norbert'), (16, 'Fehér', 'Viktor'), (16, 'Bíró', 'Dávid'), (16, 'Pál', 'Richárd'),
(17, 'Nagy', 'István'), (17, 'Kiss', 'László'), (17, 'Horváth', 'József'), (17, 'Szabó', 'Béla'), (17, 'Molnár', 'Zoltán'), (17, 'Varga', 'Sándor'), (17, 'Tóth', 'Ferenc'), (17, 'Papp', 'Gábor'), (17, 'Oláh', 'Attila'), (17, 'Farkas', 'Károly'),
(18, 'Gábor', 'István'), (18, 'Balogh', 'László'), (18, 'Kovács', 'József'), (18, 'Lakatos', 'Béla'), (18, 'Takács', 'Zoltán'), (18, 'Szűcs', 'Sándor'), (18, 'Simon', 'Ferenc'), (18, 'Fehér', 'Gábor'), (18, 'Bíró', 'Attila'), (18, 'Pál', 'Károly'),
(19, 'Nagy', 'Tibor'), (19, 'Kiss', 'András'), (19, 'Horváth', 'Péter'), (19, 'Szabó', 'Tamás'), (19, 'Molnár', 'Mihály'), (19, 'Varga', 'Krisztián'), (19, 'Tóth', 'Norbert'), (19, 'Papp', 'Viktor'), (19, 'Oláh', 'Dávid'), (19, 'Farkas', 'Richárd'),
(20, 'Gábor', 'Tibor'), (20, 'Balogh', 'András'), (20, 'Kovács', 'Péter'), (20, 'Lakatos', 'Tamás'), (20, 'Takács', 'Mihály'), (20, 'Szűcs', 'Krisztián'), (20, 'Simon', 'Norbert'), (20, 'Fehér', 'Viktor'), (20, 'Bíró', 'Dávid'), (20, 'Pál', 'Richárd');

-- Edzők (1 férfi edző minden csapathoz)
INSERT INTO Edzok (CsapatID, Vezeteknev, Keresztnev) VALUES
(1, 'Bene', 'Ferenc'),
(2, 'Faragó', 'Tamás'),
(3, 'Nyilasi', 'Tibor'),
(4, 'Kiprich', 'József'),
(5, 'Détári', 'Lajos'),
(6, 'Bognár', 'György'),
(7, 'Garaba', 'Imre'),
(8, 'Róth', 'Antal'),
(9, 'Petry', 'Zsolt'),
(10, 'Disztl', 'Péter'),
(11, 'Lisztes', 'Krisztián'),
(12, 'Dragóner', 'Attila'),
(13, 'Sallói', 'István'),
(14, 'Halmai', 'Gábor'),
(15, 'Fehér', 'Csaba'),
(16, 'Torghelle', 'Sándor'),
(17, 'Huszti', 'Szabolcs'),
(18, 'Gera', 'Zoltán'),
(19, 'Dzsudzsák', 'Balázs'),
(20, 'Szoboszlai', 'Dominik');

-- Bírák (példák)
INSERT INTO Birak (Vezeteknev, Keresztnev) VALUES
('Kassai', 'Viktor'),
('Vad', 'II. István'),
('Bognár', 'Tamás'),
('Solymosi', 'Péter'),
('Erdős', 'József');