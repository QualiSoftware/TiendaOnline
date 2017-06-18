package ControladoresDAO;

import Modelos.NoLogUsuarios;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/*  
*   Author     : QualiSoftware
*/
public class cUsuariosNoLog {
    
    static Session sesion;
    
    public static NoLogUsuarios RecuperaPorIdSinModificarSesion(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        NoLogUsuarios p =(NoLogUsuarios) sesion.get(NoLogUsuarios.class, id);
        return p;
    }
    
    public static int  Elimina(NoLogUsuarios esto){
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
    
    public static int Inserta(NoLogUsuarios c){
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
    
    public static int  Modifica(NoLogUsuarios c){      
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
    
    public static List<NoLogUsuarios> recuperaPorNick(String nick){
        sesion = (Session) NewHibernateUtil.getSession();
        Criteria criterio = sesion.createCriteria(NoLogUsuarios.class);
        criterio.add(Restrictions.eq("nluNick", nick));
        List<NoLogUsuarios> lista = criterio.list();
        return lista;
    }  
    
    public static List<NoLogUsuarios> recuperaUsuariosConEmail(){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From NoLogUsuarios WHERE nluEmail <> ''";
        Query query =sesion.createQuery(sql);
        List<NoLogUsuarios> lista = query.list();
        return lista;
    }
}