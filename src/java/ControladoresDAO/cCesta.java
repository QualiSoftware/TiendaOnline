/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import static ControladoresDAO.cRopa.sesion;
import Modelos.Cesta;
import Modelos.Ropa;
import Modelos.Usuarios;
import Modelos.cestaSH;
import static com.opensymphony.xwork2.Action.SUCCESS;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import org.hibernate.Query;
import org.hibernate.Session;


/**
 *
 * @author javiermartinroncero
 */
public class cCesta {
    
    
     public static ArrayList<Cesta> RecuperaTodos(String filtro){
        if(filtro.equals("")){
            filtro = "0";
        }
        sesion = (Session) NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM Cesta WHERE usuarios.usuId = "+filtro); 
        ArrayList<Cesta> la = (ArrayList) query.list();
        return la;
    }
    //inserta ropa en cesta por usuario
    public static int InsertaRopaCestaUsuario(Cesta c) {
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try {
            sesion.save(c);
            sesion.getTransaction().commit();
            sesion.evict(c);
            return 1;
        } catch (Exception e) {
            sesion.getTransaction().rollback();
            System.out.println("Exception: " + e);
            return -1;
        }
    }
        public static Cesta RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        Cesta p =(Cesta) sesion.get(Cesta.class, id);
        return p;
    }  
        
        public static int  Elimina(Cesta esto){
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            if(esto!=null){
               //System.out.println(esto.getCestaUnidades());
                sesion.delete(esto);
                sesion.getTransaction().commit();
                sesion.evict(esto);
                return 1;
            }
                return -1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
    }
        
    public static int  Modifica(Cesta c){      
        
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            sesion.update(c);
            sesion.getTransaction().commit();
            sesion.evict(c);
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
    }
    
	public static ArrayList<cestaSH> RecuperaTodosSinHibernate(String filtro) {
		ArrayList<cestaSH> lista = new ArrayList<cestaSH>();
		String sql = "SELECT * FROM cesta WHERE cesta_usu_id = " + filtro;
		//System.out.println(sql);
		try {
			Connection cnx = new Conexion().getConexion();
			if (cnx == null) {
				return null;
			}
			Statement comando = cnx.createStatement();
			ResultSet rs = comando.executeQuery(sql);
			while (rs.next() == true) {
				int cesta_id = rs.getInt("cesta_id");
				int cesta_ro_id = rs.getInt("cesta_ro_id");
				int cesta_usu_id = rs.getInt("cesta_usu_id");
				int cesta_unidades = rs.getInt("cesta_unidades");
				cestaSH ficha = new cestaSH(cesta_id, cesta_ro_id, cesta_usu_id, cesta_unidades);
				lista.add(ficha);
			}
			cnx.close();
			return lista;
		} catch (SQLException e) {
			System.out.println(e.getStackTrace());
			return null;
		}

	}
   
}
