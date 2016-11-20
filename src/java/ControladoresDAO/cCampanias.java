package ControladoresDAO;

import Modelos.Campania;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/*  Document   : HomeCampanias.java
*   Created on : 20-nov-2016
*   Author     : QualiSoftware
*/
public class cCampanias {
    
     static Session sesion;
    
    public static List<Campania> RecuperaTodos(String filtro, String fecha, String orden){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From Campania WHERE ";        
        if(!fecha.equals("")){
            String year;
            String month;
            String day;
            year = fecha.substring(6, 10);
            month = fecha.substring(3, 5);
            day = fecha.substring(0, 2);
            fecha = year+"-"+month+"-"+day;
            sql += "camFin >= '" + fecha + "' AND camInicio <= '" + fecha + "' AND ";
        }
        sql += "(camMarca like '%"+filtro+"%'";
        sql += " OR camNombre like '%"+filtro+"%')";
        sql += " ORDER BY "+orden;
        Query query =sesion.createQuery(sql); 
        List<Campania> lc = query.list();
        return lc;
    }
    
    public static Campania RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        Campania c =(Campania) sesion.get(Campania.class, id);
        return c;
    }
    
    
    public static int  Elimina(Campania c){
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            if(c!=null){
                sesion.delete(c);
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
    public static int  Inserta(Campania c){
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
    public static int  Modifica(Campania c){      
        sesion = (Session) NewHibernateUtil.getSession();
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
