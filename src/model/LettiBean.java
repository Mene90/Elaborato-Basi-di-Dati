package model;

public class LettiBean {

	private String n_letto;
	private String divisione;
	private String n_stanza;
	private String piano;
	private String edificio;
	private String sis_monitor;
		
	public LettiBean() {
		n_letto = null;
		divisione = null;
		n_stanza = null;
		piano = null;
		edificio = null;
		sis_monitor =null;
			
	 }
	
	/**
	 * @return the n_letto
	 */
	public String getNletto() {
		return this.n_letto;
	}
	public String getDivisione(){
		return this.divisione;
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
	
	
	
	public void setNletto(String n_letto) {
		this.n_letto=n_letto;
	}
	public void setDivisione(String divisione){
		this.divisione=divisione;
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
	public void setSistemiMonitor(String sis_monitor){
		this.sis_monitor=sis_monitor;
	}
	

}
