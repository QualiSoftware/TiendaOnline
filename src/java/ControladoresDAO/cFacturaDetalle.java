package ControladoresDAO;

import Modelos.FacturaDetalle;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class cFacturaDetalle {
    
    static Session sesion;
    
    public static List<FacturaDetalle> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From FacturaDetalle WHERE facturas.facId = "+filtro;
        Query query = sesion.createQuery(sql);
        List<FacturaDetalle> lt = query.list();
        return lt;
    }
    
    public static FacturaDetalle RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        FacturaDetalle t = (FacturaDetalle) sesion.get(FacturaDetalle.class, id);
        return t;
    }
    
    public static int Inserta(FacturaDetalle t){
        sesion = (Session) NewHibernateUtil.getSession();
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
    /*
    public static int Modifica(Tallas t){
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
    
    public static int Elimina(Tallas t){
        sesion = (Session) NewHibernateUtil.getSession();
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
    */
}
