<%@page errorPage="error.jsp" %>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<%
Vector vdivisioni = (Vector) request.getAttribute("divisioni");
Vector vdivigestibili = (Vector) request.getAttribute("divisioni_gestibili");

Boolean inserito =(Boolean) request.getAttribute("inserito");
LettiBean letto = (LettiBean) request.getAttribute("info_letto");
DivisioneBean divisioni;
%>			

<!--Inizio la pagina HTML-->

<head>
	
	<title>Home Page</title>
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/Styles.css" /> 
	<script type="text/javascript">
	 $(function() {
          $( "#datepicker" ).datepicker();
	  });
	
 	$(function() {
		/* For zebra striping */
        $("table tr:nth-child(odd)").addClass("odd-row");
		/* For cell text alignment */
		$("table td:first-child, table th:first-child").addClass("first");
		/* For removing the last border */
		$("table td:last-child, table th:last-child").addClass("last");
	});
 	
 	function check_format(date){
 		re = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
 		if (( date.match(re) != null ))
 			return true;
 		else 
 			return false;
 	}
 	
 	function check_date(datain,datafin){
 		var arr1 = datain.split("/");
 		var arr2 = datafin.split("/");

 		var d1 = new Date(arr1[2],arr1[1]-1,arr1[0]);
 		var d2 = new Date(arr2[2],arr2[1]-1,arr2[0]);

 		var r1 = d1.getTime();
 		var r2 = d2.getTime();

 		if (r1<=r2) 
 			return true;
 		else 
 			return false;
 	}
 	
 	function controllo() {
 		 var cod_sanitario = document.ricovera.cd.value;
 	     var nome = document.ricovera.np.value;
 	     var cognome = document.ricovera.cp.value;
 	     var data_nascita = document.ricovera.dn.value;
 	     var luogo_nascita = document.ricovera.ln.value;
 	     var regione = document.ricovera.rg.value;
 	     var provincia = document.ricovera.pr.value;
 	     var inizio_ricovero = document.ricovera.di.value;
 	     var fine_ricovero = document.ricovera.df.value;
 	     
 	    if ((cod_sanitario == "") || (cod_sanitario == "undefined") || (cod_sanitario.length != 16)) {
 	        alert("Il campo codice sanitario è obbligatorio e deve contenere 16 caratteri");
 	        document.ricovera.cd.focus();
 	        return false;
 	    }
 	    else if ((nome == "") || (nome == "undefined")) {
 	        alert("Il campo Nome è obbligatorio.");
 	        document.ricovera.np.focus();
 	        return false;
 	    }
 	   else if ((cognome == "") || (cognome == "undefined")) {
 	        alert("Il campo Cognome è obbligatorio.");
 	        document.ricovera.cp.focus();
 	        return false;
 	   }
 	   else if (!check_format(data_nascita)){
 		  alert("Inserire nascita in formato gg/mm/aaaa");
 	      document.ricovera.dn.value = "";
 	      document.ricovera.dn.focus();
 	      return false;
 	   }
 	  else if((luogo_nascita == "")|| (luogo_nascita=="undefined")){
 		  alert("il campo Luogo di nascita è obbligatorio");
 		  document.ricovera.ln.focus();
 	  }  
 	  else if((regione == "") || (regione =="undefined")){
 		   alert("Il campo regione è obbligatorio");
 		   document.ricovera.rg.focus();
 	   }
 	   else if((provincia == "") || (provincia == "undefined")){
 		  alert("Il campo provincia è obbligatorio");
		   document.ricovera.pr.focus();
 	   }
 	  else if (!check_format(inizio_ricovero)){
 		  alert("Inserire inizio ricovero in formato gg/mm/aaaa");
 	      document.ricovera.di.value = "";
 	      document.ricovera.di.focus();
 	      return false;
 	  }
 	  else if (!check_format(fine_ricovero)){
		  alert("Inserire fine ricovero in formato gg/mm/aaaa");
	      document.ricovera.fi.value = "";
	      document.ricovera.fi.focus();
	      return false;
	  }
 	  else if(!check_date(inizio_ricovero,fine_ricovero)){
 		  alert("La data di inizio ricovero deve precedere quella di fine ricovero");
 		  document.ricovera.di.focus();
 		  document.ricovera.fi.focus();
 		return false;
 	  }   
      else {
 	        document.ricovera.action = "main";
 	        document.ricovera.submit();
 	    }
 	}
 	
	</script>
</head>
<body>
	<h1 class="margin">Gestione posto letto e ricoveri</h1>
    	</br>
    	</br>
	<p class="margin">In questa pagina si possono inserire dati per nuovi pazienti nei nostri dipartimenti</p>
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
		Numero Letto
	</div>
	<div class="two">
		<%=letto.getNletto()%>
	</div>
	</br>
	<div class="one">
		Divisione
	</div>
	<div class="two">
		<%=letto.getDivisione()%>
	</div>
	</br>
	<div class="one">
		Numero Stanza
	</div>
	<div class="two">
		<%=letto.getNstanza() %>
	</div>
	</br>
	<div class="one">
		Edificio
	</div>
	<div class="two">
		<%=letto.getEdificio()%>
	</div>
	</br>
	<div class="one">
		Piano
	</div>
	<div class="two">
		<%=letto.getPiano()%>
	</div>

	</br>
	</br>
	
	<%if(!inserito){%>
  	<span href="#" class="button" id="toggle-login">Inserisci i dati del paziente</span>
  		<div id="login_form">
  			<form method="post" name="ricovera">
  				<input name="ps" type="hidden" value="inserisci_paziente" />
  				<input name="letto" type="hidden" value="<%=letto.getNletto()%>" />
  				<input name="nome" type="hidden" value="<%=letto.getDivisione()%>" />
  				<input name="cd" type="text" placeholder="Codice Sanitario" />
    			<input name="np" type="text" placeholder="Nome paziente" /> 
    			<input name="cp" type="text" placeholder="Cognome paziente" />
				<input name="dn" type="text" placeholder="Data di nascita" />
				<input name="ln" type="text" placeholder="Luogo di nascita" />
				<input name="rg" type="text" placeholder="Regione" />
				<input name="pr" type="text" placeholder="Provincia" />
				<input name="di" type="text" placeholder="Data inizio ricovero" />
				<input name="df" type="text" placeholder="Data fine ricovero" />
			    <input type="button" value="Registra" onClick="controllo()" />
  			</form>
		</div>
  	<script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
  	<script src="js/index.js"></script>
  	<%}else{%>
  		<script> 
  			alert("Paziente ricoverato");
  			window.location = "main?ps=gestione&nome=<%=letto.getDivisione()%>";
  		</script>
   	<%}%>  
  	
	</br>
	</br>
</body>
</html>
