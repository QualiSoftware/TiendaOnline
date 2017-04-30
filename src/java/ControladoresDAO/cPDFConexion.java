package ControladoresDAO;

import java.sql.*;

/*  
*   Author     : QualiSoftware
*/
public class cPDFConexion {
    
    public static Connection Conexion(){
        Connection con = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_ropa","root","root");
                //System.out.println("Conexión en línea");
            }catch(Exception e){
                System.out.println("Error: " + e.getMessage());
            }
            return con;
    }
}
