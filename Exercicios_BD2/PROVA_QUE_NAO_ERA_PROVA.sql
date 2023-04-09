CREATE TABLE cliente (
    id_cli INT PRIMARY KEY,
    nome VARCHAR(50),
    status INT,
    idade INT
);

CREATE TABLE roupa (
    id_roupa INT PRIMARY KEY,
    nome VARCHAR(50),
    cor VARCHAR(20)
);

CREATE TABLE aluguel (
    id_cli INT,
    id_roupa INT,
    data DATE,
    FOREIGN KEY (id_cli) REFERENCES cliente(id_cli),
    FOREIGN KEY (id_roupa) REFERENCES roupa(id_roupa)
);


INSERT INTO cliente (id_cli, nome, status, idade) VALUES
(1, 'João da Silva', 45, 30),
(2, 'Maria Santos', 45, 25),
(3, 'Paulo Souza', 1, 45),
(4, 'Ana Oliveira', 2, 20),
(5, 'Marcos Pereira', 3, 60),
(6, 'Luana Ferreira', 4, 28),
(7, 'Carla Lima', 5, 50),
(8, 'Lucas Almeida', 6, 35),
(9, 'Rafaela Oliveira', 7, 22),
(10, 'Fernando Costa', 8, 55),
INSERT INTO cliente (id_cli, nome, status, idade) VALUES (11, 'Catra MC', 7, 22);

INSERT INTO roupa (id_roupa, nome, cor) VALUES
(1, 'Vestido Longo', 'Preto'),
(2, 'Camisa Social', 'Branca'),
(3, 'Calça Jeans', 'Azul'),
(4, 'Terno', 'Cinza'),
(5, 'Vestido Curto', 'Vermelho'),
(6, 'Blusa de Renda', 'Branca'),
(7, 'Saia Midi', 'Rosa'),
(8, 'Jaqueta de Couro', 'Preta'),
(9, 'Short Jeans', 'Azul Claro'),
(10, 'Blazer', 'Bege');

INSERT INTO aluguel (id_cli, id_roupa, data) VALUES
(1, 1, '2022-01-10'),
(2, 4, '2022-02-15'),
(3, 2, '2022-03-20'),
(4, 5, '2022-04-25'),
(5, 8, '2022-05-30'),
(6, 3, '2022-06-05'),
(7, 6, '2022-07-10'),
(8, 10, '2022-08-15'),
(9, 9, '2022-09-20'),
(10, 7, '2022-10-25');
INSERT INTO aluguel (id_cli, id_roupa, data) VALUES (11, 9, '2022-09-20');

INSERT INTO aluguel (id_cli, id_roupa, data) VALUES (2, 9, '2022-09-20');



-- 9) Encontre os identificadores de clientes que têm os maiores status

SELECT C.id_cli
	FROM cliente AS C
	GROUP BY C.id_cli HAVING MAX(C.status) = (SELECT MAX(I.status) 
									 	FROM(SELECT C.status FROM cliente AS C )AS I );

--10)Quais são os nomes dos clientes mais jovens que alugaram a roupa 103 ?
SELECT C.nome,C.idade
	FROM cliente AS C	
	GROUP BY C.nome,C.idade HAVING C.idade  = (
										SELECT MIN(M.idade) 
									  		FROM (SELECT idade 
												  FROM cliente, aluguel
													WHERE cliente.id_cli = aluguel.id_cli AND aluguel.id_roupa = 9 )AS M 
									 
									 															)
	

