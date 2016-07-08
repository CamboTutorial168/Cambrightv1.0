package controller.admin;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conn {
	private final String URL="jdbc:postgresql://localhost:5432/dbcamb";
	private final String USER="postgres";
	private final String PWD="123";
	
	//Test
	
	
	public Connection getConnection(){
		Connection cn = null;
		try{
			Class.forName("org.postgresql.Driver");
			cn=DriverManager.getConnection(URL,USER,PWD);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return cn;
	}
	
}
