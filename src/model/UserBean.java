package model;

public class UserBean {
	private String login;
	private String pass;
	
	 public UserBean() {
		 login = null;
		 pass = null;
	 }
	 
	 	/**
		 * @return the login
		 */
		public String getLogin() {
			return login;
		}
		
		/**
		 * @return the pass
		 */	
		public String getPass(){
			return pass;
		}
		
		/**
		 * @param login the login to set
		 */
		public void setLogin(String login) {
			this.login = login;
		}


		/**
		 * @param pass the pass to set
		 */
		public void setPass(String pass) {
			this.pass = pass;
		}
}
