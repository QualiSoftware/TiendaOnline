package ControladoresDAO;

import static ControladoresDAO.cRopa.sesion;
import Modelos.Cesta;
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
public class cCesta {    
    
    public static ArrayList<Cesta> RecuperaTodos(String filtro){
        if(filtro.equals("") || filtro.equals("null")){
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
        sesion = (Session) NewHibernateUtil.getSessionModif();
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
    
    public static List<Cesta> recuperaPorRopaStockYUsuario(int roStock, int usuario){
        sesion = (Session) NewHibernateUtil.getSession();
        Criteria criterio = sesion.createCriteria(Cesta.class);
        criterio.add(Restrictions.eq("usuarios.usuId", usuario));
        criterio.add(Restrictions.eq("ropaStock.rostockId",roStock));
        List<Cesta> lista = criterio.list();
        return lista;

    }  
}