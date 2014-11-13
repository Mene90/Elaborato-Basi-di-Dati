
DO $$
DECLARE 
i INTEGER;
d VARCHAR(60);
prezzo INTEGER;

BEGIN
FOR i IN 2000..2014
LOOP
	FOR d IN SELECT nome FROM divisione order by nome
	LOOP
		    prezzo := 90 + ROUND(RANDOM() * 100)::INTEGER;	
			INSERT INTO costo_annuo (divisione, anno, prezzo)
			VALUES (d,i,prezzo);
			
	END LOOP;
END LOOP;

END$$

