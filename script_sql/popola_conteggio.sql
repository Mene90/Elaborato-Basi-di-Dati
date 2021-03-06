/*set datestyle to 'sql,european';*/


DO $$
DECLARE
  d VARCHAR(60);
  i INTEGER;
  j INTEGER;
  menodi1 INTEGER;
  tra1e3 INTEGER;
  piudi3 INTEGER;
  l INTEGER;
  ini DATE;
  fine DATE;
  diff_mesi INTEGER;
  totgiorni INTEGER;
    
BEGIN
	
			FOR i IN 2000..2014
			LOOP			
				FOR j IN 1..12
				LOOP
					FOR d IN select nome from divisione
					LOOP
					
					menodi1:=0;
					tra1e3:=0;
					piudi3:=0;
					
						FOR l IN select n_letto from posto_letto po inner join divisione di on po.divisione = di.nome where di.nome=d
						LOOP
							
							totgiorni := 0;
							
							FOR ini,fine in select data_in, data_fin from ricovero where divisione = d and letto = l 
							and EXTRACT(YEAR FROM data_in) = i
							order by letto, divisione, data_in
							LOOP
							
								IF(j >= date_part('month',ini)::INTEGER and j<= date_part('month',fine)::INTEGER )
								THEN
						
									IF(j = date_part('month',ini)::INTEGER and j=date_part('month',fine)::INTEGER )  
									THEN
						
										totgiorni := totgiorni + (fine - ini)::INTEGER;
						
									ELSEIF(j = date_part('month', ini)::INTEGER and j <> date_part('month',fine)::INTEGER)
									THEN
										WHILE j <> date_part('month',fine)::INTEGER
										LOOP
											fine = fine - date_part('day', fine)::INTEGER;
										END LOOP;
										
										totgiorni := totgiorni + (fine - ini)::INTEGER;
						
									ELSEIF(j <> date_part('month',ini)::INTEGER and j=date_part('month',fine)::INTEGER)
									THEN
										totgiorni := totgiorni + date_part('day', fine)::INTEGER;	
							
									ELSEIF(j <> date_part('month',ini)::INTEGER and j<>date_part('month',fine)::INTEGER)
									THEN
										WHILE j <> date_part('month',fine)::INTEGER
										LOOP
											fine = fine - date_part('day', fine)::INTEGER;
										END LOOP;
						    
									totgiorni := totgiorni + date_part('day', fine)::INTEGER;		
						
									END IF;
					
								END IF;
							
							END LOOP;
							
							IF (totgiorni < 8) 
							THEN
								menodi1 := menodi1+1;						
							ELSIF (totgiorni > 7 and totgiorni < 22)
							THEN
								tra1e3 := tra1e3+1;					
							ELSE					
								piudi3 := piudi3 +1;
							END IF;	
			
						END LOOP;
						
					INSERT INTO contegio_mensile (divisione, anno, mese, occupati_1_3, occupati_1 , occupati_3)
					VALUES (d,i,j,tra1e3,menodi1,piudi3);
					
					END LOOP;
				END LOOP;
			END LOOP;
	
END$$
