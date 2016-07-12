package controller.admin;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conn {
	/*private final String URL="jdbc:postgresql://localhost:5432/dbcamb";
	private final String USER="postgres";
	private final String PWD="123";*/
	
	//Test
	private final String URL="jdbc:postgresql://ec2-107-22-235-119.compute-1.amazonaws.com:5432/d8q66tg4eidr2n?ssl=true&amp;sslfactory=org.postgresql.ssl.NonValidatingFactory";
	private final String USER="vpgbgcqplgwdzq";
	private final String PWD="KEIOZ4n2OZ18UnP2D0oXuG3Lyu";
	
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
