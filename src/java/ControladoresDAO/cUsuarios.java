package ControladoresDAO;

import Modelos.Usuarios;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class cUsuarios {
    
    static Session sesion;
    
     public static List<Usuarios> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM Usuarios WHERE usuNombre LIKE '%"+filtro+"%'"); 
        List<Usuarios> la = query.list();
        return la;
    }
    
    public static Usuarios RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        Usuarios p =(Usuarios) sesion.get(Usuarios.class, id);
        return p;
    }    
    
    public static int  Elimina(Usuarios esto){
        sesion = (Session) NewHibernateUtil.getSessionModif();
        sesion.beginTransaction();
        try{
            if(esto!=null){
                sesion.delete(esto);
                sesion.getTransaction().commit();
                return 1;
            }
                return -1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
    }
    
    public static int  Inserta(Usuarios c){
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            sesion.save(c);
            sesion.getTransaction().commit();
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
    }
    
    public static int  Modifica(Usuarios c){      
        sesion = (Session) NewHibernateUtil.getSessionModif();
        sesion.beginTransaction();
        try{
            sesion.update(c);
            sesion.getTransaction().commit();
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
    }
    
    public static List<Usuarios> Login(String u, String p){
        sesion = (Session) NewHibernateUtil.getSession();
        Criteria criterio = sesion.createCriteria(Usuarios.class);
        criterio.add(Restrictions.eq("usuEmail", u));
        criterio.add(Restrictions.eq("usuPassword",p));
        List<Usuarios> lista = criterio.list();
        return lista;
    }    
}