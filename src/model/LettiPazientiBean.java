package model;



public class LettiPazientiBean {
	private String n_letto;
	private String n_stanza;
	private String piano;
	private String edificio;
	private String sis_monitor;
	private String cod_sanitario;
	private String nome;
	private String cognome;
	private String data_nascita;
	private String luogo_nascita;
	private String regione;
	private String provincia;
	private String data_in;
	private String data_fin;
	
	
	public LettiPazientiBean() {
		n_letto = null;
		n_stanza = null;
		piano = null;
		edificio = null;
		sis_monitor =null;
		cod_sanitario = null;
		nome = null;
		cognome = null;
		data_nascita = null;
		luogo_nascita = null;
		regione = null;
		provincia = null;
		data_in = null;
		data_fin = null;
		
	 }
	
	/**
	 * @return the n_letto
	 */
	public String getNletto() {
		return this.n_letto;
	}
	public String getNstanza(){
		return this.n_stanza;
	}
	public String getPiano(){
		return this.piano;
	}
	public String getEdificio(){
		return this.edificio;
	}
	public String getSistemiMonitor(){
		return this.sis_monitor;
	}
	public String getCodSanitario(){
		return this.cod_sanitario;
	}
	public String getNome(){
		return this.nome;
	}
	public String getCognome(){
		return this.cognome;
	}
	public String getDataNascita(){
		return this.data_nascita;
	}
	public String getLuogoNasicita(){
		return this.luogo_nascita;
	}
	public String getRegione(){
		return this.regione;
	}
	public String getProvincia(){
		return this.provincia;
	}
	public String getDataIn(){
		return this.data_in;
	}
	public String getDataFin(){
		return this.data_fin;
	}
	
	
	
	public void setNletto(String n_letto) {
		this.n_letto=n_letto;
	}
	public void setNstanza(String n_stanza){
		this.n_stanza=n_stanza;
	}
	public void setPiano(String piano){
		this.piano=piano;
	}
	public void setEdificio(String edificio){
		this.edificio=edificio;
	}
	public void setCodSanitario(String cod_sanitario){
		this.cod_sanitario=cod_sanitario;
	}
	public void setSistemiMonitor(String sis_monitor){
		this.sis_monitor=sis_monitor;
	}
	public void setNome(String nome){
		this.nome=nome;
	}
	public void setCognome(String cognome){
		this.cognome=cognome;
	}
	public void setDataNascita(String data_nascita){
		this.data_nascita=data_nascita;
	}
	public void setLuogoNasicita(String luogo_nascita){
		this.luogo_nascita=luogo_nascita;
	}
	public void setRegione(String regione){
		this.regione=regione;
	}
	public void setProvincia(String provincia){
		this.provincia=provincia;
	}
	public void setDataIn(String data_in){
		this.data_in=data_in;
	}
	public void setDataFin(String data_fin){
		this.data_fin=data_fin;
	}
}
