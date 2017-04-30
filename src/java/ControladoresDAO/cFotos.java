package ControladoresDAO;

import Modelos.Fotos;
import Modelos.Ropa;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/*  
*   Author     : QualiSoftware
*/
public class cFotos {
    
      static Session sesion;
    
    public static List<Fotos> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM Fotos WHERE fotosRuta LIKE '%"+filtro+"%'"); 
        List<Fotos> la = query.list();
        return la;
    }
    
    public static Fotos RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        Fotos p =(Fotos) sesion.get(Fotos.class, id);
        return p;
    }
    
    public static Fotos RecuperaFotoABorrar(int roId, String archivo){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "FROM Fotos WHERE fotos_ro_id = "+roId+" AND fotos_ruta = '"+ archivo + "'";
        //System.out.println("sql: "+sql);
        Query query =sesion.createQuery(sql); 
        List<Fotos> lf = query.list();
        Fotos f = null;
        if(lf.size() > 0){
            f = lf.get(0);
        }
        return f;
    }
    
    
    public static int  Elimina(Fotos esto){
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
    public static int  Inserta(Fotos c){
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
    public static int  Modifica(Fotos c){      
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
}
