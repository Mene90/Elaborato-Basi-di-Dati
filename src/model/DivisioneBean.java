package model;

public class DivisioneBean {
	private String nome;
	private String localita;
	private String via;
	private int civico;
	private String citta;
	private String primario;
	private String n_tel;
	private String tipo;
	private String orario_apertura;
	private String orario_chiusura;
	private int posti_letto;
	private int letti_occupati;

	//Definizione del costruttore del Bean
    public DivisioneBean() {
    	nome = null;
    	localita = null;
    	via = null;
    	civico = 0;
    	citta = null;
    	primario = null;
    	n_tel = null;
    	tipo = null;
    	orario_apertura = null;
    	orario_chiusura = null;
    	posti_letto = 0;
    }
    
    /**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}
	
	/**
	 * @return the localita
	 */	
	public String getLocalita(){
		return localita;
	}
	/**
	 * @return the via
	 */
	public String getVia() {
		return via;
	}
	
	/**
	 * @return the civico
	 */
	public int getCivico() {
		return civico;
	}
	/**
	 * @return the citta
	 */
	public String getCitta(){
		return citta;
	}
	
	/**
	 * @return the primario
	 */
	public String getPrimario() {
		return primario;
	}
	
	/**
	 * @return the telefono
	 */
	public String getTelefono() {
		return n_tel;
	}
	

	/**
	 * @return the tipo
	 */
	public String getTipo(){
		return tipo;
	}
	
	/**
	 * @return the oraio_apertura
	 */
	public String getOrario_apertura(){
		return orario_apertura;
	}
	
	/**
	 * @return the orario_chiusura
	 */
	public String getOrario_chiusura(){
		return orario_chiusura;
	}
	
	/**
	 * @return the posti_letto
	 */
	public int getPosti_letto(){
		return posti_letto;
	}
	
	/**
	 * @return the letti_occupati
	 */
	public int getLetti_occupati() {
		return letti_occupati;
		
	}
	
	

	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}


	/**
	 * @param localita the localita to set
	 */
	public void setLocalita(String localita) {
		this.localita = localita;
	}
	
	/**
	 * @param via the via to set
	 */
	public void setVia(String via) {
		this.via = via;
	}

	/**
	 * @param civico the civico to set
	 */
	public void setCivico(int civico) {
		this.civico = civico;
	}
	
	/**
	 * @param citta the citta to set
	 */
	public void setCitta(String citta){
		this.citta=citta;
	}
	
	/**
	 * @param primario the primario to set
	 */
	public void setPrimario(String primario) {
		this.primario = primario;
	}
	
	/**
	 * @param telefono the telefono to set
	 */
	public void setTelefono(String telefono) {
		this.n_tel = telefono;
	}
	
	/**
	 * @param tipo the tipo to set
	 */
	
	public void setTipo(String tipo){
		this.tipo=tipo;
	}
	
	/**
	 * @param or_ap the orario_apertura to set
	 */
	
	public void setOrario_apertura(String or_ap){
		this.orario_apertura=or_ap;
	}
	/**
	 * @param or_ch the orario_chiusura to set
	 */
	
	public void setOrario_chiusura(String or_ch){
		this.orario_chiusura=or_ch;
	}
	
	/**
	 * @param the posti_letto to set
	 */
	public void setPosti_letto(int posti_letto){
		this.posti_letto=posti_letto;
	}

	/**
	 * @param the letti_occupati to set
	 */
	public void setLetti_occupati(int letti_occupati) {
		this.letti_occupati = letti_occupati;
		
	}


	

	
}
