<%@page errorPage="error.jsp" %>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>

<%-- home.jsp stampa la home del azienda ospedaliera --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/REC-html40/loose.dtd">
<html>

<%
int logU = (Integer) request.getAttribute("logU");
Vector v = (Vector) request.getAttribute("divisioni");
Vector dg = (Vector) request.getAttribute("divisioni_gestibili");

DivisioneBean divb;
%>		

<!--Inizio la pagina HTML-->

<head>
	<link rel="stylesheet" 
 	type="text/css" 
 	href="./css/Styles.css" /> 
	<title>Home Page</title>
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
	<script type="text/javascript">
	
 	$(function() {
		/* For zebra striping */
        $("table tr:nth-child(odd)").addClass("odd-row");
		/* For cell text alignment */
		$("table td:first-child, table th:first-child").addClass("first");
		/* For removing the last border */
		$("table td:last-child, table th:last-child").addClass("last");
	});
 	
	</script>
</head>
<body>
	<h1 class="margin"> home page!</h1>
    	</br>
    	</br>
    	</br>
    	</br>
	<p class="margin">La nostra azienda sanitaria ha istituito un nuovo sito! Per saperne di pi&ugrave; dai un occhiata alle pagine relative alle nostre divisioni.</p>
	<ul id="coolMenu">
    		<li><a href="main">Home</a></li>
    		<li><a href="#">Divisioni</a>
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
					<form action="main" method="post">
						<input name="ps" type="hidden" value="login" />
						<b>Login </b><input name="login" type="text" align="right"></br>
					    <b>Password </b><input name="pass" type="password" align="right">
						<input type="submit" value="accedi">
					</form>
				</ul>
				
			<%
			if(logU == 2){
			%>
			</br> <script> 
			ErrorePassword(); 
			window.location = "main";
			</script>
			
			<%
			}else if(logU == 3){
			%>
		    </br> <script> 
		    sessioneScadutta();
		    window.location = "main";
		    </script>
			<%}%>
			<%}%>
			</li>	    	
	</ul>
	
	</br>
	</br>
    	</br>
    	</br>
    	<p class="presentation">La nostra azienda sanitaria da anni si occupa della gestione dei posti letto delle nostre divisioni</br>garantendo ogni giorno ai nostri clienti la massima disponibilit&agrave e trasparenza.</p>
    	</br>
    	<p class="presentation">Abbiamo istituito questo sito web per aiutare i nostri clienti nella ricerca delle informazioni sui nostri dipartimenti e sui nostri posti letto.</p>
	</br>
	</br>
    	</br>
    	</br>
	<p class="margin">Di seguito potete trovare la lista delle nostre divisioni:</p>
	<div id="content">
	</br>
    	<table cellspacing="0">
    		<tr><th>Nome Divisione</th><th>Citt&agrave;</th><th>Numero posti letto</th></tr>
    		<%	for (int i=0; i<v.size() ; i++) {
				divb =(DivisioneBean) v.get(i);	
           	%>
                <tr><td><a href="main?ps=divisione&nome=<%=divb.getNome()%>"><%=divb.getNome()%></a></td><td><%=divb.getCitta()%></td><td><%=divb.getPosti_letto()%></td></tr>
            <%}%>
    	</table>
	</br>
	</div>
	</br>
	</br>
    <div class="wrapper"></div>
	<div class="infoBlack">
		Indirizzo: <font color="#FFFFFF">Via dell'Azienda 88</font> Telefono:
		<font color="#FFFFFF">0452201113</font> Fax: <font color="#FFFFFF">0452221113</font>
		Mail: <font color="#FFFFFF">azienda@myDomain.com</font> Orario
		Segreteria: <font color="#FFFFFF">09:00 / 19:00</font>
		</br>
		</br>
	</div>
	</div>
	</br>
	</br>
</body>
</html>
