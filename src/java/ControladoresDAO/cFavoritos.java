package ControladoresDAO;

import Modelos.Favoritos;
import Modelos.Usuarios;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/*  
*   Author     : QualiSoftware
*/
public class cFavoritos {
    
    static Session sesion;
    
    public static List<Favoritos> recuperaPorUsuario(Usuarios usu){
        sesion = (Session) NewHibernateUtil.getSession();
        Criteria criterio = sesion.createCriteria(Favoritos.class);
        criterio.add(Restrictions.eq("usuarios", usu));
        List<Favoritos> lista = criterio.list();
        return lista;
    }    
    
    public static int Inserta(Favoritos f){
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            sesion.save(f);
            sesion.getTransaction().commit();
            sesion.evict(f);
            sesion.flush();
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
    }
    
    public static int Elimina(Favoritos f){
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            if(f!=null){
                sesion.delete(f);
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
    
}
