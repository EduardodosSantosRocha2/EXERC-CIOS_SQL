CREATE TABLE departamento (
 id_dep integer PRIMARY KEY,
 nome varchar,
 id_dir integer
);

CREATE TABLE empregado (
 id_emp integer PRIMARY KEY,
 nome varchar ,
 salario numeric (6,2),
 id_dep integer REFERENCES departamento,
 id_sup integer REFERENCES empregado);


ALTER TABLE departamento ADD CONSTRAINT dir_dep_fk FOREIGN KEY (id_dir)

REFERENCES empregado ON DELETE SET NULL;

CREATE TABLE projeto (
 id_proj integer PRIMARY KEY,
 nome varchar,
 id_dep integer REFERENCES departamento);
 

CREATE TABLE trabalha (
 id_emp integer REFERENCES empregado,
 id_pro integer REFERENCES projeto,
 horas integer,
 PRIMARY KEY (id_emp, id_pro)
);




INSERT INTO departamento  VALUES(1, 'Recursos Humanos', NULL);
INSERT INTO departamento  VALUES(2, 'Contabilidade', NULL);
INSERT INTO departamento  VALUES(3, 'Tecnologia', NULL);
INSERT INTO departamento  VALUES(4, 'Marketing Digital', NULL);
INSERT INTO departamento  VALUES(5, 'Comercial', NULL);
INSERT INTO departamento  VALUES(6, 'Manufatura', NULL);
INSERT INTO departamento  VALUES(7, 'Transporte', NULL);
INSERT INTO departamento  VALUES(8, 'Assuntos Legais', NULL);
INSERT INTO departamento  VALUES(9, 'Comunicações', NULL);
INSERT INTO departamento  VALUES(10, 'Pesquisa e Inovação', NULL);




INSERT INTO empregado VALUES(1, 'Lucas', 4800.00, 3, 1);
INSERT INTO empregado VALUES(2, 'Marcela', 3800.00, 5, 2);
INSERT INTO empregado VALUES(3, 'Nathalia', 5500.00, 1, 3);
INSERT INTO empregado VALUES(4, 'Oliver', 5100.00, 2, 4);
INSERT INTO empregado VALUES(5, 'Patricia', 4200.00, 4, 5);
INSERT INTO empregado VALUES(6, 'Queila', 3200.00, 7, 6);
INSERT INTO empregado VALUES(7, 'Raphael', 2800.00, 7, 6);
INSERT INTO empregado VALUES(8, 'Samantha', 5200.00, 6, 7);
INSERT INTO empregado VALUES(9, 'Thiago', 4100.00, 6, 8);
INSERT INTO empregado VALUES(10, 'Ulisses', 5700.00, 3, 9);

INSERT INTO empregado VALUES(11, 'Tlisses', 5700.00, 1, 10);

INSERT INTO empregado VALUES(13, 'Josefino', 5700.00, 1, NULL);





UPDATE departamento SET id_dir = 4 WHERE id_dep = 1;
UPDATE departamento SET id_dir = 1 WHERE id_dep = 2;
UPDATE departamento SET id_dir = 3 WHERE id_dep = 3;
UPDATE departamento SET id_dir = 2 WHERE id_dep = 4;
UPDATE departamento SET id_dir = 5 WHERE id_dep = 5;
UPDATE departamento SET id_dir = 6 WHERE id_dep = 6;
UPDATE departamento SET id_dir = 7 WHERE id_dep = 7;
UPDATE departamento SET id_dir = 8 WHERE id_dep = 8;
UPDATE departamento SET id_dir = 9 WHERE id_dep = 9;
UPDATE departamento SET id_dir = 10 WHERE id_dep = 10;


INSERT INTO projeto VALUES (1, 'Sistema de RH', 1);
INSERT INTO projeto VALUES(2, 'Banco de dados financeiros', 2);
INSERT INTO projeto VALUES(3, 'Aplicativo de gerenciamento de projetos', 3);
INSERT INTO projeto VALUES(4, 'Campanha publicitária', 4);
INSERT INTO projeto VALUES(5, 'E-commerce', 5);
INSERT INTO projeto VALUES(6, 'Melhorias na linha de produção', 6);
INSERT INTO projeto VALUES(7, 'Transporte e logística', 7);
INSERT INTO projeto VALUES(8, 'Assuntos tributários', 8);
INSERT INTO projeto VALUES(9, 'Marketing interno', 9);
INSERT INTO projeto VALUES(10, 'Pesquisa de mercado', 10);
INSERT INTO projeto VALUES (11, 'Sistema de RH2', 1);





INSERT INTO trabalha VALUES(1, 1, 40);
INSERT INTO trabalha VALUES(2, 1, 35);
INSERT INTO trabalha VALUES(3, 2, 50);
INSERT INTO trabalha VALUES(4, 2, 45);
INSERT INTO trabalha VALUES(5, 4, 30);
INSERT INTO trabalha VALUES(6, 4, 25);
INSERT INTO trabalha VALUES(7, 5, 20);
INSERT INTO trabalha VALUES(8, 5, 15);
INSERT INTO trabalha VALUES(9, 6, 40);
INSERT INTO trabalha VALUES(10, 6, 35);
INSERT INTO trabalha VALUES(11, 1, 45);

-- ËX1 
	SELECT E.nome, D.nome
		FROM departamento AS D,empregado AS E
			WHERE E.id_dep = D.id_dep;
			
-- EX2

SELECT D.nome, E.nome
	FROM departamento AS D,empregado AS E
		WHERE E.id_emp = D.id_dir;

-- EX3 
	SELECT P.id_proj AS projeto,D.nome 
		FROM projeto AS P, departamento AS D
			WHERE P.id_dep  = D.id_dep;
			
-- EX4
	SELECT P.nome AS nome
		FROM projeto AS P
			WHERE P.id_dep = 2;
-- EX5
SELECT P.nome
	FROM projeto AS P
		WHERE id_dep IN(
			SELECT id_dep
				FROM departamento AS D
					WHERE D.nome = 'Recursos Humanos'
		);
		
-- EX6
	SELECT E.nome, T.horas 
		FROM empregado AS E, trabalha AS T, projeto AS P
			WHERE T.id_pro = P.id_proj AND T.id_emp = E.id_emp AND P.nome = 'E-commerce' ;
-- EX7
	SELECT E.nome, T.horas 
		FROM empregado AS E, trabalha AS T, projeto AS P
			WHERE T.id_pro = P.id_proj AND T.id_emp = E.id_emp AND P.nome = 'Banco de dados financeiros'
				ORDER BY horas DESC;
-- EX8
	SELECT P.nome,COUNT(*) AS QUANT_TRABALHA
		FROM trabalha AS T,projeto AS P
			WHERE T.id_pro = P.id_proj
			GROUP BY P.nome;
-- EX9
SELECT P.nome,SUM(horas) AS QUANT_TRABALHA
		FROM trabalha AS T,projeto AS P
			WHERE T.id_pro = P.id_proj
			GROUP BY P.nome;
-- EX10
	SELECT E.nome, SUM(horas) AS Horas_totais
		FROM trabalha AS T, empregado AS E
			WHERE T.id_emp=E.id_emp
				GROUP BY E.nome;
-- EX11
	SELECT S.nome AS superior, E.nome AS empregado
		FROM empregado AS E, empregado AS S	
			WHERE  S.id_sup =E.id_emp;
-- EX12 
	SELECT S.nome AS superior, E.nome AS empregado
		FROM empregado AS E LEFT JOIN empregado AS S ON 
			S.id_sup =E.id_emp;
-- EX13
	SELECT D.id_dep,MAX(E.salario) 
		FROM empregado AS E, departamento AS D
			WHERE E.id_dep = D.id_dep 
				GROUP BY D.id_dep;
	
-- EX14
	SELECT MAX(salario)
		FROM empregado
-- EX15
	SELECT (MAX(salario) - MIN(salario))AS diferenca
		FROM empregado
	
-- 	EX16
	SELECT S.nome superior, E.nome empregado, SUM(S.salario) -SUM(E.salario) Diferenca_salarial
		FROM empregado AS E, empregado AS S	
			WHERE  S.id_sup =E.id_emp
				GROUP BY S.nome, E.nome ;
-- EX17
	SELECT MAX(pesquisa.Diferenca_salarial)
		FROM(SELECT S.nome, E.nome, SUM(S.salario) -SUM(E.salario) AS Diferenca_salarial
					FROM empregado AS E, empregado AS S	
						WHERE  S.id_sup =E.id_emp
			 GROUP BY  S.nome, E.nome
			)AS pesquisa;
				

	
-- EX18
	SELECT D.nome nome_salario_medio_maior_2300, AVG(E.salario)
		FROM departamento AS D, empregado AS E
			WHERE D.id_dep = E.id_dep	
				GROUP BY D.nome HAVING AVG(E.salario) > 3000 ;
-- EX19
	SELECT DISTINCT E.nome 
		FROM empregado AS E, projeto AS P, trabalha AS T
			WHERE E.id_dep <> P.id_dep AND P.id_proj = T.id_pro AND T.id_emp = E.id_emp;
-- EX20
	
	SELECT DISTINCT E.nome 
		FROM empregado AS E, projeto AS P, trabalha AS T
			WHERE E.id_dep = P.id_dep AND P.id_proj = T.id_pro AND T.id_emp = E.id_emp;
-- EX21
SELECT DISTINCT E.nome 
		FROM empregado AS E, projeto AS P, trabalha AS T
			WHERE E.id_dep = P.id_dep AND P.id_proj = T.id_pro AND T.id_emp = E.id_emp
EXCEPT
SELECT DISTINCT E.nome 
		FROM empregado AS E, projeto AS P, trabalha AS T
			WHERE E.id_dep <> P.id_dep AND P.id_proj = T.id_pro AND T.id_emp = E.id_emp;
	