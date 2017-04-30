package ControladoresDAO;

import Modelos.Color;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/*  
*   Author     : QualiSoftware
*/
public class cColor {
    static Session sesion;
    
    public static List<Color> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM Color WHERE colorDescripcion LIKE'%"+filtro+"%'"); 
        List<Color> la = query.list();
        return la;
    }
    
    public static Color RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        Color p =(Color) sesion.get(Color.class, id);
        return p;
    }
}
