CREATE TABLE tipoquarto (
	id_tipoquarto integer PRIMARY KEY,
	designacao varchar(256) NOT NULL,
	lotacao integer NOT NULL
);
CREATE TABLE quarto (
	num integer PRIMARY KEY,
	andar integer NOT NULL,
	idtipo integer REFERENCES tipoquarto
);

CREATE TABLE cliente (
	ref_cliente integer PRIMARY KEY,
	nome varchar(256) NOT NULL,
	cidade varchar(256) NOT NULL,
	pais varchar(256) NOT NULL
);

CREATE TABLE reserva (
	num integer REFERENCES quarto,
	ref_cliente integer REFERENCES cliente,
	data_e date NOT NULL,
	data_s date NOT NULL,
	regime char(2) NOT NULL,
	numeropessoas integer NOT NULL
); 





INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (1, 'Quarto Standard', 2);
INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (2, 'Quarto Duplo', 2);
INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (3, 'Quarto Triplo', 3);
INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (4, 'Suite', 2);
INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (5, 'Quarto Familiar', 4);
INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (6, 'Quarto com Vista', 2);
INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (7, 'Quarto Econômico', 1);
INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (8, 'Quarto Deluxe', 2);
INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (9, 'Quarto Executivo', 2);
INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (10, 'Quarto Superior', 2);

INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (11, 'Quarto Terior', 1);
INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (13, 'Quarto Rstico', 1);

INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (14, 'Suite', 18);

INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (15, 'Suite Master', 38);

INSERT INTO tipoquarto (id_tipoquarto, designacao, lotacao) VALUES (16, 'Suite Presidencial',48);



INSERT INTO quarto (num, andar, idtipo) VALUES (101, 1, 1);
INSERT INTO quarto (num, andar, idtipo) VALUES (102, 1, 2);
INSERT INTO quarto (num, andar, idtipo) VALUES (103, 1, 3);
INSERT INTO quarto (num, andar, idtipo) VALUES (201, 2, 4);
INSERT INTO quarto (num, andar, idtipo) VALUES (202, 2, 5);
INSERT INTO quarto (num, andar, idtipo) VALUES (203, 2, 6);
INSERT INTO quarto (num, andar, idtipo) VALUES (301, 3, 7);
INSERT INTO quarto (num, andar, idtipo) VALUES (302, 3, 8);
INSERT INTO quarto (num, andar, idtipo) VALUES (303, 3, 9);
INSERT INTO quarto (num, andar, idtipo) VALUES (401, 4, 10);

INSERT INTO quarto (num, andar, idtipo) VALUES (104, 5, 1);

INSERT INTO quarto (num, andar, idtipo) VALUES (105, 6, 11);

INSERT INTO quarto (num, andar, idtipo) VALUES (107, 8, 14);

INSERT INTO quarto (num, andar, idtipo) VALUES (108, 8, 15);

INSERT INTO quarto (num, andar, idtipo) VALUES (109, 7, 1);

INSERT INTO quarto (num, andar, idtipo) VALUES (110, 8, 16);




INSERT INTO cliente (ref_cliente, nome, cidade, pais) VALUES (1, 'João Silva', 'São Paulo', 'Brasil');
INSERT INTO cliente (ref_cliente, nome, cidade, pais) VALUES (2, 'Ana Santos', 'Rio de Janeiro', 'Brasil');
INSERT INTO cliente (ref_cliente, nome, cidade, pais) VALUES (3, 'Pedro Costa', 'Porto', 'Portugal');
INSERT INTO cliente (ref_cliente, nome, cidade, pais) VALUES (4, 'Marta Gomes', 'Lisboa', 'Portugal');
INSERT INTO cliente (ref_cliente, nome, cidade, pais) VALUES (5, 'Maria Fernandes', 'Buenos Aires', 'Argentina');
INSERT INTO cliente (ref_cliente, nome, cidade, pais) VALUES (6, 'Manoel Fernandes', 'Buenos Aires', 'Brasil');
INSERT INTO cliente (ref_cliente, nome, cidade, pais) VALUES (7, 'Manoel Gomes', 'Buenos Aires', 'Argentina');
INSERT INTO cliente (ref_cliente, nome, cidade, pais) VALUES (8, 'Jacinto Fernandes', 'Buenos Aires', 'Congo');
INSERT INTO cliente (ref_cliente, nome, cidade, pais) VALUES (9, 'Irineu Nandes', 'Buenos Aires', 'Japão');
INSERT INTO cliente (ref_cliente, nome, cidade, pais) VALUES (10, 'Cortes Ernandes', 'Buenos Aires', 'China');




INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (101, 1, '2023-04-01', '2023-04-05', 'AD', 2);
INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (202, 2, '2023-05-10', '2023-05-15', 'MP', 1);
INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (303, 3, '2023-06-20', '2023-06-25', 'PC', 3);
INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (102, 4, '2007-01-10', '2007-04-05', 'PA', 4);
INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (401, 6, '2024-06-20', '2024-06-25', 'PA', 10);
INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (203, 7, '2045-01-10', '2045-04-05', 'PA', 4);
INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (103, 8, '2012-02-11', '2012-05-15', 'AD', 5);
INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (302, 9, '2024-06-20', '2024-06-25', 'PA', 10);
INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (201, 10, '2024-12-20', '2024-06-25', 'PC', 10);

INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (301, 5, '2007-01-10', '2007-05-15', 'PC', 5);
INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (301, 1, '2022-02-11', '2022-05-15', 'PC', 5);

INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (101, 3, '2024-06-20', '2024-06-25', 'PC', 3);

INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (203, 2, '2023-06-10', '2023-06-15', 'MP', 1);

INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (203, 8, '2023-04-01', '2023-06-15', 'MP', 1);

INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (109, 8, '2023-04-01', '2023-06-15', 'MP', 1);

INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (301, 1, '2012-02-11', '2013-05-15', 'PC', 2);

INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (301, 1, '2014-02-11', '2016-05-15', 'PC', 9);

INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (101, 1, '2007-02-11', '2007-05-15', 'PC', 5);

INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (202, 8, '2025-04-01', '2032-06-15', 'MP', 1);

INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (110, 10, '2025-04-01', '2034-06-15', 'MP', 1);

INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (108, 10, '2027-04-01', '2033-06-15', 'MP', 1);

INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (108, 9, '2027-04-01', '2033-06-15', 'MP', 1);
INSERT INTO reserva (num, ref_cliente, data_e, data_s, regime, numeropessoas) VALUES (201, 9, '2027-04-01', '2033-06-15', 'MP', 1);


-- EX1
	SELECT C.nome	
		FROM cliente AS C
			WHERE C.pais = 'Portugal';
-- EX2
	SELECT C.nome,C.cidade	
		FROM cliente AS C
			WHERE C.pais = 'Portugal';
-- EX3
	SELECT T.designacao 
		FROM tipoquarto AS T 
			WHERE id_tipoquarto IN (
				SELECT Q.idtipo
						FROM quarto AS Q 
							WHERE Q.andar = 3
								   );
-- EX4
	SELECT C.nome
		FROM cliente AS C
			WHERE ref_cliente IN(
				SELECT R.ref_cliente
					FROM reserva AS R
						WHERE R.num = '301' AND data_e > '2007-01-10'
			);
-- EX5
	SELECT R.num
		FROM reserva AS R
			WHERE R.ref_cliente IN(
					SELECT R.ref_cliente
						FROM reserva AS R
							WHERE R.ref_cliente = '3'
				
			)
			ORDER BY R.num ASC;
					
-- EX6
	SELECT T.designacao, count(*)
		FROM quarto AS Q, reserva AS R, tipoquarto T
			WHERE T.id_tipoquarto = Q.idtipo AND R.num = Q.num
				GROUP BY T.designacao;		
			
-- EX7
	SELECT T.id_tipoquarto
		FROM tipoquarto AS T 
			WHERE lotacao > 1;
-- EX8
	SELECT Q.andar
		FROM quarto Q
			WHERE  idtipo = '1';
-- EX9
	SELECT C.ref_cliente, C.nome
		FROM cliente C
			WHERE C.ref_cliente IN(
				SELECT R.ref_cliente
					FROM reserva R
						WHERE R.regime = 'AD'
			
			);
		
-- EX10
	SELECT C.ref_cliente, C.nome
		FROM cliente C, quarto Q, reserva R
			WHERE R.ref_cliente = C.ref_cliente  AND R.num = Q.num AND Q.andar = 3 AND numeropessoas > 2;
			
-- EX11
	SELECT Q.num
		FROM quarto Q	
			WHERE q.idtipo IN (
				SELECT T.id_tipoquarto
					FROM  tipoquarto AS T
						WHERE lotacao = 1
			)
	ORDER BY Q.num ASC;
-- Ou 


SELECT Q.num
		FROM quarto Q, tipoquarto AS T	
			WHERE q.idtipo = T.id_tipoquarto AND lotacao = 1
			ORDER BY Q.num ASC;
-- EX12

SELECT R.regime ,COUNT(R.regime)
	FROM quarto AS Q, reserva AS R
		WHERE R.num = Q.num AND Q.andar = 3
			GROUP BY R.regime;
-- EX13
	SELECT R.data_e,R.numeropessoas
		FROM reserva AS R
			GROUP BY R.data_e,R.numeropessoas HAVING R.numeropessoas > 2;
-- EX14
SELECT DISTINCT C.ref_cliente
		FROM cliente AS C,reserva AS R
			WHERE C.ref_cliente = R.ref_cliente AND regime = 'MP'; 
			
-- 	ou 
SELECT DISTINCT C.ref_cliente
		FROM cliente AS C
			WHERE C.ref_cliente IN(
				SELECT R.ref_cliente
					FROM reserva AS R
						WHERE regime = 'MP'
			);
-- EX15
	SELECT Q.num
		FROM quarto AS Q
			WHERE Q.idtipo IN (
				SELECT T.id_tipoquarto
					FROM tipoquarto AS T
						WHERE T.designacao LIKE 'Suite%'
			);
-- EX16
	
-- EX17
	SELECT R.data_e
		FROM reserva AS R
			WHERE R.ref_cliente IN(SELECT c.ref_cliente FROM cliente AS C WHERE pais = 'Portugal')
				ORDER BY R.data_e ASC;
				
-- EX18
	SELECT R.data_e, COUNT(*)
		FROM reserva AS R, quarto AS Q, tipoquarto AS T
			WHERE  T.id_tipoquarto = Q.idtipo AND R.num = Q.num AND designacao = 'Quarto Standard'		
			GROUP BY R.data_e
		
-- EX19
	SELECT Q.num 
		FROM quarto AS Q
			WHERE Q.idtipo IN(
				SELECT T.id_tipoquarto
					FROM tipoquarto AS T
						WHERE designacao = 'Quarto Standard'
			)AND Q.andar = 7;
			
-- ou			
	SELECT Q.num 
		FROM quarto AS Q, tipoquarto AS T 
			WHERE Q.idtipo = T.id_tipoquarto AND designacao = 'Quarto Standard' AND Q.andar = 7;
			
-- EX20
	SELECT C.nome 
		FROM cliente AS C
			WHERE C.ref_cliente IN(SELECT R.ref_cliente FROM reserva AS R WHERE numeropessoas > 5);
			
			
			
-- EX21	
	SELECT DISTINCT Q.andar 
		FROM quarto AS Q
			WHERE Q.idtipo IN (SELECT T.id_tipoquarto FROM tipoquarto AS T WHERE T.lotacao > 1); 
			
-- EX22
	SELECT R.data_e, COUNT(*)
		FROM reserva AS R, quarto AS Q, tipoquarto AS T
			WHERE T.id_tipoquarto = Q.idtipo AND R.num = Q.num AND designacao = 'Quarto Duplo'
			GROUP BY R.data_e;
-- Ou 


	SELECT R.data_e, COUNT(*)
		FROM reserva AS R
			WHERE R.num IN (
			
			  				SELECT Q.num 
								FROM quarto AS Q
									WHERE Q.idtipo IN (
													SELECT T.id_tipoquarto 
														FROM tipoquarto AS T 
													   		WHERE T.designacao = 'Quarto Duplo')	
			
			)GROUP BY R.data_e;
			
			
-- EX23
	SELECT R.regime, COUNT(*)
		FROM reserva AS R
			WHERE R.num IN (SELECT Q.num FROM quarto AS Q WHERE Q.andar = 3)
			GROUP BY R.regime HAVING COUNT(*) > 2;
-- EX24
	SELECT C.nome, COUNT(*) 
		FROM cliente AS C, quarto AS Q, reserva AS R
			WHERE Q.num = R.num AND C.ref_cliente = R.ref_cliente AND Q.num = '301'
					GROUP BY C.nome HAVING COUNT(*) > 2;
					
-- EX25
	SELECT Q.num, COUNT(*) 
		FROM quarto AS Q, reserva AS R
			WHERE Q.num = R.num
					GROUP BY Q.num;
		
-- EX26	
	SELECT C.nome, C.ref_cliente
		FROM cliente AS C, quarto AS Q, reserva AS R, tipoquarto AS T
			WHERE  T.id_tipoquarto = Q.idtipo AND Q.num = R.num AND R.ref_cliente = C.ref_cliente
			AND T.designacao LIKE 'Suite%' AND andar = 2 AND regime = 'PC'
				ORDER BY C.nome;
-- EX27
	SELECT R.data_e,C.nome
		FROM cliente AS C, quarto AS Q, tipoquarto AS T,reserva AS R
			 WHERE  T.id_tipoquarto = Q.idtipo AND Q.num = R.num AND R.ref_cliente = C.ref_cliente
			 	AND T.designacao = 'Quarto Standard' AND R.data_e > '2012-12-31'
					ORDER BY C.nome ASC
-- EX28
	SELECT C.nome,Q.num 
		FROM quarto AS Q, tipoquarto AS T,cliente AS C,reserva AS R
			WHERE Q.idtipo = T.id_tipoquarto AND C.ref_cliente = R.ref_cliente AND R.num = Q.num 
				AND T.lotacao > 1 AND C.nome LIKE 'Jacinto%'
				ORDER BY Q.num;
-- EX29
	SELECT C.nome
		FROM quarto AS Q, tipoquarto AS T,cliente AS C,reserva AS R
			WHERE Q.idtipo = T.id_tipoquarto AND C.ref_cliente = R.ref_cliente AND R.num = Q.num
				AND	C.cidade  = 'Buenos Aires' AND T.lotacao > 1
	EXCEPT
	
	SELECT  C.nome
		FROM quarto AS Q, tipoquarto AS T,cliente AS C,reserva AS R
			WHERE Q.idtipo = T.id_tipoquarto AND C.ref_cliente = R.ref_cliente AND R.num = Q.num
				AND	C.cidade  = 'Buenos Aires' AND T.lotacao > 3
	
-- EX30
	SELECT C.nome, C.ref_cliente
		FROM quarto AS Q, tipoquarto AS T,cliente AS C,reserva AS R
			WHERE Q.idtipo = T.id_tipoquarto AND C.ref_cliente = R.ref_cliente AND R.num = Q.num
				AND	T.designacao LIKE 'Suite%'
	EXCEPT
		SELECT C.nome, C.ref_cliente
		FROM quarto AS Q, tipoquarto AS T,cliente AS C,reserva AS R
			WHERE Q.idtipo = T.id_tipoquarto AND C.ref_cliente = R.ref_cliente AND R.num = Q.num
				AND	T.designacao LIKE 'Suite Presidencial';
	