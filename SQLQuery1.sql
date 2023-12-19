/*
Objetivo da Modelagem:
	Desenvolver um banco de dados para gerenciar informa��es relacionadas a um sistema 
	de streaming de v�deo. O sistema inclui filmes, s�ries, atores, diretores, g�neros, 
	usu�rios e avalia��es.


Regras:

	01. Cada filme ou s�rie tem um ID �nico, nome, ano de lan�amento e uma sinopse.
	02. Cada filme ou s�rie pertence a pelo menos um g�nero (A��o, Drama, Com�dia, etc.).
	03. Um ator pode participar de v�rios filmes e s�ries.
	04. Um diretor � respons�vel por dirigir v�rios filmes ou s�ries.
	05. Os usu�rios podem se cadastrar no sistema, cada um com um ID �nico, 
		nome de usu�rio, endere�o de e-mail e senha.
	06. Cada usu�rio pode avaliar m�ltiplos filmes e s�ries, atribuindo uma classifica��o
		de 1 a 5 estrelas.
	07. Registre a data em que cada avalia��o foi feita.
	08. Um filme ou s�rie pode receber avalia��es de v�rios usu�rios.
	09. Os usu�rios podem adicionar filmes ou s�ries � sua lista de favoritos.
	10. Mantenha o hist�rico de visualiza��o de cada usu�rio, registrando os filmes e 
		s�ries que assistiram e a data em que foram assistidos.
	11. Os filmes ou s�ries podem ser produzidos por diferentes est�dios, cada um com 
		um ID �nico, nome e localiza��o.


Modelagem Conceitual Elaborada:

	Entidade: FilmesSeries
		Atributos: ID_FilmeSerie (Chave Prim�ria), Nome, Ano_Lancamento, Sinopse, Status_Disponibilidade.
		Relacionamentos: FilmesSeriesGeneros, AtoresFilmesSeries, DiretoresFilmesSeries, 
			FilmesSeriesEstudios, Avaliacoes, Favoritos, HistoricoVisualizacao.
	
	Entidade: Generos
		Atributos: ID_Genero (Chave Prim�ria), Nome_Genero.
		Relacionamentos: FilmesSeriesGeneros.
	
	Entidade: Atores
		Atributos: ID_Ator (Chave Prim�ria), Nome_Ator.
		Relacionamentos: AtoresFilmesSeries.
	
	Entidade: Diretores
		Atributos: ID_Diretor (Chave Prim�ria), Nome_Diretor.
		Relacionamentos: DiretoresFilmesSeries.
	
	Entidade: Usuarios
		Atributos: ID_Usuario (Chave Prim�ria), Nome_Usuario, Email.
		Relacionamentos: Avaliacoes, Favoritos, HistoricoVisualizacao.
	
	Entidade: Avaliacoes
		Atributos: ID_Avaliacao (Chave Prim�ria), Classificacao, Data_Avaliacao.
		Relacionamentos: Usuarios, FilmesSeries.
	
	Entidade: Favoritos
		Atributos: ID_Favorito (Chave Prim�ria).
		Relacionamentos: Usuarios, FilmesSeries.
	
	Entidade: HistoricoVisualizacao
		Atributos: ID_Historico (Chave Prim�ria), Data_Visualizacao.
		Relacionamentos: Usuarios, FilmesSeries.
	
	Entidade: Estudios
		Atributos: ID_Estudio (Chave Prim�ria), Nome_Estudio, Localizacao_Estudio.
		Relacionamentos: FilmesSeriesEstudios.
	
	Entidade: FilmesSeriesGeneros
		Atributos: ID_FilmeSerieGenero (Chave Prim�ria).
		Relacionamentos: FilmesSeries, Generos.
	
	Entidade: AtoresFilmesSeries
		Atributos: ID_AtorFilmeSerie (Chave Prim�ria).
		Relacionamentos: Atores, FilmesSeries.
	
	Entidade: DiretoresFilmesSeries
		Atributos: ID_DiretorFilmeSerie (Chave Prim�ria).
		Relacionamentos: Diretores, FilmesSeries.
	
	Entidade: FilmesSeriesEstudios
		Atributos: ID_FilmeSerieEstudio (Chave Prim�ria).
		Relacionamentos: FilmesSeries, Estudios.


Tabelas geradas ap�s estudo de Entidades vs Relacionamentos:

	Tabela: FilmesSeries
		ID_FilmeSerie (Chave Prim�ria)
		Nome
		Ano_Lancamento
		Status_Disponibilidade
		Sinopse
	
	Tabela: Generos
		ID_Genero (Chave Prim�ria)
		Nome_Genero
	
	Tabela: Atores
		ID_Ator (Chave Prim�ria)
		Nome_Ator
	
	Tabela: Diretores
		ID_Diretor (Chave Prim�ria)
		Nome_Diretor
	
	Tabela: Usuarios
		ID_Usuario (Chave Prim�ria)
		Nome_Usuario
		Email
	
	Tabela: Avaliacoes
		ID_Avaliacao (Chave Prim�ria)
		Classificacao
		Data_Avaliacao
		ID_Usuario (Chave Estrangeira referenciando a tabela Usuarios)
		ID_FilmeSerie (Chave Estrangeira referenciando a tabela FilmesSeries)
	
	Tabela: Favoritos
		ID_Favorito (Chave Prim�ria)
		ID_Usuario (Chave Estrangeira referenciando a tabela Usuarios)
		ID_FilmeSerie (Chave Estrangeira referenciando a tabela FilmesSeries)
	
	Tabela: HistoricoVisualizacao
		ID_Historico (Chave Prim�ria)
		ID_Usuario (Chave Estrangeira referenciando a tabela Usuarios)
		ID_FilmeSerie (Chave Estrangeira referenciando a tabela FilmesSeries)
		Data_Visualizacao
	
	Tabela: Estudios
		ID_Estudio (Chave Prim�ria)
		Nome_Estudio
		Localizacao_Estudio
	
	Tabela: FilmesSeriesGeneros
		ID_FilmeSerieGenero (Chave Prim�ria)
		ID_FilmeSerie (Chave Estrangeira referenciando a tabela FilmesSeries)
		ID_Genero (Chave Estrangeira referenciando a tabela Generos)
	
	Tabela: AtoresFilmesSeries
		ID_AtorFilmeSerie (Chave Prim�ria)
		ID_Ator (Chave Estrangeira referenciando a tabela Atores)
		ID_FilmeSerie (Chave Estrangeira referenciando a tabela FilmesSeries)
	
	Tabela: DiretoresFilmesSeries
		ID_DiretorFilmeSerie (Chave Prim�ria)
		ID_Diretor (Chave Estrangeira referenciando a tabela Diretores)
		ID_FilmeSerie (Chave Estrangeira referenciando a tabela FilmesSeries)
	
	Tabela: FilmesSeriesEstudios
		ID_FilmeSerieEstudio (Chave Prim�ria)
		ID_FilmeSerie (Chave Estrangeira referenciando a tabela FilmesSeries)
		ID_Estudio (Chave Estrangeira referenciando a tabela Estudios)

*/

-- Tabela: FilmesSeries
CREATE TABLE DimFilmesSeries (
    ID_FilmeSerie INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Ano_Lancamento INT NOT NULL,
	Status_Disponibilidade VARCHAR(50),
    Sinopse VARCHAR(300) NOT NULL
);

-- Tabela: Generos
CREATE TABLE DimGeneros (
    ID_Genero INT PRIMARY KEY,
    Nome_Genero VARCHAR(255) NOT NULL
);

-- Tabela: Atores
CREATE TABLE DimAtores (
    ID_Ator INT PRIMARY KEY,
    Nome_Ator VARCHAR(255) NOT NULL
);

-- Tabela: Diretores
CREATE TABLE DimDiretores (
    ID_Diretor INT PRIMARY KEY,
    Nome_Diretor VARCHAR(255) NOT NULL
);

-- Tabela: Usuarios
CREATE TABLE DimUsuarios (
    ID_Usuario INT PRIMARY KEY,
    Nome_Usuario VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

-- Tabela: Avaliacoes
CREATE TABLE FactAvaliacoes (
    ID_Avaliacao INT PRIMARY KEY,
    Classificacao INT NOT NULL,
    Data_Avaliacao DATE NOT NULL,
    ID_Usuario INT NOT NULL,
    ID_FilmeSerie INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES DimUsuarios(ID_Usuario),
    FOREIGN KEY (ID_FilmeSerie) REFERENCES DimFilmesSeries(ID_FilmeSerie)
);

-- Tabela: Favoritos
CREATE TABLE FactFavoritos (
    ID_Favorito INT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    ID_FilmeSerie INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES DimUsuarios(ID_Usuario),
    FOREIGN KEY (ID_FilmeSerie) REFERENCES DimFilmesSeries(ID_FilmeSerie)
);

-- Tabela: HistoricoVisualizacao
CREATE TABLE FactHistoricoVisualizacao (
    ID_Historico INT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    ID_FilmeSerie INT NOT NULL,
    Data_Visualizacao DATE,
    FOREIGN KEY (ID_Usuario) REFERENCES DimUsuarios(ID_Usuario),
    FOREIGN KEY (ID_FilmeSerie) REFERENCES DimFilmesSeries(ID_FilmeSerie)
);

-- Tabela: Estudios
CREATE TABLE DimEstudios (
    ID_Estudio INT PRIMARY KEY,
    Nome_Estudio VARCHAR(255) NOT NULL,
    Localizacao_Estudio VARCHAR(255) NOT NULL
);

-- Tabela: FilmesSeriesGeneros
CREATE TABLE FactFilmesSeriesGeneros (
    ID_FilmeSerieGenero INT PRIMARY KEY,
    ID_FilmeSerie INT NOT NULL,
    ID_Genero INT NOT NULL,
    FOREIGN KEY (ID_FilmeSerie) REFERENCES DimFilmesSeries(ID_FilmeSerie),
    FOREIGN KEY (ID_Genero) REFERENCES DimGeneros(ID_Genero)
);

-- Tabela: AtoresFilmesSeries
CREATE TABLE FactAtoresFilmesSeries (
    ID_AtorFilmeSerie INT PRIMARY KEY,
    ID_Ator INT NOT NULL,
    ID_FilmeSerie INT NOT NULL,
    FOREIGN KEY (ID_Ator) REFERENCES DimAtores(ID_Ator),
    FOREIGN KEY (ID_FilmeSerie) REFERENCES DimFilmesSeries(ID_FilmeSerie)
);

-- Tabela: DiretoresFilmesSeries
CREATE TABLE FactDiretoresFilmesSeries (
    ID_DiretorFilmeSerie INT PRIMARY KEY,
    ID_Diretor INT NOT NULL,
    ID_FilmeSerie INT NOT NULL,
    FOREIGN KEY (ID_Diretor) REFERENCES DimDiretores(ID_Diretor),
    FOREIGN KEY (ID_FilmeSerie) REFERENCES DimFilmesSeries(ID_FilmeSerie)
);

-- Tabela: FilmesSeriesEstudios
CREATE TABLE FactFilmesSeriesEstudios (
    ID_FilmeSerieEstudio INT PRIMARY KEY,
    ID_FilmeSerie INT NOT NULL,
    ID_Estudio INT NOT NULL,
    FOREIGN KEY (ID_FilmeSerie) REFERENCES DimFilmesSeries(ID_FilmeSerie),
    FOREIGN KEY (ID_Estudio) REFERENCES DimEstudios(ID_Estudio)
);



-- POPULANDO AS TABELAS COM INFORMA��ES

-- Atores
INSERT INTO DimAtores (ID_Ator, Nome_Ator)
VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Carla Mendes'),
(4, 'David Brown'),
(5, 'Eva White');

-- Diretores
INSERT INTO DimDiretores (ID_Diretor, Nome_Diretor)
VALUES
(1, 'Frank Rodriguez'),
(2, 'Gina Turner'),
(3, 'Harry Martin'),
(4, 'Ivy Simmons'),
(5, 'Jack Nelson');

-- Estudios
INSERT INTO DimEstudios (ID_Estudio, Nome_Estudio, Localizacao_Estudio)
VALUES
(1, 'Stellar Studios', 'Hollywood, CA'),
(2, 'Mystery Productions', 'New York, NY'),
(3, 'Love Films', 'Paris, France'),
(4, 'Mad Scientist Entertainment', 'London, UK'),
(5, 'Dream City Studios', 'Los Angeles, CA');

-- Filmes/S�ries
INSERT INTO DimFilmesSeries (ID_FilmeSerie, Nome, Ano_Lancamento, Sinopse)
VALUES
(1, 'Aventuras no Espa�o', 2010, 'Uma equipe de astronautas enfrenta desafios intergal�cticos.'),
(2, 'Segredos do Passado', 2015, 'Um thriller emocionante sobre mist�rios n�o resolvidos.'),
(3, 'Amor Proibido', 2018, 'Um romance proibido que desafia conven��es sociais.'),
(4, 'O �ltimo Experimento', 2022, 'Um cientista louco realiza experimentos perigosos.'),
(5, 'Cidade dos Sonhos', 2019, 'Drama envolvente sobre aspirantes a artistas em Los Angeles.');

-- G�neros
INSERT INTO DimGeneros (ID_Genero, Nome_Genero)
VALUES
(1, 'Fic��o Cient�fica'),
(2, 'Suspense'),
(3, 'Romance'),
(4, 'Drama'),
(5, 'A��o');


-- Usu�rios
INSERT INTO DimUsuarios (ID_Usuario, Nome_Usuario, Email)
VALUES
(1, 'user1', 'user1@email.com'),
(2, 'cinemalover', 'cinemalover@email.com'),
(3, 'moviebuff', 'moviebuff@email.com'),
(4, 'filmgeek', 'filmgeek@email.com'),
(5, 'avidviewer', 'avidviewer@email.com');

-- AtoresFilmesSeries
INSERT INTO FactAtoresFilmesSeries (ID_AtorFilmeSerie, ID_Ator, ID_FilmeSerie)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Avalia��es
INSERT INTO FactAvaliacoes (ID_Avaliacao, Classificacao, Data_Avaliacao, ID_Usuario, ID_FilmeSerie)
VALUES
(1, 4, '2023-01-10', 1, 1),
(2, 5, '2023-02-15', 2, 2),
(3, 3, '2023-03-20', 3, 3),
(4, 4, '2023-04-25', 4, 4),
(5, 5, '2023-05-30', 5, 5);

-- DiretoresFilmesSeries
INSERT INTO FactDiretoresFilmesSeries (ID_DiretorFilmeSerie, ID_Diretor, ID_FilmeSerie)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Favoritos
INSERT INTO FactFavoritos (ID_Favorito, ID_Usuario, ID_FilmeSerie)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- FilmesSeriesEstudios
INSERT INTO FactFilmesSeriesEstudios (ID_FilmeSerieEstudio, ID_FilmeSerie, ID_Estudio)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- FilmesSeriesGeneros
INSERT INTO FactFilmesSeriesGeneros (ID_FilmeSerieGenero, ID_FilmeSerie, ID_Genero)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- HistoricoVisualizacao
INSERT INTO FactHistoricoVisualizacao (ID_Historico, ID_Usuario, ID_FilmeSerie, Data_Visualizacao)
VALUES
(1, 1, 1, '2023-01-11'),
(2, 2, 2, '2023-02-16'),
(3, 3, 3, '2023-03-21'),
(4, 4, 4, '2023-04-26'),
(5, 5, 5, '2023-05-31');


-- Desativar a verifica��o de chave estrangeira temporariamente
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';

-- Deletar tabelas de Fato
DROP TABLE IF EXISTS dbo.FactAvaliacoes;
DROP TABLE IF EXISTS dbo.FactFavoritos;
DROP TABLE IF EXISTS dbo.FactHistoricoVisualizacao;
DROP TABLE IF EXISTS dbo.FactFilmesSeriesGeneros;
DROP TABLE IF EXISTS dbo.FactAtoresFilmesSeries;
DROP TABLE IF EXISTS dbo.FactDiretoresFilmesSeries;
DROP TABLE IF EXISTS dbo.FactFilmesSeriesEstudios;

-- Deletar tabelas de Dimens�o
DROP TABLE IF EXISTS dbo.DimFilmesSeries;
DROP TABLE IF EXISTS dbo.DimGeneros;
DROP TABLE IF EXISTS dbo.DimAtores;
DROP TABLE IF EXISTS dbo.DimDiretores;
DROP TABLE IF EXISTS dbo.DimUsuarios;
DROP TABLE IF EXISTS dbo.DimEstudios;

-- Ativar a verifica��o de chave estrangeira novamente
EXEC sp_MSforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL';