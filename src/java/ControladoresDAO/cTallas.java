package ControladoresDAO;

import Modelos.Tallas;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/*  
*   Author     : QualiSoftware
*/
public class cTallas {
    
    static Session sesion;
    
    public static List<Tallas> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From Tallas WHERE talla_descripcion like '%"+filtro+"%'";
        Query query = sesion.createQuery(sql);
        List<Tallas> lt = query.list();
        return lt;
    }
    public static Tallas RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        Tallas t = (Tallas) sesion.get(Tallas.class, id);
        return t;
    }
    
    public static int Inserta(Tallas t){
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
    public static int Modifica(Tallas t){
        sesion = (Session) NewHibernateUtil.getSessionModif();
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
