package ControladoresDAO;

import Modelos.Material;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;

public class cMaterial {
    
    static Session sesion;
    
    public static ArrayList<Material> Recupera_Todos(String filtro){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        String sql = "From Material WHERE material_descripcion like '%"+filtro+"%'";
        Query query = sesion.createQuery(sql);
        ArrayList<Material> lt = (ArrayList) query.list();
        return lt;
    }
    public static Material Recupera_Id(String id){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        Material t = (Material) sesion.get(Material.class, Integer.parseInt(id));
        return t;
    }
    
    public static int Inserta(Material t){
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
    public static int Modifica(Material t){
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
    
    public static int Elimina(Material t){
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
