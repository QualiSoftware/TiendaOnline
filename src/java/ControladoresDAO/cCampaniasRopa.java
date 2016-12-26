package ControladoresDAO;

import static ControladoresDAO.cCampanias.sesion;
import Modelos.CampaniaRopa;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import org.hibernate.Session;

public class cCampaniasRopa {
    
    public static int  Elimina(CampaniaRopa cr){
        sesion = (Session) NewHibernateUtil.getSessionModif();
        sesion.beginTransaction();
        try{
            if(cr!=null){
                sesion.delete(cr);
                sesion.getTransaction().commit();
                return 1;
            }
                return -1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
    }
    
    public static int  Inserta(CampaniaRopa cr){        
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            sesion.save(cr);
            sesion.getTransaction().commit();
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
        /*
        Connection con = null;
        int respuesta = -1;
        String sql = "INSERT INTO campania_ropa (camro_cam_id, camro_ro_id) VALUES ('"+camId+"', '"+roId+"');";
        System.out.println(sql);
        
        try{
            con = cPDFConexion.Conexion();
            if (con == null) {
                    respuesta = -1;
            }
            Statement comando = con.createStatement();
            respuesta = comando.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            if (respuesta == 0) {
                    respuesta = -1;
            }
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            return -1;
        } finally {
            try {
                con.close();
                return respuesta;
            } catch (Exception e) {
                System.out.println(e.getStackTrace());
                return -1;
            }
        }
        */
    }
    
    public static int  Modifica(CampaniaRopa cr){      
        sesion = (Session) NewHibernateUtil.getSessionModif();
        sesion.beginTransaction();
        try{
            sesion.update(cr);
            sesion.getTransaction().commit();
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        }
    }
}