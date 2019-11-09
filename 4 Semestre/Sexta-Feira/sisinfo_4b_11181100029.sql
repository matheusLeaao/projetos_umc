--Matheus Leão da Costa Pereira 11181100029

-- Exercício_1
CREATE TABLE autor(
  id_autor INT NOT NULL,
  nome VARCHAR(60),
  CONSTRAINT pk_autor PRIMARY KEY (id_autor)
);

CREATE TABLE livraria(
  id_livraria INT NOT NULL,
  nome VARCHAR(50),
  CONSTRAINT pk_livraria PRIMARY KEY(id_livraria)
);

CREATE TABLE livro (
  id_livro INT NOT NULL,
  titulo VARCHAR(60),
  numero_livraria INT NOT NULL,
  id_autor INT NOT NULL,
  CONSTRAINT pk_livro PRIMARY KEY (id_livro),
  CONSTRAINT fk_autor FOREIGN KEY(id_autor) REFERENCES autor (id_autor)
);

CREATE TABLE oferta (
  id_oferta INT NOT NULL,
  preco NUMERIC(4,2),
  fk_livro INT NOT NULL,
  fk_livraria INT NOT NULL,
  CONSTRAINT pk_oferta PRIMARY KEY(id_oferta),
  CONSTRAINT fk_livro FOREIGN KEY(fk_livro) REFERENCES livro (id_livro),
  CONSTRAINT fk_livraria FOREIGN KEY (fk_livraria) REFERENCES livraria (id_livraria)
);

--Exercício_2
CREATE SEQUENCE seq_autor INCREMENT 1 START 1;
CREATE SEQUENCE seq_livraria INCREMENT 1 START 1;
CREATE SEQUENCE seq_livro INCREMENT 1 START 1;
CREATE SEQUENCE seq_oferta INCREMENT 1 START 1;
--Exercício_3
INSERT INTO autor VALUES (nextval('seq_autor'), 'Stephen King'),(nextval('seq_autor'), 'Dan Brown'),(nextval('seq_autor'), 'Machado de Assis');
INSERT INTO livraria VALUES (nextval('seq_livraria'), 'LER'),(nextval('seq_livraria'), 'Livraria Boigy'), (nextval('seq_livraria'), 'Livraria Cultura');
INSERT INTO livro VALUES (nextval('seq_livro'), 'Sob a Redoma', 50,2), (nextval('seq_livro'), 'O Codigo da Vinci', 100,1),(nextval('seq_livro'), 'Dom Casmurro', 5,2);
INSERT INTO oferta VALUES (nextval('seq_oferta'), 50.00,1,2),(nextval('seq_oferta'), 47.90,2,1),(nextval('seq_oferta'), 80.50,3,2);

--Exercício_4
CREATE VIEW vw_livaria AS SELECT * FROM livraria RIGHT JOIN livro l on id_livraria = l.numero_livraria ORDER BY livraria.nome;

--Exercício_5
CREATE FUNCTION reposicao_livro (NUMERIC (5), VARCHAR (100)) 
	RETURNS void AS
'
    INSERT INTO livro (id_livro, titulo) VALUES ($1, $2);
 
'
LANGUAGE'sql';

CREATE FUNCTION retirada_livro (NUMERIC (5))
	RETURNS void AS
'
    DELETE FROM livro WHERE id_livro =$1;
'
LANGUAGE'sql';;

--Exercício_6
CREATE OR REPLACE FUNCTION FbuscandoMenorValor(VARCHAR(60)) RETURNS VARCHAR(60) AS
'
	BEGIN
	RETURN(	SELECT lvr.nome 
		FROM oferta ofe 
		LEFT JOIN livraria lvr ON ofe.fk_livraria = id_livaria
		LEFT JOIN livro liv on ofe.fk_livro = liv.ld_livro
	WHERE liv.titulo = $1 ORDER BY preco);
    end;
'
LANGUAGE 'plpgsql';