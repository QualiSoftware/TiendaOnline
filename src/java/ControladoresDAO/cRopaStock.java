package ControladoresDAO;

import Modelos.RopaStock;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class cRopaStock {
    
    
    static Session sesion;
    
    public static List<RopaStock> RecuperaTodos(int roId,String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From RopaStock WHERE ropa.roId = " + roId;
        Query query = sesion.createQuery(sql);
        List<RopaStock> lt = query.list();
        return lt;
    }
    public static RopaStock RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        RopaStock rs = (RopaStock) sesion.get(RopaStock.class, id);
        return rs;
    }
    
    public static int Inserta(RopaStock t){
        sesion = (Session) NewHibernateUtil.getSessionModif();
        sesion.beginTransaction();
        try{
            sesion.save(t);
            sesion.getTransaction().commit();
            sesion.evict(t);
            return 1;
        }catch(Exception e){
            sesion.getTransaction().rollback();
            return -1;
        }
    }
    public static int Modifica(RopaStock t){
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            sesion.update(t);
            sesion.getTransaction().commit();
            sesion.evict(t);
            return 1;
        }catch(Exception e){
            sesion.getTransaction().rollback();
            return -1;
        }
    }
    
    public static int Elimina(RopaStock t){
        sesion = (Session) NewHibernateUtil.getSessionModif();
        sesion.beginTransaction();
        try{
            if(t != null){
                sesion.delete(t);
                sesion.getTransaction().commit();
                sesion.evict(t);
                return 1;
            }
            return -1;
        }catch(Exception e){
            sesion.getTransaction().rollback();
            return -1;
        }
    }
}
