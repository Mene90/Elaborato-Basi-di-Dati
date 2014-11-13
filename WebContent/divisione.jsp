<%@page errorPage="error.jsp" %>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>

<%-- divisione.jsp stampa le informazioni della divisione selezionata --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
<%
Vector v = (Vector) request.getAttribute("divisioni");
Vector dg = (Vector) request.getAttribute("divisioni_gestibili");
DivisioneBean singoldiv = (DivisioneBean) request.getAttribute("singoldiv");
String divi = (String) request.getAttribute("letti_occupati");
int logU = (Integer)request.getAttribute("logU");

DivisioneBean divb;
%>

<!--Inizio la pagina HTML-->

<head>
	<link rel="stylesheet" 
 	type="text/css" 
 	href="./css/Styles.css" /> 
	<title>DivisionePage</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
</head>
<body>
	<h1 class="margin"><%=singoldiv.getNome()%></h1>
    	</br>
    	</br>
    	</br>
    	</br>
	<p class="margin">In questa pagina puoi trovare facilmente informazioni sulle nostre divisioni.</p>
	<ul id="coolMenu">
    		<li><a href="main">Home</a></li>
    		<li>
        	<a href="#">Divisioni</a>
        		<ul class="noJS">
 						 <%	for (int i=0; i<v.size() ; i++) {
								divb =(DivisioneBean) v.get(i);	
                    	 %>
                         <li><a href="main?ps=divisione&nome=<%=divb.getNome()%>"><%=divb.getNome()%></a></li>
               			<%}%>       		
        		</ul>
    		</li>
    		<%if(logU == 1){%>
    		<li><a href="#">Gestione Posto Letto</a>
    			<ul class="noJS">
 						 <%	for (int i=0; i<dg.size() ; i++) {
								divb =(DivisioneBean) dg.get(i);	
                    	 %>
                        <li><a href="main?ps=gestione&nome=<%=divb.getNome()%>"><%=divb.getNome()%></a></li>
               			<%}%>       		
        		</ul>
    		</li>
			<li><a href="main?ps=logout">logout</a></li>
			<%}else{%>
			<li class="login"><a href="#">Login</a>
    			<ul class="noJS" align="right">
					<form action="main?ps=login" method="post">
						<b>Login </b><input name="login" type="text" align="right"></br>
					    <b>Password </b><input name="pass" type="password" align="right">
						<input type="submit" value="accedi">
						</form>
				</ul>
			<%}%>
			</li>	    	
   			
	</ul>
	</br>
	</br>
	</br>
	</br>
	</br>
	<div class="main">
	<div class="one">
		Nome divisione
	</div>
	<div class="two">
		<%=singoldiv.getNome()%>
	</div>
	</br>
	<div class="one">
		Indirizzo
	</div>
	<div class="two">
		<%=singoldiv.getVia()%> n° <%=singoldiv.getCivico()%>
	</div>
	</br>
	<div class="one">
		Citt&agrave;
	</div>
	<div class="two">
		<%=singoldiv.getCitta()%>
	</div>
	</br>
	<div class="one">
		Primario
	</div>
	<div class="two">
		<%=singoldiv.getPrimario()%>
	</div>
	</br>
	<div class="one">
		Telefono
	</div>
	<div class="two">
		<%=singoldiv.getTelefono()%>
	</div>
	</br>
	<div class="one">
		Posti letto
	</div>
	<div class="two">
		<%=singoldiv.getPosti_letto()%>
	</div>
	</br>
	<div class="one">
		n° letti occupati
	</div>
	<div class="two">
		<%if(divi == null){%>
			Nessun letto occupato
		<%}else{%>
			<%=divi%>
		<%}%>		  
	</div>
	
	<%if(singoldiv.getTipo().equals("A")){%>
	</br>
	<div class="one">
		Orari ambulatorio
	</div>
	<div class="two">
		Orario apertura:<%=singoldiv.getOrario_apertura()%>
	</br>
		Orario chiusura:<%=singoldiv.getOrario_chiusura()%>
	</br>	  
	</div>
	<%}%>
	</div>
	</br>
	</br>
</body>
</html>