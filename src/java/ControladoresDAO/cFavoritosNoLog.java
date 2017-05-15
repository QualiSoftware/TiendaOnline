package ControladoresDAO;

import Modelos.NoLogFavoritos;
import Modelos.NoLogUsuarios;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/*  
*   Author     : QualiSoftware
*/
public class cFavoritosNoLog {
    
    static Session sesion;
    
    public static List<NoLogFavoritos> recuperaPorUsuario(NoLogUsuarios usu){
        sesion = (Session) NewHibernateUtil.getSession();
        Criteria criterio = sesion.createCriteria(NoLogFavoritos.class);
        criterio.add(Restrictions.eq("noLogUsuarios", usu));
        List<NoLogFavoritos> lista = criterio.list();
        return lista;
    }    
    
    public static int Inserta(NoLogFavoritos f){
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            sesion.save(f);
            sesion.getTransaction().commit();
            sesion.evict(f);
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
    }
    
}
