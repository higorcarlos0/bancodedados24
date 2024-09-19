USE bancoaula;

CREATE DATABASE bancoaula;


CREATE TABLE aluno ( 
	Ra INT NOT NULL PRIMARY KEY , 
	nome VARCHAR (100) NOT NULL ,
	cpf VARCHAR (11) NOT NULL UNIQUE ,
	datanascimento DATE NOT NULL ,
	endereco VARCHAR (255) NOT NULL -- alterar depois, criando tabela

);

CREATE TABLE disciplina(
	cod_disciplina INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL UNIQUE
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


	
	CONSTRAINT pk_cursa PRIMARY KEY (cod_disciplina, cod_aluno, data_inicio) --é uma chave primaria composta
	CONSTRAINT fk_cursa_disc FOREIGN KEY (cod_disciplina) REFERENCES disciplina (cod_disciplina)
	CONSTRAINT fk_cursa_aluno FOREIGN KEY (cod_aluno) REFERENCES aluno (cod_aluno)
	
	-- mostra a estrutura da tabela cortada (describe ou desc)
	DESCRIBE disciplina;
	DESCRIBE aluno;
	
	-- mostra os dados armazenados dentro da tabela
	SELECT * FROM disciplina;
	SELECT * FROM cursa;
	SELECT * FROM aluno;
	SELECT * FROM aluno2;
	SELECT COUNT(*) AS "total de alunos" FROM aluno; 
	SELECT MAX (datanascimento) FROM aluno;
	SELECT MIN (datanascimento) FROM aluno;
	SELECT AVG (datanascimento) FROM aluno;
	SELECT * FROM aluno WHERE nome LIKE "ju%";
	SELECT aluno.nome, disciplina.nome_disciplina 
	FROM cursa, aluno, disciplina 
	WHERE cursa.cod_aluno = aluno.Ra 
	AND cursa.cod_disciplina = disciplina.cod_disciplina 
	GROUP BY cursa.cod_aluno
	SELECT aluno.nome AS "nome do aluno", disciplina.nome_disciplina AS "nome da disciplina"
	FROM cursa, aluno, disciplina 
	WHERE cursa.cod_aluno = aluno.Ra 
	AND cursa.cod_disciplina = disciplina.cod_disciplina 
	SELECT aluno.nome AS "nome do aluno", disciplina.nome_disciplina AS "nome da disciplina"
	FROM cursa
	INNER JOIN aluno		ON cursa.cod_aluno = aluno.ra
	INNER JOIN disciplina  ON cursa.cod_disciplina = disciplina.cod_disciplina

	
	
	
	

	
	-- so EXECUTE esse comando se a tabela estiver vazia ou seja sem dados, caso contrário use o comando  ALter table
	DROP TABLE disciplina;
	DROP TABLE cursa;
	
	-- exemplificar o uso do alter  alterar uma tabela que ja foi criada, adicionar um campo(add), modificar um campo (modify), ou excluir campo(drop)
	ALTER TABLE disciplina ADD carga_horaria TINYINT NOT NULL;
	ALTER TABLE cursa CHANGE datainicio data_inicio DATE NOT NULL;
	ALTER TABLE aluno CHANGE nome nome_aluno VARCHAR (100) NOT NULL;
	ALTER TABLE aluno MODIFY nome_aluno VARCHAR (70) NOT NULL;
	ALTER TABLE disciplina ADD carga_horariatotal TINYINT NOT NULL;
	ALTER TABLE disciplina MODIFY carga_horaria TINYINT NOT NULL DEFAULT 40; 
	ALTER TABLE disciplina drop carga_horariatotal;
	ALTER TABLE cursa CHANGE datainicio data_inicio DATE NOT NULL;
	ALTER TABLE disciplina CHANGE nome nome_disciplina VARCHAR (100) NOT NULL;
	
	-- exemplificar o uso do show 
	SHOW TABLES;
	SHOW DATABASES;
	
	-- cadastrar dados em aluno 
	INSERT INTO aluno (ra, nome, cpf, datanascimento, endereco) 
	VALUES(112, "higor", "444908", "1997-11-24", "rua lutecia 145 jd deyse Feraaz de vasconcelos, sao paulo ");
	
	INSERT INTO aluno (ra, nome, cpf, datanascimento, endereco) 
	VALUES(113, "lais", "422908", "1999-11-08", "rua dois 145 ");
	
	--atualizar dados
	UPDATE aluno 
	SET nome_aluno = "higor carlos"
	WHERE Ra = 111;
	
	UPDATE aluno 
	SET nome_aluno = "higor carlos campos", cpf = "5555555"
	WHERE Ra = 111;

	CREATE TABLE aluno2 LIKE aluno;
	INSERT INTO aluno2 SELECT * FROM aluno;
