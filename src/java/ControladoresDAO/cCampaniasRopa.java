package ControladoresDAO;

import static ControladoresDAO.cCampanias.sesion;
import Modelos.CampaniaRopa;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import org.hibernate.Session;
import java.util.List;
import org.hibernate.Query;

public class cCampaniasRopa {
    
    public static List<Integer> RecuperaRopaPorCampania(int camId){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From CampaniaRopa WHERE camro_cam_id = "+camId;
        Query query = sesion.createQuery(sql);
        List<CampaniaRopa> lcr = query.list();
        List<Integer> lista = new ArrayList<Integer>();
        for(CampaniaRopa cr:lcr){
            lista.add(cr.getRopa().getRoId());
        }
        return lista;
    }
    
    public static List<Integer> RecuperaCampaniasPorRopa(int roId){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From CampaniaRopa WHERE camro_ro_id = "+roId;
        Query query = sesion.createQuery(sql);
        List<CampaniaRopa> lcr = query.list();
        List<Integer> lista = new ArrayList<Integer>();
        for(CampaniaRopa cr:lcr){
            lista.add(cr.getCampania().getCamId());
        }
        return lista;
    }
    
    public static int  Elimina(int camId){
        Connection con = null;
        int respuesta = -1;
        String sql = "DELETE FROM campania_ropa WHERE camro_cam_id = "+camId+";";
        //System.out.println(sql);        
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
        /*
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
        */
    }
    
    public static int  Inserta(CampaniaRopa cr){        
        sesion = (Session) NewHibernateUtil.getSessionModif();
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