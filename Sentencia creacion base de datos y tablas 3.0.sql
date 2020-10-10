create database dbTriage;

use dbTriage;

CREATE TABLE persona(
    docidentidad INTEGER,
     mail VARCHAR(50) NOT NULL,
     nombres VARCHAR(25) NOT NULL,
     apellidos VARCHAR(25) NOT NULL,
     calle VARCHAR(30) ,
     numero VARCHAR(8),
     barrio VARCHAR(25) ,
     esquina VARCHAR(30) ,
     apartamento VARCHAR(5) ,
     fechaNacimiento DATE NOT NULL,
     activo BOOLEAN  NOT NULL DEFAULT TRUE,
     fechaRegistro TIMESTAMP NOT NULL,
     PRIMARY KEY (docidentidad),
     UNIQUE KEY(mail)
);

CREATE  TABLE telefono(
    docidentidad INTEGER,
    telefono VARCHAR(11) NOT NULL,
    PRIMARY KEY (docidentidad, telefono),
    FOREIGN KEY (docidentidad) REFERENCES persona(docidentidad)
);

CREATE TABLE administrativo(
    docidentidad INTEGER,
    ndeempleado INTEGER NOT NULL,
    PRIMARY KEY(docidentidad),
    FOREIGN KEY(docidentidad) REFERENCES persona(docidentidad),
    UNIQUE KEY(ndeempleado)
);

CREATE TABLE medico(
    docidentidad INTEGER,
    ndemedico INTEGER NOT NULL,
    PRIMARY KEY(docidentidad),
    FOREIGN key(docidentidad) REFERENCES persona(docidentidad),
    UNIQUE key(ndemedico)
);

CREATE TABLE paciente (
    docidentidad INTEGER,
    PRIMARY KEY(docidentidad),
    FOREIGN KEY(docidentidad) REFERENCES persona(docidentidad)
);

CREATE TABLE preexistentes(
    docidentidad INTEGER,
    preexistente VARCHAR(40) NOT NULL,
    PRIMARY KEY(docidentidad, preexistente),
    FOREIGN KEY(docidentidad) REFERENCES paciente(docidentidad)
);

CREATE TABLE sesion(
    idSesion INTEGER,
    estado ENUM('0','1','2','3','4') DEFAULT '0',
    fechaHoraInicioSesion TIMESTAMP,
    prioridad INTEGER NOT NULL,
    PRIMARY KEY(idSesion)
);

CREATE TABLE sintoma(
    id INTEGER  AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    PRIMARY KEY(id)
);

CREATE TABLE patologia(
    id INTEGER AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    ponderacion INTEGER NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    activo  BOOLEAN DEFAULT TRUE,
    PRIMARY KEY(id)
);

CREATE TABLE chat(
    id INTEGER AUTO_INCREMENT,
    docidentidadPaciente INTEGER DEFAULT 0, 
    docidentidadMedico INTEGER DEFAULT 0, 
    idSesion INTEGER NOT NULL, 
    fechaHora TIMESTAMP NOT NULL, 
    emisor ENUM("P", "M"),
    mensaje VARCHAR(80) NOT NULL,
    leido BOOLEAN DEFAULT FALSE,
    PRIMARY KEY(id, docidentidadPaciente, docidentidadMedico, idSesion),
    FOREIGN KEY(docidentidadPaciente) REFERENCES paciente(docidentidad),
    FOREIGN KEY(docidentidadMedico) REFERENCES medico(docidentidad),
    FOREIGN KEY(idSesion) REFERENCES sesion(idSesion)
);

CREATE TABLE diagnostico(
    id INTEGER,
    prioridad INTEGER NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE recibe(
   idDiagnostico INTEGER,
   idPaciente INTEGER,
   fechaHora TIMESTAMP,
   PRIMARY KEY(idDiagnostico, idPaciente, fechaHora),
   FOREIGN KEY(idDiagnostico) REFERENCES diagnostico(id),
   FOREIGN KEY(idPaciente) REFERENCES paciente(docidentidad)
);

CREATE TABLE tiene(
   idDiagnostico INTEGER,
   idPatologia INTEGER,
   idSintoma INTEGER,
   PRIMARY KEY(idDiagnostico, idPatologia, idSintoma),
   FOREIGN KEY(idDiagnostico) REFERENCES diagnostico(id),
   FOREIGN KEY(idPatologia) REFERENCES patologia(id),
   FOREIGN KEY(idSintoma) REFERENCES sintoma(id)
);

CREATE TABLE asociados(
    idPatologia INTEGER,
    IdSintoma INTEGER,
    PRIMARY KEY(idPatologia, idSintoma),
    FOREIGN KEY(idPatologia) REFERENCES patologia(id),
    FOREIGN KEY(idSintoma) REFERENCES sintoma(id)
);

CREATE TABLE setting(
    id INTEGER AUTO_INCREMENT,
    cantSintomas INTEGER,
    ipGestion VARCHAR(15),
    ipMedicos VARCHAR(15),
    ipPacientes VARCHAR(15),
    emailContacto VARCHAR(60),
    emailPuertoSMTP INTEGER,
    emailServidorSMPT VARCHAR(50),
    emailSSL BOOLEAN,
    emailCredencial VARCHAR(40),
    docIdentidad INTEGER,
    ultimaModificacion TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(docidentidad) REFERENCES administrativo(docidentidad)
);