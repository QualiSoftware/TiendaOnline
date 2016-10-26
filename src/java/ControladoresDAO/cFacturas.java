package ControladoresDAO;

import Modelos.Facturas;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class cFacturas {
    
    static Session sesion;
    
    public static List<Facturas> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From Facturas WHERE facRazonsocial like '%"+filtro+"%'";
        Query query = sesion.createQuery(sql);
        List<Facturas> lt = query.list();
        return lt;
    }
    public static Facturas RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        Facturas t = (Facturas) sesion.get(Facturas.class, id);
        return t;
    }
    
    public static int Inserta(Facturas t){
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
    public static int Modifica(Facturas t){
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
    
    public static int Elimina(Facturas t){
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
}
