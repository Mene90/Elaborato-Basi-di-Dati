/* create_tables.sql */

/* elimino le tabelle se sono già state create */



DROP TABLE ricovero;
DROP TABLE paziente;
DROP TABLE contegio_mensile;
DROP TABLE costo_annuo;
DROP TABLE utente_divisione;
DROP TABLE utente;
DROP TABLE posto_letto;
DROP TABLE divisione;

DROP DOMAIN TIPODIVISIONE;


CREATE DOMAIN TIPODIVISIONE as CHAR(1)
CHECK(VALUE IN ( 'N' , 'A' ));


/* creo le tabelle */
CREATE TABLE utente (
  login VARCHAR(15) PRIMARY KEY,
  pass VARCHAR(30) NOT NULL
  /* la password deve essere almeno lunga 6 caratteti */
  CHECK(char_length(pass) >= 6)
);

CREATE TABLE divisione (
  nome VARCHAR(60) PRIMARY KEY,
  localita VARCHAR(30) NOT NULL,
  via VARCHAR(30) NOT NULL,
  civico INTEGER NOT NULL,
  citta VARCHAR(30) NOT NULL,
  primario VARCHAR(30) NOT NULL,
  n_tel VARCHAR(10) NOT NULL,
  tipo TIPODIVISIONE NOT NULL,
  orario_apertura TIME,
  orario_chiusura TIME
  
  CHECK(civico >= 1 and civico<=400)
);

 CREATE TABLE utente_divisione (
  username VARCHAR(15) REFERENCES utente(login) ON DELETE CASCADE ON UPDATE CASCADE,
  divisione VARCHAR(60) REFERENCES divisione(nome) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(username,divisione)
);

CREATE TABLE posto_letto (
  n_letto INTEGER,
  divisione VARCHAR(60) REFERENCES divisione(nome) ON DELETE CASCADE ON UPDATE CASCADE,
  n_stanza VARCHAR(30) NOT NULL,
  piano VARCHAR(2) NOT NULL,
  edificio VARCHAR(30) NOT NULL, 
  sis_monitor BOOLEAN NOT NULL,
  PRIMARY KEY(n_letto, divisione)
);

CREATE TABLE paziente (
  /* Il codice fiscale ha 16 caratteri per le persone fisiche*/
  cod_sanitario CHAR(16) PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  cognome VARCHAR(30) NOT NULL,
  data_nascita DATE NOT NULL,
  luogo_nascita VARCHAR(30) NOT NULL,
  regione VARCHAR(30) NOT NULL,
  provincia VARCHAR(30) NOT NULL
);

CREATE TABLE ricovero (
  letto INTEGER,
  divisione VARCHAR(60),
  cod_sanitario CHAR(16) REFERENCES paziente (cod_sanitario) ON DELETE CASCADE ON UPDATE CASCADE,
  data_in DATE,
  data_fin  DATE,
  PRIMARY KEY(letto, divisione,cod_sanitario, data_in),
  FOREIGN KEY(letto,divisione) REFERENCES posto_letto (n_letto,divisione) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE contegio_mensile (
  divisione VARCHAR(60) REFERENCES divisione(nome) ON DELETE CASCADE ON UPDATE CASCADE,
  anno CHAR(4),
  mese INTEGER NOT NULL,
  occupati_1_3 INTEGER NOT NULL,
  occupati_1 INTEGER NOT NULL,
  occupati_3 INTEGER NOT NULL,
  CHECK(mese > 0 and mese <13),
  PRIMARY KEY(divisione,anno,mese)
  
);

CREATE TABLE costo_annuo (
  divisione VARCHAR(60), 
  anno CHAR(4),
  prezzo INTEGER NOT NULL,
  PRIMARY KEY(divisione,anno)
);

