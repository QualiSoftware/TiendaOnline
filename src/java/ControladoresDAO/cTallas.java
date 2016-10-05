package ControladoresDAO;

import Modelos.Tallas;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;

public class cTallas {
    
    static Session sesion;
    
    public static ArrayList<Tallas> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        String sql = "From Tallas WHERE talla_descripcion like '%"+filtro+"%'";
        Query query = sesion.createQuery(sql);
        ArrayList<Tallas> lt = (ArrayList) query.list();
        return lt;
    }
    public static Tallas RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        Tallas t = (Tallas) sesion.get(Tallas.class, id);
        return t;
    }
    
    public static int Inserta(Tallas t){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
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
    public static int Modifica(Tallas t){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
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
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
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
