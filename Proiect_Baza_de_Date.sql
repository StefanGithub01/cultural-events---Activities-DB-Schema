-- create database Proiect_BD;
use Proiect_BD;

CREATE TABLE studenti (
id int,
nume varchar(100),
prenume varchar(100),
tara varchar(100),
varsta int,
CNP varchar(15),
an_studiu int,
telefon varchar(100),
email varchar(100),
PRIMARY KEY (id)
);

CREATE TABLE Medii (
nume_materie varchar(100),
nota int,
id_student int,
FOREIGN KEY (id_student) REFERENCES studenti(id),
PRIMARY KEY (id_student, nume_materie)
);

CREATE TABLE evenimente (
id int,
locatie_id int,
organizator_id int,
nume varchar(100),
data_eveniment date,
PRIMARY KEY (id),
FOREIGN KEY (locatie_id) REFERENCES locatii(id),
FOREIGN KEY (organizator_id) REFERENCES organizatori(id)
);

CREATE TABLE organizatori (
id int,
nume varchar(100),
prenume varchar(100),
telefon varchar(100),
experienta int,
varsta int,
email varchar(100),
PRIMARY KEY (id)
);

CREATE TABLE locatii (
id int,
tara varchar(100),
judet varchar(100),
oras varchar(100),
strada varchar(100),
cod_postal varchar(100),
PRIMARY KEY (id)
);

CREATE TABLE firme_sponsor (
id int,
denumire varchar(100),
telefon varchar(100),
sponsorizare varchar(100),
tara varchar(100),
email varchar(100),
PRIMARY KEY(id)
);

CREATE TABLE firme_sponsor_evenimente (
firme_sponsor_id int,
evenimente_id int,
PRIMARY KEY (firme_sponsor_id, evenimente_id),
FOREIGN KEY (firme_sponsor_id) REFERENCES firme_sponsor(id),
FOREIGN KEY (evenimente_id) REFERENCES  evenimente(id)
);

CREATE TABLE activitati (
id int,
nume varchar(100),
tip varchar(100),
nr_participanti int,
durata int,
PRIMARY KEY(id)
);

CREATE TABLE evenimente_activitati (
activitati_id int,
evenimente_id int,
PRIMARY KEY(evenimente_id, activitati_id),
FOREIGN KEY(evenimente_id) REFERENCES evenimente(id),
FOREIGN KEY(activitati_id) REFERENCES activitati(id)
);

CREATE TABLE concursuri (
id int,
premiu_loc1 varchar(100),
premiu_loc2 varchar(100),
premiu_loc3 varchar(100),
id_castigator_loc1 int,
id_castigator_loc2 int,
id_castigator_loc3 int,
PRIMARY KEY(id),
FOREIGN KEY(id) REFERENCES activitati(id),
FOREIGN KEY(id_castigator_loc1) REFERENCES studenti(id),
FOREIGN KEY(id_castigator_loc2) REFERENCES studenti(id),
FOREIGN KEY(id_castigator_loc3) REFERENCES studenti(id)
);

CREATE TABLE activitati_artistice (
id int,
nr_spectatori int,
difuzat bool,
PRIMARY KEY(id),
FOREIGN KEY(id) REFERENCES activitati(id)
);

SELECT * FROM studenti;
SELECT * FROM evenimente;
SELECT * FROM organizatori;
SELECT * FROM firme_sponsor;
SELECT * FROM locatii;
SELECT * FROM activitati;
SELECT * FROM concursuri;
SELECT * FROM activitati_artistice;
SELECT * FROM firme_sponsor_evenimente;
SELECT * FROM evenimente_activitati;
SELECT * FROM medii;

INSERT INTO Medii VALUES
('Informatica', 10, 1),
('Matematica', 9, 2),
('Arhitectura', 8, 3),
('Contabilitate', 8, 4),
('Electronica', 10, 5),
('Limba Engleza', 9, 6),
('Limba Franceza', 6, 7),
('Retelistica', 7, 8),
('Structuri de Date', 8, 9),
('Baze de date', 9, 10),
('Lectura', 7, 11),
('Informatica', 9, 12),
('Informatica', 8, 13),
('Informatica', 7, 14),
('Retelistica', 5, 15),
('Arhitectura', 9, 16),
('Contabilitate', 7, 17),
('Arta', 8, 18),
('Sport', 9, 19),
('Sport', 7, 20),
('Sport', 10, 21);

INSERT INTO studenti (id, nume, prenume, tara, medie, varsta, CNP, an_studiu, telefon, email) VALUES
(1, 'Mandris', 'Stefan', 'Romania',10, 21, '5123456789532', 2, '0725876294', 'mandris.stefan.alexandru@gmail.com'),
(2, 'Popescu', 'Alexandra', 'Franta',8.5, 22, '1870608251547', 3, '0721123456', 'alexandra.popescu@gmail.com'),
(3, 'Ionescu', 'Mihai', 'Germania',7.2, 20, '2921103287412', 2, '0734456789', 'mihai.ionescu@yahoo.com'),
(4, 'Georgescu', 'Andrei', 'Olanda', 9.3, 23, '1921210168318', 4, '0745112233', 'andrei.georgescu@hotmail.com'),
(5, 'Popa', 'Ioana', 'Belgia', 6.8, 21, '2911106162581', 2, '0766223344', 'ioana.popa@yahoo.com'),
(6, 'Radu', 'Adrian', 'China',7.9, 22, '1860818123576', 3, '0721334455', 'adrian.radu@gmail.com'),
(7, 'Badea', 'Maria', 'Romania',9.0, 24, '1930528200313', 1, '0751122334', 'maria.badea@yahoo.com'),
(8, 'Dumitrescu', 'George', 'Romania', 8.7, 23, '1910403284712', 4, '0733445566', 'george.dumitrescu@gmail.com'),
(9, 'Nistor', 'Andreea', 'Belgia',6.5, 20, '2940215226851', 2, '0766778899', 'andreea.nistor@hotmail.com'),
(10, 'Stoica', 'Cristina',  'Romania',9.1, 23, '1940708161282', 4, '0722112233', 'cristina.stoica@gmail.com'),
(11, 'Costin', 'Elena', 'Elvetia', 8.3, 22, '2881122258613', 3, '0734556677', 'elena.costin@yahoo.com'),
(12, 'Munteanu', 'Dragos', 'Romania', 7.6, 21, '1930903214844', 3, '0755223344', 'dragos.munteanu@gmail.com'),
(13, 'Balan', 'Diana', 'Romania', 9.4, 24, '1950123127856', 1, '0766334455', 'diana.balan@hotmail.com'),
(14, 'Toma', 'Razvan', 'Romania', 8.8, 23, '1920426162852', 4, '0721223344', 'razvan.toma@yahoo.com'),
(15, 'Lupu', 'Anca', 'Romania', 7.7, 21, '2950314242871', 2, '0734112233', 'anca.lupu@gmail.com'),
(16, 'Iorga', 'Andrei', 'Romania', 8.2, 22, '1870529100313', 3, '0745889900', 'andrei.iorga@yahoo.com'),
(17, 'Neagu', 'Florin', 'Romania', 9.5, 25, '1870904208312', 1, '0766334455', 'florin.neagu@hotmail.com'),
(18, 'Diaconu', 'Gabriel', 'Romania', 6.9, 21, '2930226103123', 2, '0721889900', 'gabriel.diaconu@gmail.com'),
(19, 'Ivan', 'Ana', 'Romania', 8.0, 23, '2890619203087', 3, '0745678901', 'ana.ivan@gmail.com'),
(20, 'Muresan', 'Robert', 'Romania', 9.8, 26, '1860310120871', 1, '0766123456', 'robert.muresan@yahoo.com');

INSERT INTO studenti (id, nume, prenume, tara, medie, varsta, CNP, an_studiu, telefon, email) VALUES
(21, 'Mandris', 'Stefan', 'SUA', 9, 27,  '1860818123577', 4, '0736723456', 'stefan.mandris@gmail.com');

INSERT INTO organizatori (id, nume, prenume, telefon, experienta, varsta, email) VALUES
(1, 'Popescu', 'Alexandru', '0731123456', 2, 25, 'alexandru.popescu@yahoo.com'),
(2, 'Ionescu', 'Mariana', '0744456789', 3, 27, 'mariana.ionescu@gmail.com'),
(3, 'Georgescu', 'Andreea', '0722556677', 4, 30, 'andreea.georgescu@hotmail.com'),
(4, 'Popa', 'Cristian', '0766223344', 1, 23, 'cristian.popa@yahoo.com'),
(5, 'Radu', 'Irina', '0721334455', 2, 24, 'irina.radu@gmail.com'),
(6, 'Badea', 'Marius', '0751122334', 5, 35, 'marius.badea@hotmail.com'),
(7, 'Dumitrescu', 'Anca',' 0733445566', 4, 30, 'anca.dumitrescu@yahoo.com'),
(8, 'Nistor', 'Andrei', '0766778899', 3, 28, 'andrei.nistor@hotmail.com'),
(9, 'Stoica', 'Razvan', '0722112233', 6, 40, 'razvan.stoica@gmail.com'),
(10, 'Costin', 'Elena', '0734556677', 2, 25, 'elena.costin@yahoo.com'),
(11, 'Munteanu', 'Ana', '0755223344', 1, 22, 'ana.munteanu@gmail.com'),
(12, 'Balan', 'Diana', '0766334455', 3, 27, 'diana.balan@hotmail.com'),
(13, 'Toma', 'Mihai', '0721223344', 4, 31, 'mihai.toma@yahoo.com'),
(14, 'Lupu', 'Sorin', '0734112233', 2, 26, 'sorin.lupu@gmail.com'),
(15, 'Iorga', 'Alexandra', '0745889900', 3, 29, 'alexandra.iorga@hotmail.com'),
(16, 'Neagu', 'Vlad', '0766334455', 5, 36, 'vlad.neagu@yahoo.com'),
(17, 'Diaconu', 'Andreea', '0721889900', 1, 23, 'andreea.diaconu@gmail.com'),
(18, 'Pavel', 'Adrian', '0732445566', 2, 25, 'adrian.pavel@yahoo.com'),
(19, 'Florescu', 'Mirela', '0765223344', 4, 32, 'mirela.florescu@gmail.com'),
(20, 'Chiriac', 'Radu', '0744889900', 3, 28, 'radu.chiriac@hotmail.com');



INSERT INTO evenimente (id, locatie_id, organizator_id, nume, data_eveniment)
VALUES 
(1, 1, 1, 'Ziua Artei', '2022-04-20'),
(2, 2, 2, 'Aniversarea Limbii Engleze', '2022-06-05'),
(3, 3, 3, 'Festivalul Muzicii', '2022-07-10'),
(4, 4, 4, 'Saptamana Stiintei si Inovarii', '2022-08-15'),
(5, 5, 5, 'Expozitie de Arta Moderna', '2022-09-25'),
(6, 6, 6, 'Conferinta de Psihologie', '2021-10-05'),
(7, 7, 7, 'Dezbateri Politice', '2020-11-20'),
(8, 8, 8, 'Spectacol de Teatru', '2021-12-10'),
(9, 9, 9, 'Expozitie de Istorie', '2022-01-15'),
(10, 10, 10, 'Dezvoltare Personala', '2020-02-05'),
(11, 11, 1, 'Ziua Matematicii', '2021-03-10'),
(12, 12, 2, 'Festivalul Poeziei', '2022-04-20'),
(13, 13, 3, 'Ziua Informaticii', '2021-05-05'),
(14, 14, 4, 'Expozitie de Stiinta', '2022-06-15'),
(15, 15, 5, 'Spectacol de Dans', '2020-07-10'),
(16, 16, 6, 'Ziua programatorilor', '2021-08-20'),
(17, 17, 7, 'Ziua Culturii', '2020-09-05'),
(18, 18, 8, 'Saptamana Francofoniei', '2021-10-15'),
(19, 19, 9, 'Festivalul de Film', '2022-11-25'),
(20, 20, 10, 'Conferinta de Drept', '2020-12-05');

INSERT INTO evenimente_activitati VALUES 
(1, 5),
(2, 2),
(3, 18),
(4, 19),
(5, 20),
(6, 15),
(7, 10),
(8, 11),
(9, 9),
(10, 12);

INSERT INTO activitati VALUES
(1, 'Performance Live Artisti', 'exterior', 5, 60),
(2, 'Vizionare Documentar despre Istoria Limbii Engleze', 'exterior', 7, 120),
(3, 'Concert Trupe Franceze', 'interior', 10 , 180 ),
(4, 'Difuzare Top 10 Filme Populare ', 'interior', 12, 60 ),
(5, 'Cursuri Desen', 'interior', 5, 120 ),
(6, 'Dansuri tema traditionala', 'exterior', 7, 120 ),
(7, 'Technici de Public Speaking', 'interior', 6, 60 ),
(8, 'Cursuri de Pictura ', 'interior', 5, 180 ),
(9, 'Istoria Invatamantului Documentar', 'interior', 13, 240 ),
(10, 'Compuneri Poezii', 'exterior', 3, 300 ),
(11, 'Concursul de matematica', 'interior', 10, 60),
(12, 'Concursul de chimie', 'interior', 12, 50),
(13, 'Concursul de fizica', 'interior', 9, 60),
(14, 'Concursul de biologie', 'interior', 12, 30),
(15, 'Concursul de istorie', 'interior', 15, 60),
(16, 'Concursul de literatura', 'interior', 15, 70),
(17, 'Concursul de limba engleza', 'interior', 5, 60),
(18, 'Concursul de informatica', 'interior', 18, 90),
(19, 'Concursul de inteligenta', 'exterior', 14, 120),
(20, 'Concursul de dezbatere', 'exterior', 16, 60);

INSERT INTO activitati_artistice VALUES
(1, 10, 1),
(2, 15, 0),
(3, 7, 1),
(4, 9, 0),
(5, 12, 0),
(6, 5, 1),
(7, 13, 1),
(8, 19, 0),
(9, 17, 1),
(10, 20, 1);

INSERT INTO locatii (id, tara, judet, oras, strada, cod_postal) VALUES
(1, 'Romania', 'Bucuresti', 'Bucuresti', 'Calea Victoriei 141', '010071'),
(2, 'Romania', 'Cluj', 'Cluj-Napoca', 'Strada Plopilor 23', '400000'),
(3, 'Romania', 'Brasov', 'Brasov', 'Strada Muresenilor 7', '500006'),
(4, 'Romania', 'Timis', 'Timisoara', 'Bulevardul Take Ionescu 6', '300122'),
(5, 'Romania', 'Iasi', 'Iasi', 'Strada Sf. Sava 22', '700505'),
(6, 'Germania', 'Berlin', 'Berlin', 'Friedrichstraße 205', '10117'),
(7, 'Germania', 'Munchen', 'Munchen', 'Marienplatz 1', '80331'),
(8, 'Germania', 'Hamburg', 'Hamburg', 'Reeperbahn 140', '20359'),
(9, 'Franta', 'Paris', 'Paris', 'Avenue des Champs-Élysées 15', '75008'),
(10, 'Franta', 'Lyon', 'Lyon', 'Place Bellecour', '69002'),
(11, 'Franta', 'Nice', 'Nice', 'Promenade des Anglais', '06000'),
(12, 'Spania', 'Madrid', 'Barajas', 'Calle de Bahía de Palma, 20', '28042'),
(13, 'Franta', 'Paris', 'Levallois-Perret', '33 Rue Baudin', '92300'),
(14, 'Italia', 'Roma', 'Pigneto', 'Via del Pigneto, 30', '00176'),
(15, 'Germania', 'Berlin', 'Mitte', 'Unter den Linden 77', '10117'),
(16, 'Olanda', 'Amsterdam', 'Jordaan', 'Lijnbaansgracht 238', '1017 PH'),
(17,'Belgia', 'Bruxelles', 'Ixelles', 'Rue Lesbroussart 62', '1050'),
(18, 'Suedia', 'Stockholm', 'Södermalm', 'Söder Mälarstrand 29', '11825'),
(19, 'Grecia', 'Atena', 'Kerameikos', 'Ermou 64', '10563'),
(20, 'Portugalia', 'Lisabona', 'Bairro Alto', 'Travessa dos Fiéis de Deus 8', '1200-178');

INSERT INTO concursuri (id,premiu_loc1, premiu_loc2, premiu_loc3, id_castigator_loc1, id_castigator_loc2, id_castigator_loc3) VALUES
(11, '1000 lei', '500 lei', '200 lei', 3, 4, 5),
(12, '1200 lei', '700 lei', '300 lei', 7, 9, 10),
(13, '1500 lei', '800 lei', '400 lei', 2, 4, 6),
(14, '800 lei', '400 lei', '200 lei', 12, 14, 16),
(15, '1000 lei', '500 lei', '300 lei', 19, 18, 17),
(16, '1200 lei', '700 lei', '400 lei', 11, 10, 12),
(17, '1500 lei', '800 lei', '500 lei', 1, 4, 6),
(18, '2000 lei', '1000 lei', '700 lei', 1, 7, 13),
(19, '800 lei', '400 lei', '200 lei', 3, 5, 9),
(20, '1500 lei', '1300 lei', '1000 lei', 21, 4, 3);



INSERT INTO firme_sponsor (id, denumire, telefon, sponsorizare, tara, email) VALUES (1, 'Timbark', '0745789456', 'Bauturi', 'Polonia', 'timbark@company.com');
INSERT INTO firme_sponsor (id, denumire, telefon, sponsorizare, tara, email) VALUES (2, 'Apple', '0767323456', 'Telefoane', 'SUA', 'apple@corp.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (3, 'LG', '0724456789', 'Televizoare', 'Coreea de Sud', 'LG@abccorp.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (4, 'Google', '0739786245', 'Financiar', 'SUA', 'google@definc.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (5, 'Microsoft', '0789900123', 'Laptop-uri', 'SUA', 'microsoft@corp.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (6, 'Coca-Cola', '0776850932', 'Bauturi', 'Georgia', 'coca-cola@jklholdings.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (7, 'Duolingo', '0723434665', 'Cursuri Gratuie Engleza', 'SUA', 'duolingo@enterprises.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (8, 'Lenovo', '0745672398', 'Dispozitive Electrice', 'China', 'lenovo@pqrindustries.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (9, 'Oracle', '0738876543', 'Financiar', 'SUA', 'oracle@stuinc.com');
INSERT INTO firme_sponsor (id, denumire, telefon, sponsorizare, tara, email) VALUES (10, 'Samsung', '0765432123', 'Dispozitive Electrice', 'Coreea de Sud', 'samsung@corp.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (11, 'Orange', '0781223456', 'Abonamente gratuite telefon', 'Franta', 'orange@company.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (12, 'RadioZu', '0720879123', 'Artisti', 'Romania', 'radio_zu@corp.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (13, 'Lidl', '0741029384', 'Financiar', 'Germania', 'Lidl@abccorp.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (14, 'Kaufland', '0765432198', 'Festivaluri', 'Germania', 'Kaufland@definc.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (15, 'BRD', '0778463729', 'Financiar', 'Romania', 'BRD@gmail.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (16, 'OnePlus', '0722345678', 'Telefoane', 'China', 'oneplus@gmail.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (17, 'Altex', '0739518476', 'Dispoztive Electrice', 'Romania', 'altex@gmail.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (18, 'UPG', '0784237894', 'Cursuri gratuite', 'Romania', 'UPG@gmail.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (19, 'DHS', '0760987654', 'Biciclete', 'Romania', 'DHS@gmail.com');
INSERT INTO firme_sponsor (id,denumire, telefon, sponsorizare, tara, email) VALUES (20, 'Adobe', '0728123456', 'Licenta aplicatii gratuite', 'Romania', 'adobe@gmail.com');

INSERT INTO firme_sponsor_evenimente( firme_sponsor_id, evenimente_id) VALUES
(1, 2),
(2,4),
(3,6),
(4,8),
(5,9),
(10, 12),
(6, 13),
(7, 19),
(8, 4),
(11, 14),
(12, 7),
(15, 17),
(13, 16),
(16, 18),
(17, 20),
(20, 3),
(18, 11),
(19, 1);

-- REUNIUNEA


SELECT tara from locatii
union
select tara from firme_sponsor;


-- DIFERENTA

SELECT studenti.nume, studenti.prenume FROM STUDENTI
WHERE studenti.tara NOT IN 
(SELECT tara FROM evenimente e JOIN locatii L ON e.locatie_id = L.id);



-- Interogatie 3 - Sa se afiseze toate datele din tabelul organizatori unde experienta organizatorului este mai mare de 1 an si varsta este mai mare de 30 de ani.
SELECT * FROM ORGANIZATORI
WHERE experienta > 1 AND varsta > 30;

-- Interogatie 4 - Sa se afiseze numele si prenumele distince ale studentilor care au iesit pe locul 1 la concursurile cu nr de participanti mai multi decat 12 ordonati crescator alfabetic

SELECT DISTINCT nume, prenume FROM STUDENTI 
WHERE id IN (SELECT id_castigator_loc1 FROM CONCURSURI c
JOIN activitati a ON a.id = c.id WHERE a.nr_participanti > 12)
ORDER BY nume, prenume;

-- Interogatie 5 - Sa se afiseze denumirea si sponsorizarea a firmei suport ce sponsorizeaza evenimentele din orasul Bucuresti.

SELECT denumire, sponsorizare
FROM firme_sponsor f
JOIN firme_sponsor_evenimente fse ON f.id = fse.firme_sponsor_id
JOIN evenimente e ON fse.evenimente_id = e.id
JOIN locatii l ON e.locatie_id = l.id
WHERE l.oras = 'Bucuresti';








