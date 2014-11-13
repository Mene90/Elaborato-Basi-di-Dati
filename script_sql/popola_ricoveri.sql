/* 
 Inserimento ricoveri con data casuale
*/
/*set datestyle to 'sql,european';*/


DO $$
DECLARE
  l INTEGER;
  d VARCHAR(60);
  cs CHAR(30);
  i INTEGER;
  vincolo INTEGER;
  vincolo2 INTEGER;
  limite INTEGER;
  contatore INTEGER;
  ini DATE;
  fine DATE;
BEGIN
	FOR cs IN select cod_sanitario from paziente
	LOOP
	   
	   limite :=  ROUND(RANDOM() * 30);
	   
	   FOR i IN  1..limite
	   LOOP
			d := (SELECT nome FROM divisione ORDER BY RANDOM() LIMIT 1);
			l := (SELECT n_letto FROM divisione div inner join posto_letto pos  ON (div.nome=pos.divisione) WHERE div.nome=d  ORDER BY RANDOM() LIMIT 1);

			
			ini := (SELECT NOW() - '1 year'::INTERVAL * ROUND(RANDOM() * 10));
			ini := ini + (ROUND(RANDOM() * 150) - ROUND(RANDOM() * 150))::INTEGER;
			fine := ini + (ROUND(RANDOM() * 50) - ROUND(RANDOM() * 50))::INTEGER;
			
			WHILE ini>fine
			LOOP
			
				ini := (SELECT NOW() - '1 year'::INTERVAL * ROUND(RANDOM() * 2));
			    ini := ini + (ROUND(RANDOM() * 50) - ROUND(RANDOM() * 150))::INTEGER;
			    fine := ini + (ROUND(RANDOM() * 150) - ROUND(RANDOM() * 50))::INTEGER;
			    
			END LOOP;
			
			vincolo := (SELECT count(*) FROM ricovero WHERE letto=l and divisione=d and cod_sanitario=cs and data_in = ini);
			vincolo2 := (SELECT count(*) FROM ricovero r WHERE r.letto=l and r.divisione=d and EXISTS(SELECT * FROM ricovero r1
			WHERE (ini<=r1.data_in and fine>=r1.data_in) or 
				  (ini<=r1.data_fin and fine>=r1.data_fin) or
				  (ini>=r1.data_in and fine<=r1.data_fin)));
			
			contatore:=0;
			
			WHILE ((vincolo > 0 or vincolo2 > 0) and contatore<500)
			LOOP
				
				contatore:= contatore+1;
				
				d := (SELECT nome FROM divisione ORDER BY RANDOM() LIMIT 1);
				l := (SELECT n_letto FROM divisione div inner join posto_letto pos ON (div.nome=pos.divisione) WHERE div.nome=d  ORDER BY RANDOM() LIMIT 1);
				
				ini := (SELECT NOW() - '1 year'::INTERVAL * ROUND(RANDOM() * 10));
				fine := ini + 1 + ROUND(RANDOM() * 60)::INTEGER;
				vincolo := (SELECT count(*) FROM ricovero WHERE letto=l and divisione=d and cod_sanitario=cs and data_in = ini);
				vincolo2 := (SELECT count(*) FROM ricovero r WHERE r.letto=l AND 
							 r.divisione=d AND EXISTS (SELECT * FROM ricovero r1
							 WHERE r1.divisione=d and r1.letto=l and (ini<=r1.data_in and fine>=r1.data_in) or 
								   (ini<=r1.data_fin and fine>=r1.data_fin) or
								   (ini>=r1.data_in and fine<=r1.data_fin)));
							 
			END LOOP;
			
			IF(contatore<100) THEN
			
				INSERT INTO ricovero (letto, divisione, cod_sanitario, data_in, data_fin)
				VALUES (l,d,cs,ini,fine);
			
			END IF;
		END LOOP;		
	END LOOP;
END$$
