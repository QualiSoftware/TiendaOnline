package ControladoresDAO;

import Acciones.HomeUsuariosValidaciones;
import java.sql.*;

/*  
*   Author     : QualiSoftware
*/
public class cPDFConexion {
    
    public static Connection Conexion(){
        Connection con = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection) DriverManager.getConnection(Acciones.HomePropiedades.muestraValor("bbdd"),
                        Acciones.HomePropiedades.muestraValor("bbdd.user"),
                        Acciones.HomePropiedades.muestraValor("bbdd.password"));
            }catch(Exception e){
                HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
                huv.escribirEnArchivoLog("Error al intentar cargar el método " + e.getStackTrace()[0].getMethodName()
                    + " el día "+new java.util.Date());
            }
            return con;
    }
}
