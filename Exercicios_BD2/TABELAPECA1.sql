CREATE TABLE Peca(
	Referencia text PRIMARY KEY,
	Tipo text,
	Preco real,
	Cor text,
	Tamanho real

);

CREATE TABLE Cliente(
	NumID int PRIMARY KEY,
	Nome text,
	cidade text	
);


CREATE TABLE Encomenda(
	Numero int PRIMARY KEY,
	data_E date,
	fk_NumID int
	
);




CREATE TABLE Peca_Enc(
	fk_Referencia text,
	fk_Numero int,
	quantidade int
);

ALTER TABLE Peca_Enc ADD CONSTRAINT fk_Peca FOREIGN KEY (fk_Referencia) REFERENCES Peca(Referencia) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE Peca_Enc ADD CONSTRAINT fk_Encomenda FOREIGN KEY (fk_Numero) REFERENCES Encomenda(Numero) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE Encomenda  ADD CONSTRAINT fk_NumID1 FOREIGN KEY (fk_NumID) REFERENCES Cliente(NumID) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE  Peca_Enc ADD CONSTRAINT pk_fk_Referencia_fk_Numero PRIMARY KEY(fk_Referencia,fk_Numero);

-- Inserções na tabela Peca
INSERT INTO Peca VALUES('PECA001', 'Camisa', 50.00, 'Azul', 1.45);
INSERT INTO Peca VALUES('PECA002', 'Calça', 80.00, 'Preto', 4.46);
INSERT INTO Peca VALUES('PECA003', 'Blusa', 40.00, 'Branco', 567.4);
INSERT INTO Peca VALUES('PECA004', 'Vestido', 120.00, 'Vermelho', 31314.3);
INSERT INTO Peca VALUES('PECA005', 'Saia', 60.00, 'Rosa',134.3 );
INSERT INTO Peca VALUES('PECA006', 'Bermuda', 30.00, 'Verde', 12.6);
INSERT INTO Peca VALUES('PECA007', 'Jaqueta', 150.00, 'Marrom', 987.3);
INSERT INTO Peca VALUES('PECA008', 'Shorts', 40.00, 'Amarelo', 134.7);
INSERT INTO Peca VALUES('PECA009', 'Blazer', 100.00, 'Cinza', 12313.4);
INSERT INTO Peca VALUES('PECA010', 'Regata', 20.00, 'Roxo', 234.87);
INSERT INTO Peca VALUES('PECA011', 'Saia', 60.00, 'Rosa',134.3 );
INSERT INTO Peca VALUES('PECA012', 'Saia', 60.00, 'Gold',134.3 );



-- Inserções na tabela Cliente
INSERT INTO Cliente VALUES (1001, 'João', 'São Paulo');
INSERT INTO Cliente VALUES (1002, 'Maria', 'Rio de Janeiro');
INSERT INTO Cliente VALUES (1003, 'Pedro', 'Belo Horizonte');
INSERT INTO Cliente VALUES (1004, 'Lucas', 'Curitiba');
INSERT INTO Cliente VALUES (1005, 'Ana', 'Recife');
INSERT INTO Cliente VALUES (1006, 'Luis', 'Recife');



-- Inserções na tabela Encomenda
INSERT INTO Encomenda VALUES(1, '2022-01-15', 1001);
INSERT INTO Encomenda VALUES(2, '2022-02-01', 1002);
INSERT INTO Encomenda VALUES(3, '2022-02-18', 1003);
INSERT INTO Encomenda VALUES(4, '2022-03-10', 1004);
INSERT INTO Encomenda VALUES(5, '2022-04-02', 1005);
INSERT INTO Encomenda VALUES(6, '2022-05-05', 1001);
INSERT INTO Encomenda VALUES(7, '2022-06-20', 1003);
INSERT INTO Encomenda VALUES(8, '2022-07-15', 1002);
INSERT INTO Encomenda VALUES(9, '2022-08-03', 1005);
INSERT INTO Encomenda VALUES(10, '2022-09-22', 1004);
INSERT INTO Encomenda VALUES(11, '2022-12-22', 1006);

-- Inserções na tabela Peca_Enc
INSERT INTO Peca_Enc VALUES('PECA001', 1, 2);
INSERT INTO Peca_Enc VALUES('PECA002', 1, 1);
INSERT INTO Peca_Enc VALUES('PECA003', 2, 3);
INSERT INTO Peca_Enc VALUES('PECA004', 2, 2);
INSERT INTO Peca_Enc VALUES('PECA005', 3, 4);
INSERT INTO Peca_Enc VALUES('PECA006', 3, 1);
INSERT INTO Peca_Enc VALUES('PECA007', 4, 1);
INSERT INTO Peca_Enc VALUES('PECA008', 4, 3);
INSERT INTO Peca_Enc VALUES('PECA009', 5, 2);
INSERT INTO Peca_Enc VALUES('PECA010', 5, 5);
INSERT INTO Peca_Enc VALUES('PECA010', 5, 5);
INSERT INTO Peca_Enc VALUES('PECA010', 1, 2);

-- EX1

SELECT C.nome, E.Numero 
	FROM Encomenda AS E,Cliente AS C
		WHERE E.fk_NumID = C.NumID AND C.nome = 'Luis';
		
-- ou 
SELECT E.Numero 
	FROM Encomenda AS E
		WHERE E.fk_NumID IN 
			(SELECT NumID FROM Cliente AS C
			 	WHERE C.nome = 'Luis');


-- EX2
SELECT data_E 
	FROM Encomenda
		WHERE fk_NumID IN(
			SELECT NumID
				FROM Cliente
					WHERE cidade ='São Paulo'
		);

-- EX3	
	SELECT Tipo, COUNT(*) AS cont_pessoas
			FROM Peca
				GROUP BY tipo ORDER BY cont_pessoas DESC, tipo;
-- EX4 
	SELECT C.Nome,count(*) AS total_emcomendas 
		FROM Cliente AS C,Encomenda AS E
			WHERE E.fk_NumID = C.NumID
			GROUP BY (C.Nome);
			
-- EX5
	SELECT DISTINCT Cor 
		FROM Peca
			WHERE cor NOT IN(
					SELECT P.Cor 
							FROM Peca AS P,Peca_Enc AS PE
								WHERE P.Referencia = PE.fk_Referencia
		);
		
-- EX6
	SELECT Tipo 
		FROM Peca 
			WHERE tipo NOT IN (
						SELECT tipo 
								FROM Peca 
									WHERE Cor = 'Rosa'	
			);

-- EX7
	SELECT P.Referencia, SUM(P.Preco*PE.Quantidade)
		FROM Peca_Enc AS PE, Peca AS P
			WHERE P.Referencia = PE.fk_Referencia
			GROUP BY  P.Referencia
	;
	
-- EX8
	SELECT C.Nome,C.NumID, SUM(P.Preco*PE.Quantidade)
		FROM Peca_Enc AS PE, Peca AS P, Cliente AS C, Encomenda AS E
			WHERE P.Referencia = PE.fk_Referencia AND C.NumID = E.fk_NumID	AND E.Numero = PE.fk_Numero
			
			GROUP BY C.Nome,C.NumID ORDER BY SUM(P.Preco*PE.Quantidade) ASC, C.NumID 
	;
	
-- EX9
	SELECT C.Nome,C.NumID
		FROM Encomenda AS E,Cliente AS C
			WHERE C.NumId = E.fk_NumId
			GROUP BY C.Nome,C.NumID HAVING COUNT(*) >= ALL(
				SELECT COUNT(*) AS Total
					FROM Encomenda AS E
						GROUP BY E.fk_NumID 
			) ;
		
			
	
	
-- EX10


SELECT DISTINCT tipo
		FROM Peca
			WHERE tipo NOT IN (
				SELECT DISTINCT tipo
					FROM Cliente as c, Encomenda as E, peca_enc as PE, peca as P	
						WHERE C.NumId = E.fk_NumId AND E.Numero = PE.fk_Numero AND PE.fk_Referencia = P.Referencia 
							AND C.Cidade = 'São Paulo' 
		);

-- EX11

SELECT DISTINCT C.Nome, C.NumID
	FROM Cliente AS C
		WHERE Cidade = 'Belo Horizonte' AND C.NumID NOT IN(
			SELECT E.fk_NumID 
				FROM Cliente AS C, Encomenda AS E, Peca_Enc AS PE, Peca AS P
					WHERE C.NumID = E.fk_NumID AND E.Numero = PE.fk_Numero 
												AND PE.fk_Referencia  = P.Referencia AND P.tipo = 'Calça' 
			
		);
