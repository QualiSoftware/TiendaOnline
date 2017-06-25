package ControladoresDAO;

import static ControladoresDAO.cRopa.sesion;
import Modelos.Cesta;
import Modelos.NoLogCesta;
import Modelos.NoLogUsuarios;
import Modelos.Ropa;
import Modelos.RopaStock;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import java.sql.*;
import java.util.*;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/*  
*   Author     : QualiSoftware
*/
public class cCestaNoLog {    
    
    public static ArrayList<NoLogCesta> RecuperaTodos(String filtro){
        if(filtro.equals("") || filtro.equals("null")){
            filtro = "0";
        }
        sesion = (Session) NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM NoLogCesta WHERE noLogUsuarios.nluUsuId = "+filtro); 
        ArrayList<NoLogCesta> la = (ArrayList) query.list();
        return la;
    }
     
    //inserta ropa en cesta por usuario
    public static int InsertaRopaCestaUsuario(NoLogCesta c) {
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
    
    public static NoLogCesta RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        NoLogCesta p =(NoLogCesta) sesion.get(NoLogCesta.class, id);
        return p;
    }  
        
    public static int  Elimina(NoLogCesta esto){
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            if(esto!=null){
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
        
    public static int  Modifica(NoLogCesta c){        
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
    
    public static List<NoLogCesta> recuperaPorRopaStockYUsuario(int roStock, int usuario){
        sesion = (Session) NewHibernateUtil.getSession();
        Criteria criterio = sesion.createCriteria(NoLogCesta.class);
        criterio.add(Restrictions.eq("noLogUsuarios.nluUsuId", usuario));
        criterio.add(Restrictions.eq("ropaStock.rostockId",roStock));
        List<NoLogCesta> lista = criterio.list();
        return lista;

    } 
    
    public static List<NoLogCesta> recuperaPorUsuario(NoLogUsuarios usuario){
        sesion = (Session) NewHibernateUtil.getSession();
        Criteria criterio = sesion.createCriteria(NoLogCesta.class);
        criterio.add(Restrictions.eq("noLogUsuarios", usuario));
        List<NoLogCesta> lista = criterio.list();
        return lista;

    } 
}