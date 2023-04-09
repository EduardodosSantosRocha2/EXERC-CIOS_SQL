CREATE TABLE Peça(
	PNum int Primary KEY,
	PNome varchar,
	Cor varchar,
	Peso real,
	Cidade varchar
);


CREATE TABLE Forn(
	FNum int PRIMARY KEY, 
	FNome varchar, 
	Status varchar, 
	Cidade varchar
);

CREATE TABLE Fornece(
	FNum int, 
	PNum int, 
	Preço real
);

ALTER TABLE Fornece ADD CONSTRAINT FK_Fnum_Pnum FOREIGN KEY (PNum) REFERENCES Peça(PNum) 
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Fornece ADD CONSTRAINT FK_Fnum_Pnum1 FOREIGN KEY (FNum) REFERENCES Forn(FNum) 
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Fornece ADD CONSTRAINT PK_Fnum_Pnum1 PRIMARY KEY (PNum,FNum);

ALTER TABLE Peça ALTER COLUMN Peso TYPE double precision;

-- INSERT INTO Peça
INSERT INTO Peça VALUES(1,'Mola','preto',2.345,'Monte Carmelo');
INSERT INTO Peça VALUES(2,'Motor','preto',145.867,'Hong Kong');
INSERT INTO Peça VALUES(3,'Capo','prata',15.767,'Quioto');
INSERT INTO Peça VALUES(4,'Neon','verde',45.26,'Osaka');
INSERT INTO Peça VALUES(5,'Janela','transparente',145.867,'Hiroshima');
INSERT INTO Peça VALUES(6,'Motor_RX7','Laranja',85.87,'Toquio');

-- INSERT INTO Forn
INSERT INTO Forn VALUES(1,'Aston Martin Aramco Cognizant','exclusividade', 'Xangai');
INSERT INTO Forn VALUES(2,'Aston Martin Aramco Cognizant','Não exclusividade', 'Xangai');
INSERT INTO Forn VALUES(3,'Ferrari','exclusividade', 'Pequim');
INSERT INTO Forn VALUES(4,'Mazda','Não exclusividade', 'Cantão');
INSERT INTO Forn VALUES(5,'Alfa Romeo','exclusividade', 'Shenzhen');

-- INSERT INTO Fornece
INSERT INTO Fornece VALUES(1,1,1235.55);

INSERT INTO Fornece VALUES(2,3,135.85);

INSERT INTO Fornece VALUES(3,2,415.43);

INSERT INTO Fornece VALUES(4,5,2135.27);

INSERT INTO Fornece VALUES(5,4,4565.32);

INSERT INTO Fornece VALUES(1,2,5355.42);





