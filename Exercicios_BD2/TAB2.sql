CREATE TABLE Depositante(
	NroConta int PRIMARY KEY, 
	NomeCliente varchar
);

CREATE TABLE Devedor(
	NroEmpréstimo int PRIMARY KEY,
	NomeCliente varchar 	
);


CREATE TABLE Conta( 
	NroConta int PRIMARY KEY, 
	NomeAgencia varchar,
	Saldo real
);

-- INSERT INTO Depositante
INSERT INTO Depositante VALUES(123,'dudu');
INSERT INTO Depositante VALUES(124,'ana');
INSERT INTO Depositante VALUES(125,'jose');
INSERT INTO Depositante VALUES(126,'felipe');
INSERT INTO Depositante VALUES(127,'rau');
INSERT INTO Depositante VALUES(128,'kako');
INSERT INTO Depositante VALUES(1234,'karolina');

-- INSERT INTO Devedor
INSERT INTO Devedor VALUES(45,'dudu');
INSERT INTO Devedor VALUES(51,'jose');
INSERT INTO Devedor VALUES(32,'felipe');
INSERT INTO Devedor VALUES(12,'ana');
INSERT INTO Devedor VALUES(34,'kaio');
INSERT INTO Devedor VALUES(56,'rau');
INSERT INTO Devedor VALUES(87,'kako');
INSERT INTO Devedor VALUES(234,'osvaldo');
INSERT INTO Devedor VALUES(145,'tilve');
INSERT INTO Devedor VALUES(47,'isabela');
INSERT INTO Devedor VALUES(89,'karolina');


-- INSERT INTO Conta

INSERT INTO Conta VALUES(123,'itau',123.87);
INSERT INTO Conta VALUES(124,'bradesco',1234.87);
INSERT INTO Conta VALUES(125,'caixa',156.98);
INSERT INTO Conta VALUES(126,'sicred',23.00);
INSERT INTO Conta VALUES(127,'inter',1223456.00);
INSERT INTO Conta VALUES(128,'nubank',100002.00);
INSERT INTO Conta VALUES(129,'nubank',134563.97);
INSERT INTO Conta VALUES(1210,'ebanx',200.96);
INSERT INTO Conta VALUES(1211,'capitual',4578.54);
INSERT INTO Conta VALUES(1212,'neagles',12576.63);
INSERT INTO Conta VALUES(1214,'pan',64769.53);
INSERT INTO Conta VALUES(1234,'itau',146879.33);




