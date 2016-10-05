package ControladoresDAO;

import Modelos.Subcategoria;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class cSubcategorias {
    
    static Session sesion;
    
    public static List<Subcategoria> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        Query query =sesion.createQuery("FROM Subcategoria WHERE subDescripcion LIKE'%"+filtro+"%'"); 
        List<Subcategoria> la = query.list();
        return la;
    }
    
    public static Subcategoria RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        Subcategoria s =(Subcategoria) sesion.get(Subcategoria.class, id);
        return s;
    }    
    
    public static int  Elimina(Subcategoria e){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            if(e!=null){
                sesion.delete(e);
                sesion.getTransaction().commit();
                sesion.evict(e);
                return 1;
            }
                return -1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        }finally{
           // sesion.close();
        } 
    }
    public static int  Inserta(Subcategoria c){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            sesion.save(c);
            sesion.getTransaction().commit();
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        }finally{
            //sesion.close();
        } 
    }
    public static int  Modifica(Subcategoria c){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
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
}