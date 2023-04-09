CREATE TABLE Emp(
	ENume int PRIMARY KEY, 
	ENome varchar, 
	Ende varchar, 
	Tel varchar, 
	Sal real, 
	DNum int 
);

CREATE TABLE Dep(
	DNum int PRIMARY KEY,
	DNome varchar, 
	Orcam numeric(15,3)
);

ALTER TABLE Emp ALTER COLUMN Sal TYPE real;

-- INSERT INTO Emp 
INSERT INTO Emp VALUES(1,'Jose Firmino','Rua Sarnei 235' ,'(92) 3745-2417',1234.89,123);
INSERT INTO Emp VALUES(2,'Jose Caixeta','Rua Perneta 245' ,'(38) 2952-8873',2434.59,124);
INSERT INTO Emp VALUES(3,'Maria Katia','Rua Vista 378' ,'(38) 2441-8820',1998.87,125);
INSERT INTO Emp VALUES(4,'Gabriela Rodrigues','Rua Lights 215' ,'(31) 3370-8594',13234.59,126);
INSERT INTO Emp VALUES(5,'Carolina Cardoso','Rua Mission 774' ,'(37) 3092-3255',12534.84,127);
INSERT INTO Emp VALUES(6,'João Rocha','Rua Curve 672' ,'(38) 3636-8682',12634.85,128);
INSERT INTO Emp VALUES(7,'Antônio Carvalho','Rua Locks 738' ,'(32) 2313-2794',12384.82,129);
INSERT INTO Emp VALUES(8,'Joao Souza ','Rua Island 847' ,'(37) 2556-5228',12349.84,1210);
INSERT INTO Emp VALUES(9,'Julian Araujo','Rua Parkways 988' ,'(35) 2758-7757',123410.39,1211);
INSERT INTO Emp VALUES(10,'Gabriela Correia','Rua Roads 595' ,'(31) 2297-7994',123234.29,12312);
INSERT INTO Emp VALUES(11,'Marisa Fernandes','Rua Motorway 755' ,'(31) 2711-4459',123413.49,12313);
-- INSERT INTO Dep 

INSERT INTO Dep VALUES(123,'administrativo',20000000000);
INSERT INTO Dep VALUES(124,'administrativo',19000000000);
INSERT INTO Dep VALUES(125,'administrativo',27000000000);
INSERT INTO Dep VALUES(126,'administrativo',87000000000);
INSERT INTO Dep VALUES(127,'administrativo',9000000000);
INSERT INTO Dep VALUES(128,'administrativo',1000000000);
INSERT INTO Dep VALUES(129,'administrativo',34000000000);
INSERT INTO Dep VALUES(1210,'administrativo',650000000000);
INSERT INTO Dep VALUES(1211,'administrativo',34000000000);
INSERT INTO Dep VALUES(12312,'administrativo',5000000000);
INSERT INTO Dep VALUES(12313,'administrativo',99000000000);


