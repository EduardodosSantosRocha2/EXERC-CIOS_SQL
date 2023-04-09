CREATE TABLE Aeroporto(
	Cod int PRIMARY KEY, 
	Nome text, 
	Local_A text , 
	Pais text
);


CREATE TABLE Modelo (
	Cod text PRIMARY KEY, 
	Construtor text, 
 	Versao text, 
 	NumMotores int
);

CREATE TABLE Avioes (
	Cod int PRIMARY KEY, 
	Nome text, 
	CodModelo text
);

CREATE TABLE Voo (
	Cod int PRIMARY KEY, 
	De_CodAerop int, 
	Para_CodAerop int, 
	Transportadora text, 
	Duracao int, 
	CodAviao int
);

ALTER TABLE Avioes ADD CONSTRAINT fk_CodModelo FOREIGN KEY (CodModelo) REFERENCES Modelo(Cod);

ALTER TABLE Voo ADD CONSTRAINT fk_CodAviao FOREIGN KEY (CodAviao) REFERENCES Avioes(Cod);

ALTER TABLE Voo ADD CONSTRAINT fk_De_CodAerop FOREIGN KEY (De_CodAerop) REFERENCES Aeroporto(Cod);

ALTER TABLE Voo ADD CONSTRAINT fk_Para_CodAerop FOREIGN KEY (Para_CodAerop) REFERENCES Aeroporto(Cod);

-- INSERT INTO Aeroporto
INSERT INTO Aeroporto VALUES (1,'GreenApple Aeroporto','NV','Estados Unidos');

INSERT INTO Aeroporto VALUES (2,'Champanhe Aeroporto','KS','Polynesia');

INSERT INTO Aeroporto VALUES (3,'Pebble Aeroporto','WY','San Marino');

INSERT INTO Aeroporto VALUES (4,'Elementos Aeroporto','VT','Polynesia');

INSERT INTO Aeroporto VALUES (5,'Fronteira Aeroporto','UT','Polynesia');

INSERT INTO Aeroporto VALUES (6,'Cadência Aeroporto','MO','Polynesia');

INSERT INTO Aeroporto VALUES (7,'Marketplace Aeroporto','TX','Polynesia');

INSERT INTO Aeroporto VALUES (8,'Aeroporto Híbrido','NC','Polynesia');

INSERT INTO Aeroporto VALUES (9,'Aeroporto Frente','TN','Polynesia');

INSERT INTO Aeroporto VALUES (10,'Aeroporto Loft','ID','Polynesia');

INSERT INTO Aeroporto VALUES (11,'Strike Aeroporto','NV','Estados Unidos');

INSERT INTO Aeroporto VALUES (12,'Atr Aeroporto','NV','Estados Unidos');

INSERT INTO Aeroporto VALUES (13,'AtrBR','BR','Brasil');

INSERT INTO Aeroporto VALUES (14,'VCTBR','RJ','Brasil');

-- INSERT INTO Modelo

INSERT INTO Modelo VALUES('1-A','Leann','Airbus Beluga',2);

INSERT INTO Modelo VALUES('1-B','Teunn','Airbus A380',3);

INSERT INTO Modelo VALUES('1-C','Leann',' Airbus A340-600',4);

INSERT INTO Modelo VALUES('1-D','Vitar','Antonov An-22',2);

INSERT INTO Modelo VALUES('1-E','Ancay','Antonov An-225',1);

INSERT INTO Modelo VALUES('1-F','Vyon','Beriev Be-2500',5);

INSERT INTO Modelo VALUES('1-G','Woubu','Boeing XB-15',7);

INSERT INTO Modelo VALUES('1-H','Teyfu','Boeing B-29 Superfortress',7);

INSERT INTO Modelo VALUES('1-I','Olvi','Caproni Ca.60',2);

INSERT INTO Modelo VALUES('1-J','Fohyus','14-bis',2);

-- INSERT INTO Avioes;
INSERT INTO Avioes VALUES(1,'Tiarbor','1-A');

INSERT INTO Avioes VALUES(2,'Anpiulas','1-B');

INSERT INTO Avioes VALUES(3,'Usron','1-C');

INSERT INTO Avioes VALUES(4,'Buadan','1-D');

INSERT INTO Avioes VALUES(5,'Hugieadar','1-E');

INSERT INTO Avioes VALUES(6,'Dagrandir','1-F');

INSERT INTO Avioes VALUES(7,'Fuboron','1-G');

INSERT INTO Avioes VALUES(8,'Fianadar','1-H');

INSERT INTO Avioes VALUES(9,'Tarwu','1-I');

INSERT INTO Avioes VALUES(10,'Pedourion','1-J');

-- INSERT INTO Voo

INSERT INTO Voo VALUES(3,1,2,'Orin',2,1);

INSERT INTO Voo VALUES(2,1,5,'Baziand',3,2);

INSERT INTO Voo VALUES(1,2,5,'Foand',2,3);

INSERT INTO Voo VALUES(4,3,2,'Reiboy',4,4);

INSERT INTO Voo VALUES(5,6,7,'Valmagen',5,5);

INSERT INTO Voo VALUES(6,4,7,'Lasuauk',160,6);

INSERT INTO Voo VALUES(7,9,10,'Veumeyric',10,7);

INSERT INTO Voo VALUES(8,10,9,'Vethal',3,8);

INSERT INTO Voo VALUES(9,1,4,'Meousir',1,9);

INSERT INTO Voo VALUES(10,2,8,'Kirid',7,10);

INSERT INTO Voo VALUES(11,02,12,'Kiri',7,10);

INSERT INTO Voo VALUES(12,13,14,'Kit',8,10);

ALTER TABLE Modelo RENAME COLUMN Cod_M TO Cod;


-- EX1

CREATE VIEW V15 AS
SELECT A.Cod AS COD_A, M.Cod AS Cod_M
	FROM Aeroporto AS A,Modelo AS M
	

SELECT COD_A, COD_M FROM V15
	
	
SELECT * FROM V7;	

INSERT INTO V7 VALUES('GreenApple Aeroporto');

DELETE V7

-- EX2

CREATE VIEW V1 AS

SELECT A.Nome
	FROM Avioes AS A 
					WHERE CodModelo 
									IN(
											SELECT Cod
													FROM Modelo
															WHERE Versao ='14-bis');


-- SELECT v1.Nome FROM V1 WHERE V1.Nome <>'Pedourion';

SELECT v1.Nome FROM V1;


UPDATE V1 SET Nome = 'Josefino' WHERE V1.Nome  = 'Pedourion'


DROP VIEW V1;
 




-- EX3 
SELECT A.Nome,M.NumMotores
	FROM Avioes AS A, Modelo AS M 
		WHERE A.CodModelo = M.Cod;
	
-- EX4
	
SELECT count(Duracao) AS DURACAO
	FROM Voo 
		WHERE Duracao = 2 OR Duracao = 3 ;
		
-- EX5
	SELECT Versao FROM Modelo WHERE Versao LIKE 'Airbus A380%'
	
	
-- EX6

CREATE VIEW V2 AS

		SELECT 	Cod,Duracao 
			FROM Voo 
				ORDER BY Duracao DESC, Cod ASC;


SELECT Cod, Duracao FROM V2;

SELECT Cod, Duracao FROM V2 ORDER BY Duracao ASC, Cod DESC;





-- EX7
CREATE VIEW V9 AS
		SELECT 	A.De_CodAerop, B.Para_CodAerop
					FROM Voo AS A, Voo AS B 
						WHERE A.de_codaerop = 1
							AND B.para_codaerop = 12
 								AND A.para_codaerop = B.de_codaerop;
								
SELECT para_codaerop FROM V9			

-- EX8
 CREATE VIEW V3 AS
	SELECT Pais,COUNT (Pais) AS total_pais
		FROM Aeroporto
			GROUP BY Pais ORDER BY COUNT (Pais) DESC;
			
 SELECT Pais,total_pais FROM V3;
 
 SELECT Pais,COUNT (Pais) FROM V3 GROUP BY Pais;




-- EX09

SELECT V.Cod, T1.Local_A, T2.Local_A 
			FROM Voo AS V, Aeroporto AS T1,Aeroporto AS T2
					WHERE T1.Cod = V.De_CodAerop AND  T2.Cod = V.Para_CodAerop ORDER BY V.Cod, T1.Local_A, T2.Local_A ;



-- EX10

SELECT V.Cod, T1.Local_A, T2.Local_A 
			FROM Voo AS V, Aeroporto AS T1,Aeroporto AS T2
					WHERE T1.Cod = V.De_CodAerop AND  T2.Cod = V.Para_CodAerop 
						AND T1.Local_A = 'BR' AND T2.Local_A ='RJ';
	

-- EX11  Qual a quantidade de voos por país? Apresente apenas os países com mais de 02 aeroportos
	
CREATE VIEW V4 AS	
	SELECT A.Pais, COUNT(*)
		FROM Aeroporto AS A 
			GROUP BY A.Pais HAVING COUNT(*) >2;
			
			
					
			
SELECT Pais,COUNT(*) FROM V4 GROUP BY Pais HAVING COUNT(*) = 1 ;
		



-- EX12

SELECT Pais, count(Pais) A 
	FROM Aeroporto
		GROUP BY (Pais) HAVING COUNT(Pais) = (SELECT MAX(A.P)

    	 												FROM (SELECT COUNT(Pais) AS P

      																FROM Aeroporto

      																	GROUP BY (Pais)) as A)
											 
-- EX13
	SELECT A.Nome AS partida, B.Nome AS chegada 
		FROM Voo AS V, Aeroporto as A, Aeroporto as B 
			WHERE   V.De_CodAerop = A.Cod AND V.Para_CodAerop =B.Cod
				GROUP BY (partida, chegada); 