package ControladoresDAO;

import Modelos.Propiedades;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/*  
*   Author     : QualiSoftware
*/
public class cPropiedades {
    
    static Session sesion;
    
    public static Propiedades recuperaPorLlave(String key){
        sesion = (Session) NewHibernateUtil.getSession();
        Criteria criterio = sesion.createCriteria(Propiedades.class);
        criterio.add(Restrictions.eq("proKey", key));
        List<Propiedades> lista = criterio.list();
        if(lista.size()==1){
            return lista.get(0);
        } else {
            return null;
        }
    }
    
    public static String recuperaValorPorLlave(String key){
        sesion = (Session) NewHibernateUtil.getSession();
        Criteria criterio = sesion.createCriteria(Propiedades.class);
        criterio.add(Restrictions.eq("proKey", key));
        List<Propiedades> lista = criterio.list();
        if(lista.size()==1){
            return lista.get(0).getProValue();
        } else {
            return "";
        }
    }
    
    public static int  Modifica(Propiedades propiedades){      
        sesion = (Session) NewHibernateUtil.getSessionModif();
        sesion.beginTransaction();
        try{
            sesion.update(propiedades);
            sesion.getTransaction().commit();
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
    }
    
}
