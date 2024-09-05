USE bancoaula;


CREATE TABLE disciplina (
	cod_disciplina INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR (100) NOT NULL UNIQUE ,
	carga_horaria TINYINT NOT null
);

CREATE TABLE aluno ( 
	Ra INT NOT NULL PRIMARY KEY , 
	nome VARCHAR (100) NOT NULL ,
	cpf VARCHAR (11) NOT NULL UNIQUE ,
	datanascimento DATE NOT NULL ,
	endereco VARCHAR (255) NOT NULL -- alterar depois, criando tabela

);

CREATE TABLE cursa( 
	cod_disciplina 	INT NOT NULL ,
	cod_aluno 			INT NOT NULL ,
	datainicio			DATE NOT NULL ,
	datafim 				DATE NOT NULL ,
	PRIMARY KEY (cod_disciplina,cod_aluno,datainicio), -- criando chave composta 
	FOREIGN KEY (cod_disciplina) REFERENCES disciplina (cod_disciplina),
	FOREIGN KEY (cod_aluno) REFERENCES aluno (Ra)

);

	ALTER TABLE cursa CHANGE datainicio data_inicio DATE NOT NULL;
	
	CONSTRAINT pk_cursa PRIMARY KEY (cod_disciplina, cod_aluno, data_inicio) --é uma chave primaria composta
	CONSTRAINT fk_cursa_disc FOREIGN KEY (cod_disciplina) REFERENCES disciplina (cod_disciplina)
	CONSTRAINT fk_cursa_aluno FOREIGN KEY (cod_aluno) REFERENCES aluno (cod_aluno)
	
	-- mostra a estrutura da tabela cortada (describe ou desc)
	DESCRIBE disciplina;
	DESCRIBE aluno;
	
	-- mostra os dados armazenados dentro da tabela
	SELECT * FROM disciplina;
	SELECT * FROM aluno;
	
	-- so EXECUTE esse comando se a tabela estiver vazia ou seja sem dados, caso contrário use o comando  ALter table
	DROP TABLE disciplina;
	
	-- exemplificar o uso do alter  alterar uma tabela que ja foi criada, adicionar um campo(add), modificar um campo (modify), ou excluir campo(drop)
	ALTER TABLE disciplina ADD carga_horaria TINYINT NOT NULL;
	ALTER TABLE cursa CHANGE datainicio data_inicio DATE NOT NULL;
	ALTER TABLE aluno CHANGE nome nome_aluno VARCHAR (100) NOT NULL;
	ALTER TABLE aluno MODIFY nome_aluno VARCHAR (70) NOT NULL;
	ALTER TABLE disciplina ADD carga_horariatotal TINYINT NOT NULL;
	ALTER TABLE disciplina drop carga_horariatotal;
	-- exemplificar o uso do show 
	SHOW TABLES;
	SHOW DATABASES;
	
	-- cadastrar dados em aluno 
	INSERT INTO aluno (ra, nome_aluno, cpf, datanascimento, endereco) VALUES(112, "higor", "444908", "1997-11-24", "rua lutecia 145 jd deyse Feraaz de vasconcelos, sao paulo ");
	
	--atualizar dados
	UPDATE aluno 
	SET nome_aluno = "higor carlos"
	WHERE Ra = 111;
	
	UPDATE aluno 
	SET nome_aluno = "higor carlos campos", cpf = "5555555"
	WHERE Ra = 111;

	CREATE TABLE aluno2 LIKE aluno;
	INSERT INTO aluno2 SELECT * FROM aluno;
	SELECT * FROM aluno2;
