package control;


import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.util.Date;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Vector;

import model.*;


/**
 * Questa servlet gestisce le richieste HTTP, mediante la richiesta
 * di informazioni alla classe DBMS del package did e delega alle
 * jsp relative la presentazione delle informazioni.
 *
 *  @author Nicola Castellani
 *  @author Menelaos Ralli 
 */

 @WebServlet("/main")
public class main extends HttpServlet {
    /** 
     * @param request Oggetto HttpServletRequest dal quale ottenere informazioni circa la
     *                richiesta effettuata.
     * @param response Oggetto HttpServletResponse per l'invio delle risposte.
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException {

		
		String ps = "";
				
		try {
			if (request.getParameter("ps") != null) {
				ps = request.getParameter("ps");
			}
			if (ps.equals("divisione")) {
				divisionPage(request,response);
			}else if( ps.equals("gestione") ){
				gestionePage(request,response);
			}else if( ps.equals("occupazione") ){
				occupazionePage(request,response,false);
			}else if( ps.equals("logout") ){
				
				request.getSession().removeAttribute("user");
				homePage(request,response,0);
			}
			else {
				int logU;
				if(User(request) == null)
					logU = 0;
				else
					logU = 1;
				homePage(request,response,logU);
			}
		} catch(Exception e) {  
			e.printStackTrace();
		}
    }
 
	// Metodo per la gestione delle richieste di tipo POST
    public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException {
	String ps;
	ps = "";
	try{
		if (request.getParameter("ps") != null)
			ps = request.getParameter("ps");
		if( ps.equals("login") ){
			loginUser(request, response);
		}else if( ps.equals("inserisci_paziente") ){
			inserisciPaziente(request, response);
		}
		else {
			int logU;
			if(User(request) == null)
				logU = 0;
			else
				logU = 1;
			homePage(request,response,logU);
		}
	}
	catch(Exception e ){
		e.printStackTrace();
	}
    }
   

	private void inserisciPaziente(HttpServletRequest request, HttpServletResponse response) 
	throws IOException, ServletException, ClassNotFoundException, ParseException {
		
	    DBMS dbms = new DBMS();
	    String user = User(request);
	  
	     
	    if(user != null){
	    	 String divisione = request.getParameter("nome");
	    	 String letto = request.getParameter("letto");
         	 String cod = request.getParameter("cd").toUpperCase();
	    	 java.sql.Date datain = new java.sql.Date(new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("di")).getTime());
	    	 java.sql.Date datafin = new java.sql.Date(new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("df")).getTime());
	  	    	 
 	 		 if (dbms.ExistPaziente(cod))		
	    	 		dbms.inserisciRicovero(letto,divisione,cod,datain,datafin);
	    	 else{	    		    
	    		 	
	    		    String nome_paziente = request.getParameter("np");
	    		    String cognome = request.getParameter("cp");
	    		    java.sql.Date dnascita = new java.sql.Date(new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("dn")).getTime());
	    		    String lnascita = request.getParameter("ln");
	    		    String regione = request.getParameter("rg");
	    		    String provincia = request.getParameter("pr");
	    		        
	    		 	dbms.inserisciPaziente(cod,nome_paziente,cognome,dnascita,lnascita,regione,provincia);
	    		 	dbms.inserisciRicovero(letto,divisione,cod,datain,datafin);
	    		 	
	    		 	occupazionePage(request,response,true);
	    	 }
	    }else{
	    	homePage(request,response,3);
	    }
		
	}
	
	private void occupazionePage(HttpServletRequest request, HttpServletResponse response, boolean  inserito)
    	    throws IOException, ServletException, ClassNotFoundException {
    		
    	    	RequestDispatcher rd = null;
    	    	DBMS dbms = new DBMS();
    	    	
    	    	String userdiv = User(request);
    	    	
    	    	if(userdiv != null){
    	    		String nome = request.getParameter("nome");
    	    		String letto = request.getParameter("letto");
    	    		
    	    		request.setAttribute("divisioni",dbms.getDivisioni());
    	    		request.setAttribute("divisioni_gestibili", dbms.getDivisioniUtente(userdiv));
    	    		request.setAttribute("info_letto", dbms.getLetto(nome,letto));
    	   			request.setAttribute("inserito", inserito);
    	 
    	    		rd = request.getRequestDispatcher("occupa.jsp");
    	    		rd.forward(request, response);
    	    	
    	    	}else{
    	    		homePage(request,response,3);
    	    	}
    	    }

	private void loginUser(HttpServletRequest request, HttpServletResponse response) 
	throws IOException, ServletException, ClassNotFoundException{
	
	String user = request.getParameter("login");
	String pass = request.getParameter("pass");
	
	DBMS dbms = new DBMS();
	HttpSession session;
	UserBean u = dbms.getUser(user, pass);
	
	if( u != null ) {
		session = request.getSession();
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(600);
		homePage(request,response,1);
		}
	else{
		homePage(request,response,2);
		}
   }

    
    /* 
    Rimanda a Home.jsp
    se logU vale
	0 -> viene mostrato il form di login relativo al Utente
	1 -> Non viene mostrato il form
	2 -> viene mostrato errore login
	3 -> viene mostrato che la sessione è scaduta
    */
	
	private void homePage(HttpServletRequest request, HttpServletResponse response, int logU)
	 throws IOException, ServletException, ClassNotFoundException{
		 
		 RequestDispatcher rd = null;
	     DBMS dbms = new DBMS();
	     String userdiv = User(request);
	     
	     if(userdiv != null){	
	    	 request.setAttribute("divisioni_gestibili", dbms.getDivisioniUtente(userdiv));
	     }
	     
	     request.setAttribute("logU", logU);
	     request.setAttribute("divisioni",dbms.getDivisioni());
	     rd = request.getRequestDispatcher("home.jsp");
	     rd.forward(request, response);	
	 }
    
    private void divisionPage(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException, ClassNotFoundException{
    	
    	RequestDispatcher rd = null;
    	DBMS dbms = new DBMS();
    	Date date = new Date();
       	java.sql.Date sqlDate = new java.sql.Date(date.getTime());
    	
    	String userdiv = User(request);
    	String nome = request.getParameter("nome");
    	
        request.setAttribute("divisioni",dbms.getDivisioni());
      	request.setAttribute("singoldiv", dbms.getDivisione(nome)); 
      	request.setAttribute("letti_occupati",dbms.tot_letti_occupati(nome,sqlDate));  
    	
    	if(userdiv != null){	
    		request.setAttribute("logU", 1);
    		request.setAttribute("divisioni_gestibili", dbms.getDivisioniUtente(userdiv));	   
    	}
    	else{
    		request.setAttribute("logU", 0);
    		request.setAttribute("divisioni_gestibili", null);	    	
    	}
    	
    	rd = request.getRequestDispatcher("divisione.jsp");
        rd.forward(request, response);
	}
    
    private void gestionePage(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException, ClassNotFoundException {
	
    	RequestDispatcher rd = null;
    	DBMS dbms = new DBMS();
    	Date date = new Date();
       	java.sql.Date sqlDate = new java.sql.Date(date.getTime());
    	
    	String userdiv = User(request);
    	
    	if(userdiv != null){
    		String nome = request.getParameter("nome");
    		request.setAttribute("singoldiv", dbms.getDivisioneMainInf(nome)); 
    		request.setAttribute("lettiepazienti", dbms.getLettiPazienti(nome,sqlDate));
    		request.setAttribute("divisioni",dbms.getDivisioni());
    		request.setAttribute("divisioni_gestibili", dbms.getDivisioniUtente(userdiv));
    		
    		rd = request.getRequestDispatcher("gestione.jsp");
    		rd.forward(request, response);
    	
    	}else{
    		homePage(request,response,3);
    	}
    } 
   
    private String User(HttpServletRequest request){
	HttpSession session = request.getSession();
	if(session.getAttribute("user")!=null)
		return (String)session.getAttribute("user");
	return null;
    }
    
    
}
