CREATE SCHEMA traslados;
USE traslados;

CREATE TABLE Cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	fecha_traslado DATE NOT NULL,
	id_obra_social VARCHAR (50) NULL,
	id_ART VARCHAR(50) NULL,
	nombre_apellido VARCHAR(1300) NOT NULL,
	nro_traslado INT NULL,
	tipo_traslado VARCHAR(20) NOT NULL,
	Km_totales INT NULL,
	total INT NULL
);

CREATE TABLE Paciente (
id_paciente INT AUTO_INCREMENT PRIMARY KEY,
nombre_apellido VARCHAR(1300) NOT NULL
);

CREATE TABLE obra_Social (
	id_obra_social INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL
);

CREATE TABLE ART (
	id_art INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL
);

CREATE TABLE traslado (
	id_traslado INT AUTO_INCREMENT PRIMARY KEY,
	desde VARCHAR(1300) NOT NULL,
	hasta VARCHAR(1300) NOT NULL,
	sin_retorno VARCHAR(1300) NOT NULL,
	con_retorno VARCHAR(1300) NOT NULL,
    id_paciente INT NOT NULL,
	id_obra_social INT,
	id_art INT,
	id_cliente INT NOT NULL
);

CREATE TABLE servicio (
	id_servicio INT AUTO_INCREMENT PRIMARY KEY,
	alta_sin_medico VARCHAR(20) NULL,
	alta_con_medico VARCHAR(20) NULL,
	derivacion_sin_medico VARCHAR(20) NULL,
	derivacion_con_medico VARCHAR(20) NULL,
	turno_sin_medico VARCHAR(20) NULL,
	turno_con_medico VARCHAR(20) NULL
);

ALTER TABLE traslado ADD CONSTRAINT fk_traslado_paciente
	FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente);

ALTER TABLE traslado ADD CONSTRAINT fk_traslado_obra_social
	FOREIGN KEY (id_obra_social) REFERENCES obra_Social(id_obra_social);

ALTER TABLE traslado ADD CONSTRAINT fk_traslado_art
	FOREIGN KEY (id_art) REFERENCES ART(id_art);

ALTER TABLE traslado ADD CONSTRAINT fk_traslado_cliente
	FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente);
