<%@page errorPage="error.jsp" %>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>

<%-- home.jsp stampa la home del azienda ospedaliera --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/REC-html40/loose.dtd">

<html>

<%
DivisioneBean maininf = (DivisioneBean) request.getAttribute("singoldiv");
Vector vlettipazienti = (Vector) request.getAttribute("lettiepazienti");
Vector vdivisioni = (Vector) request.getAttribute("divisioni");
Vector vdivigestibili = (Vector) request.getAttribute("divisioni_gestibili");

DivisioneBean divisioni;
LettiPazientiBean lettipazienti;
%>		

<!--Inizio la pagina HTML-->

<head>
	<link rel="stylesheet" 
 	type="text/css" 
 	href="./css/Styles.css" /> 
	<title>GestionePostiLettoPage</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
</head>
<body>
	<h1 class="margin"><%=maininf.getNome()%></h1>
	    </br>
    	</br>
    	</br>
    	</br>
	<p class="margin">Pagina per la gestione dei posti letto.</p>
	<ul id="coolMenu">
    		<li><a href="main">Home</a></li>
    		<li><a href="#">Divisioni</a>
        		<ul class="noJS">
 						 <%	for (int i=0; i<vdivisioni.size() ; i++) {
 							divisioni =(DivisioneBean) vdivisioni.get(i);	
                    	 %>
                        <li><a href="main?ps=divisione&nome=<%=divisioni.getNome()%>"><%=divisioni.getNome()%></a></li>
               			<%}%>       		
        		</ul>
    		</li>
    		<li><a href="#">Gestione Posto Letto</a>
        		<ul class="noJS">
 						 <%	for (int i=0; i<vdivigestibili.size() ; i++) {
 							divisioni =(DivisioneBean) vdivigestibili.get(i);	
                    	 %>
                        <li><a href="main?ps=gestione&nome=<%=divisioni.getNome()%>"><%=divisioni.getNome()%></a></li>
               			<%}%>       		
        		</ul>
    		</li>
    		<li><a href="main?ps=logout">logout</a></li>
	</ul>
	</br>
	</br>
	</br>
	</br>
	</br>
	    <div class="one">
		    Nome divisione
	    </div>
	    <div class="two">
		    <%=maininf.getNome()%>
	    </div>
	    </br>
	    <div class="one">
		    Primario
	    </div>
	    <div class="two">
		   <%=maininf.getPrimario()%>
	    </div>
	    </br>
	    <div class="main">
	    <%for (int i=0; i<vlettipazienti.size() ; i++) {
	    	lettipazienti =(LettiPazientiBean) vlettipazienti.get(i);	
         %>
	    	Posto letto numero:<font color="#000000"><%=lettipazienti.getNletto()%></font></br>
	    	Numero stanza: <font color="#000000"><%=lettipazienti.getNstanza()%></font></br>
	        Edificio: <font color="#000000"><%=lettipazienti.getEdificio()%></font></br>
	       	Sistemi di monitoraggio: 
	       	
	       	<%if(lettipazienti.getSistemiMonitor().equals("f")){%>
	       		<font color="#000000">Nessun sistema di monitoraggio</font></br>
		   	<%}else{%>
		   		<font color="#000000">Sono presenti sistema di monitoraggio</font></br>
		   	<%}%>
		   		
		   	<div class="infoBlack">
				<%if(lettipazienti.getCodSanitario() != null){%>	       		
	        		Nome paziente: <font color="#000000"><%=lettipazienti.getNome()%></font></br>
	        		Cognome paziente: <font color="#000000"><%=lettipazienti.getCognome()%></font></br>
	        		Codice Sanitario: <font color="#000000"><%=lettipazienti.getCodSanitario()%></font></br>
	        		Luogo di Nascita: <font color="#000000"><%=lettipazienti.getLuogoNasicita()%></font></br>
	        		Data di Nascita <font color="#000000"><%=lettipazienti.getDataNascita()%></font></br>
	    			Data inizio ricovero <font color="#000000"><%=lettipazienti.getDataIn()%></font></br>
	    			Data fine ricovero <font color="#000000"><%=lettipazienti.getDataFin()%></font></br>
	    		<%}else{%>  
	    			 <a href="main?ps=occupazione&nome=<%=maininf.getNome()%>&letto=<%=lettipazienti.getNletto()%>">Gestisci letto</a></br>
	    		<%}%>  
	    		</div>
	    		
	    	<%}%>  
    	</div>
	</br>
	</br>
</body>
</html>