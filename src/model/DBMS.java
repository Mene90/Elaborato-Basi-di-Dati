package model;
import java.sql.*;
import java.sql.Date;
import java.util.*;

public class DBMS {

	private String user = "menelaos";
	private String passwd = "rlm16y";
	private String url = "jdbc:postgresql://localhost/labbasi";
	private String driver = "org.postgresql.Driver";
	
	private String div = "select nome,localita,via,civico,citta,primario,n_tel,tipo,orario_apertura,orario_chiusura, count(*) as posti_letto from divisione d inner join posto_letto pl on d.nome = pl.divisione group by nome";
	private String singoldivinf = "select nome,localita,via,civico,citta,primario,n_tel,tipo,orario_apertura,orario_chiusura, count(*) as posti_letto from divisione d inner join posto_letto pl on d.nome = pl.divisione where d.nome = ? group by nome";
	private String letti_occupati = "select count(*) as tot_occupati from ricovero where divisione=? and data_in<? and data_fin>? group by divisione";
	private String checklogin = "select login , pass from utente where login=? and pass=?";
	private String divforuser = "select nome,localita,via,civico,citta,primario,n_tel,tipo,orario_apertura,orario_chiusura, count(*) as posti_letto from divisione d inner join utente_divisione ud on d.nome = ud.divisione inner join posto_letto pl on d.nome=pl.divisione where username=? group by nome";
	private String divmaininf = "select nome,primario from divisione where nome=?";
	private String lettiPazienti = "select pl.n_letto,pl.n_stanza,pl.piano,pl.edificio,pl.sis_monitor,p.cod_sanitario,p.nome,p.cognome,p.data_nascita,p.luogo_nascita,p.regione,p.provincia,r.data_in,r.data_fin from ricovero r inner join paziente p on (r.cod_sanitario = p.cod_sanitario) right join posto_letto pl on  (pl.n_letto = r.letto and pl.divisione = r.divisione  and r.data_in<? and r.data_fin>?) where pl.divisione = ?";
	private String letto = "select * from posto_letto where divisione = ? and n_letto = ?";
	private String esistepaziente = "select * from paziente where cod_sanitario = ?";
	private String inserisci_paziente = "INSERT INTO paziente( cod_sanitario, nome, cognome, data_nascita, luogo_nascita, regione, provincia) VALUES (?,?,?,?,?,?,?)";
	private String inserisci_ricovero = "INSERT INTO ricovero (letto, divisione, cod_sanitario, data_in, data_fin) VALUES (?,?,?,?,?)";
	
	
	public DBMS() throws ClassNotFoundException {
		Class.forName(driver);
	}
	
	private DivisioneBean makeDivisioneBean(ResultSet rs) throws SQLException {
			DivisioneBean bean = new DivisioneBean();
			bean.setNome(rs.getString("nome"));
			bean.setLocalita(rs.getString("localita"));
			bean.setVia(rs.getString("via"));
			bean.setCivico(rs.getInt("civico"));
			bean.setCitta(rs.getString("citta"));
			bean.setPrimario(rs.getString("primario"));
			bean.setTelefono(rs.getString("n_tel"));
			bean.setTipo(rs.getString("tipo"));
			bean.setOrario_apertura(rs.getString("orario_apertura"));
			bean.setOrario_chiusura(rs.getString("orario_chiusura"));
			bean.setPosti_letto(rs.getInt("posti_letto"));
			return bean;
	}
	
	private DivisioneBean makeDivisioneMainInfBean(ResultSet rs) throws SQLException {
		DivisioneBean bean = new DivisioneBean();
		bean.setNome(rs.getString("nome"));
		bean.setPrimario(rs.getString("primario"));
		return bean;
}
	
	private UserBean makeUserBean(ResultSet rs) throws SQLException {
	    UserBean bean = new UserBean();
	    bean.setLogin(rs.getString("login"));
	    bean.setPass(rs.getString("pass"));	    
		return bean;
	}
	
	private LettiPazientiBean makeLettiPazientiBean(ResultSet rs) throws SQLException {
		LettiPazientiBean bean = new LettiPazientiBean();
	    
		bean.setNletto(rs.getString("n_letto"));
	    bean.setNstanza(rs.getString("n_stanza"));
	    bean.setPiano(rs.getString("piano"));
	    bean.setEdificio(rs.getString("edificio"));
	    bean.setSistemiMonitor(rs.getString("sis_monitor"));
	    bean.setCodSanitario(rs.getString("cod_sanitario"));
	    bean.setNome(rs.getString("nome"));
	    bean.setCognome(rs.getString("cognome"));
	    bean.setDataNascita(rs.getString("data_nascita"));
	    bean.setLuogoNasicita(rs.getString("luogo_nascita"));
	    bean.setRegione(rs.getString("regione"));
	    bean.setProvincia(rs.getString("provincia"));
	    bean.setDataIn(rs.getString("data_in"));
	    bean.setDataFin(rs.getString("data_fin"));
		
		return bean;
	}
	
	private LettiBean makeLettoBean(ResultSet rs) throws SQLException {
		LettiBean bean = new LettiBean();
		
		bean.setNletto(rs.getString("n_letto"));
		bean.setDivisione(rs.getString("divisione"));
	    bean.setNstanza(rs.getString("n_stanza"));
	    bean.setPiano(rs.getString("piano"));
	    bean.setEdificio(rs.getString("edificio"));
	    bean.setSistemiMonitor(rs.getString("sis_monitor"));	
		
		return bean;
	}
	
	
	public Vector getDivisioni(){
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector result = new Vector();
		try {
	
			con = DriverManager.getConnection(url, user, passwd);
			stmt = con.createStatement();
			rs = stmt.executeQuery(div);
			while(rs.next())
				result.add(makeDivisioneBean(rs));
		} catch(SQLException sqle) {                
			sqle.printStackTrace();
		} finally {                                
			try {
				con.close();
			} catch(SQLException sqle1) {
				sqle1.printStackTrace();
			}
		}
		return result;
	}
	
	public DivisioneBean getDivisione(String nome) {
		 Connection con = null;
		 PreparedStatement pstmt = null;
	     ResultSet rs = null;
		 DivisioneBean result = null;

	        try {
				con = DriverManager.getConnection(url, user, passwd);
				pstmt = con.prepareStatement(singoldivinf); 
				pstmt.clearParameters();
				pstmt.setString(1, nome); 
				rs=pstmt.executeQuery(); 		
				
				while(rs.next())
					result = makeDivisioneBean(rs);
			} catch(SQLException sqle) {               
				sqle.printStackTrace();
			} finally {                             
				try {
					con.close();
				} catch(SQLException sqle1) {
					sqle1.printStackTrace();
				}
			}
			return result;
	}

	
	public String tot_letti_occupati (String nome, Date currentdate) {
		 Connection con = null;
		 PreparedStatement pstmt = null;
	     ResultSet rs = null;
		 String result = null;

	        try {
				con = DriverManager.getConnection(url, user, passwd);
				pstmt = con.prepareStatement(letti_occupati); 
				pstmt.clearParameters();
				pstmt.setString(1, nome); 
				pstmt.setDate(2, currentdate);
				pstmt.setDate(3, currentdate);
				rs=pstmt.executeQuery(); 		
				
				while(rs.next())
					result = rs.getString("tot_occupati");
			} catch(SQLException sqle) {               
				sqle.printStackTrace();
			} finally {                                
				try {
					con.close();
				} catch(SQLException sqle1) {
					sqle1.printStackTrace();
				}
			}
			return result;
	}

	public UserBean getUser(String user2, String pass) {
		 Connection con = null;
		 PreparedStatement pstmt = null;
	     ResultSet rs = null;
		 UserBean result = null;

	        try {
				con = DriverManager.getConnection(url, user, passwd);
				pstmt = con.prepareStatement(checklogin); 
				pstmt.clearParameters();
				pstmt.setString(1, user2); 
				pstmt.setString(2, pass);
				rs=pstmt.executeQuery(); 		
				
				
				while(rs.next())
					result = makeUserBean(rs);
			} catch(SQLException sqle) {                
				sqle.printStackTrace();
			} finally {                                 
				try {
					con.close();
				} catch(SQLException sqle1) {
					sqle1.printStackTrace();
				}
			}
			return result;
	}

	public Vector getDivisioniUtente(String userdiv) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector result = new Vector();
		try {
			
			con = DriverManager.getConnection(url, user, passwd);
			
			pstmt = con.prepareStatement(divforuser); 
			pstmt.clearParameters();
			pstmt.setString(1, userdiv); 
			rs = pstmt.executeQuery();
			
			while(rs.next())
				result.add(makeDivisioneBean(rs));
		} catch(SQLException sqle) {                
			sqle.printStackTrace();
		} finally {                                 
			try {
				con.close();
			} catch(SQLException sqle1) {
				sqle1.printStackTrace();
			}
		}
		return result;
	}

	public DivisioneBean getDivisioneMainInf(String nome) {
		 Connection con = null;
		 PreparedStatement pstmt = null;
	     ResultSet rs = null;
	     DivisioneBean result = null;

	        try {
				con = DriverManager.getConnection(url, user, passwd);
				pstmt = con.prepareStatement(divmaininf); 
				pstmt.clearParameters();
				pstmt.setString(1, nome); 
				rs=pstmt.executeQuery(); 		
				
				
				while(rs.next())
					result = makeDivisioneMainInfBean(rs);
			} catch(SQLException sqle) {                
				sqle.printStackTrace();
			} finally {                                 
				try {
					con.close();
				} catch(SQLException sqle1) {
					sqle1.printStackTrace();
				}
			}
			return result;
	}

	public Vector<LettiPazientiBean> getLettiPazienti(String nome, java.sql.Date sqlDate) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector <LettiPazientiBean> result = new Vector <LettiPazientiBean> ();
		try {
			
			con = DriverManager.getConnection(url, user, passwd);
			pstmt = con.prepareStatement(lettiPazienti); 
			pstmt.clearParameters();
			pstmt.setDate(1, sqlDate); 
			pstmt.setDate(2, sqlDate); 
			pstmt.setString(3, nome);
			rs = pstmt.executeQuery();
			
			while(rs.next())
				result.add(makeLettiPazientiBean(rs));
		} catch(SQLException sqle) {                
			sqle.printStackTrace();
		} finally {                                
			try {
				con.close();
			} catch(SQLException sqle1) {
				sqle1.printStackTrace();
			}
		}
		return result;
	}

	public LettiBean getLetto(String divisione, String nletto) {
		 Connection con = null;
		 PreparedStatement pstmt = null;
	     ResultSet rs = null;
	     LettiBean result = null;

	        try {
				con = DriverManager.getConnection(url, user, passwd);
				pstmt = con.prepareStatement(letto); 
				pstmt.clearParameters();
				pstmt.setString(1, divisione);
				pstmt.setInt(2,Integer.parseInt(nletto)); 
				rs=pstmt.executeQuery(); 		
				
				
				while(rs.next())
					result = makeLettoBean(rs);
			} catch(SQLException sqle) {                
				sqle.printStackTrace();
			} finally {                                 
				try {
					con.close();
				} catch(SQLException sqle1) {
					sqle1.printStackTrace();
				}
			}
			return result;
	}

	public boolean ExistPaziente(String codfisc) {
		 Connection con = null;
		 PreparedStatement pstmt = null;
	     ResultSet rs = null;
	     boolean result = false;

	        try {
				con = DriverManager.getConnection(url, user, passwd);
				pstmt = con.prepareStatement(esistepaziente); 
				pstmt.clearParameters();
				pstmt.setString(1, codfisc); 
				rs=pstmt.executeQuery(); 						
				
				if(rs.next())
					result = !result;
				
			} catch(SQLException sqle) {                
				sqle.printStackTrace();
			} finally {                                 
				try {
					con.close();
				} catch(SQLException sqle1) {
					sqle1.printStackTrace();
				}
			}
			return result;
	}
	
	public void inserisciPaziente(String cod, String nome, String cognome, java.sql.Date dnascita, String lnascita, String regione, String provincia) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			con = DriverManager.getConnection(url, user, passwd);
			pstmt = con.prepareStatement(inserisci_paziente); 
			pstmt.clearParameters();
			
			pstmt.setString(1, cod);
			pstmt.setString(2, nome);
			pstmt.setString(3, cognome);
			pstmt.setDate(4, dnascita);
			pstmt.setString(5, lnascita);
			pstmt.setString(6, regione);
			pstmt.setString(7, provincia);
			
			pstmt.executeUpdate();
			
			
		} catch(SQLException sqle) {                
			sqle.printStackTrace();
		} finally {                                
			try {
				con.close();
			} catch(SQLException sqle1) {
				sqle1.printStackTrace();
			}
		}
	}
	
	public void inserisciRicovero(String n_letto, String divisione, String cod, java.sql.Date datain, java.sql.Date datafin) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			con = DriverManager.getConnection(url, user, passwd);
			pstmt = con.prepareStatement(inserisci_ricovero); 
			pstmt.clearParameters();
			
			pstmt.setInt(1, Integer.parseInt(n_letto));
			pstmt.setString(2, divisione);
			pstmt.setString(3, cod);
			pstmt.setDate(4, datain);
			pstmt.setDate(5, datafin);
			
			pstmt.executeUpdate();
			
		} catch(SQLException sqle) {                

			sqle.printStackTrace();
		
		} finally {                                
			try {
				con.close();
			} catch(SQLException sqle1) {
				sqle1.printStackTrace();
			}
		}
		
	}

	

}
