package ControladoresDAO;

import java.sql.*;

public class Conexion {
	
	private Connection cnx=null;
	
	public Connection getConexion(){
		try{
			Driver driver = new com.mysql.jdbc.Driver();
			DriverManager.registerDriver(driver);
			cnx = DriverManager.getConnection("jdbc:mysql://localhost/tienda_ropa","root","");
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
		return cnx;
	}

}
