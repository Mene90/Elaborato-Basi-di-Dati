/* popola.sql */

/*Inserimento delle divisioni*/
INSERT INTO divisione (nome, localita, via, civico, citta, primario, n_tel, tipo, orario_apertura, orario_chiusura)
VALUES ('Pronto Soccorso','Verona','via Ospedale','34','Verona','dott. Ignazio Dei','045 991521', 'N',null,null);
INSERT INTO divisione (nome, localita, via, civico, citta, primario, n_tel, tipo, orario_apertura, orario_chiusura)
VALUES ('Reparto di ostetricia e ginecologia','Verona','via Ospedale','34','Verona','dott. Enea Atzori','045 991522','N',null,null);
INSERT INTO divisione (nome, localita, via, civico, citta, primario, n_tel, tipo, orario_apertura, orario_chiusura)
VALUES ('Servizio di recupero e riabilitazione funzionale','Verona','via Ospedale','34','Verona','dott. Ignazio Dei','045 993521','A','08:00:00','19:00:00');

/*Inserimento degli user e password*/
INSERT INTO utente( login, pass)
VALUES ('id5578', 'rcm1235');
INSERT INTO utente( login, pass)
VALUES ('id5579', 'rcm4564');
INSERT INTO utente( login, pass)
VALUES ('id5580', 'rcm8973');
INSERT INTO utente( login, pass)
VALUES ('id5581', 'rcm8902');
INSERT INTO utente( login, pass)
VALUES ('id5582', 'rcm4781');

/*Inserimento dei collegamenti utente - divisine*/
INSERT INTO utente_divisione( username, divisione)
VALUES ('id5578', 'Pronto Soccorso');
INSERT INTO utente_divisione( username, divisione)
VALUES ('id5578', 'Reparto di ostetricia e ginecologia');
INSERT INTO utente_divisione( username, divisione)
VALUES ('id5578', 'Servizio di recupero e riabilitazione funzionale');
INSERT INTO utente_divisione( username, divisione)
VALUES ('id5579', 'Pronto Soccorso');
INSERT INTO utente_divisione( username, divisione)
VALUES ('id5579', 'Servizio di recupero e riabilitazione funzionale');
INSERT INTO utente_divisione( username, divisione)
VALUES ('id5580', 'Pronto Soccorso');
INSERT INTO utente_divisione( username, divisione)
VALUES ('id5580', 'Reparto di ostetricia e ginecologia');
INSERT INTO utente_divisione( username, divisione)
VALUES ('id5581', 'Pronto Soccorso');
INSERT INTO utente_divisione( username, divisione)
VALUES ('id5581', 'Servizio di recupero e riabilitazione funzionale');
INSERT INTO utente_divisione( username, divisione)
VALUES ('id5582', 'Servizio di recupero e riabilitazione funzionale');

/*Inserimento dei letti per divisione*/
/*Inserimento dei letti per divisione 'Pronto Soccorso'*/
INSERT INTO posto_letto(n_letto, divisione,n_stanza,piano,edificio,sis_monitor)
VALUES ('1', 'Pronto Soccorso','A10','0','A',true);
INSERT INTO posto_letto(n_letto, divisione,n_stanza,piano,edificio,sis_monitor)
VALUES ('2', 'Pronto Soccorso','A11','0','A',true);
INSERT INTO posto_letto(n_letto, divisione,n_stanza,piano,edificio,sis_monitor)
VALUES ('3', 'Pronto Soccorso','A12','1','A',true);
INSERT INTO posto_letto(n_letto, divisione,n_stanza,piano,edificio,sis_monitor)
VALUES ('4', 'Pronto Soccorso','A13','1','A',false);

/*Inserimento dei letti per divisione 'Servizio di recupero e riabilitazione funzionale'*/
INSERT INTO posto_letto(n_letto, divisione,n_stanza,piano,edificio,sis_monitor)
VALUES ('1', 'Servizio di recupero e riabilitazione funzionale','B10','0','B',false);
INSERT INTO posto_letto(n_letto, divisione,n_stanza,piano,edificio,sis_monitor)
VALUES ('2', 'Servizio di recupero e riabilitazione funzionale','B11','0','B',false);

/*Inserimento dei letti per divisione 'Reparto di ostetricia e ginecologia'*/
INSERT INTO posto_letto(n_letto, divisione,n_stanza,piano,edificio,sis_monitor)
VALUES ('1', 'Reparto di ostetricia e ginecologia','C10','2','C',true);
INSERT INTO posto_letto(n_letto, divisione,n_stanza,piano,edificio,sis_monitor)
VALUES ('2', 'Reparto di ostetricia e ginecologia','C11','2','C',true);
INSERT INTO posto_letto(n_letto, divisione,n_stanza,piano,edificio,sis_monitor)
VALUES ('3', 'Reparto di ostetricia e ginecologia','C12','2','C',true);
INSERT INTO posto_letto(n_letto, divisione,n_stanza,piano,edificio,sis_monitor)
VALUES ('4', 'Reparto di ostetricia e ginecologia','C13','2','C',true);

/*Inserimento Pazienti*/
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('BBTSLL72T70Z110M', 'Isabella','Abatte','30/12/1972','Negrar','Veneto','Verona');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('BCLMRC67R21B157F', 'Marco','Abecolli','21/10/1967','Negrar','Veneto','Verona');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('BRHMTN68D19A952A', 'Luca','Martin','19/04/1968','Borgo Trento','Veneto','Verona');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('GGARRT69A69G914Z', 'Roberta','Adami','29/01/1969','Negrar','Veneto','Verona');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('GSTMRZ65T19L378K', 'Maurizio','Agostini','19/12/1965','Negrar','Veneto','Verona');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('BBLNCL71A15B564S', 'Nicola','Babolin','15/01/1971','Borgo Roma','Veneto','Verona');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('BSSMTT81D16L736I', 'Matteo','Basso','25/02/1980','Negrar','Veneto','Verona');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('BTTBRN70M01Z114V', 'Bruno','Battisti','30/08/1980','San Rafaele','Lombardia','Milano');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('BTTVNI69T46C743N', 'Ivana','Battistini','30/12/1972','Negrar','Veneto','Verona');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('BVLMRC62R18C743S', 'Mirco','Bevilacqua','18/08/1962','Negrar','Veneto','Verona');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('BNCRRT56A13F132Z', 'Roberto','Bianco','30/12/1984','Negrar','Veneto','Verona');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('BNCCHR64C70E522G', 'Chiara','Bianconi','09/02/1964','Negrar','Veneto','Verona');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('BNCMNL76L47F770J', 'Manuela','Bianco','01/05/1984','Negrar','Veneto','Verona');
INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia)
VALUES ('BNCRLF66C20Z133E', 'Rodolfo','Bianco','04/11/1972','Negrar','Veneto','Verona');





