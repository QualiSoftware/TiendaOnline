/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import Modelos.Color;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author LaPlaga
 */
public class cColor {
    static Session sesion;
    
    public static List<Color> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        Query query =sesion.createQuery("FROM Color WHERE colorDescripcion LIKE'%"+filtro+"%'"); 
        List<Color> la = query.list();
        //sesion.close();
        return la;
    }
    
    public static Color RecuperaPorId(int id){
        //System.out.println(id);
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
       // Query query =sesion.createQuery("From Agenda where agId =" + id);
      //sesion.get("Agenda.class", id);
        //Agenda a = query.;
        Color p =(Color) sesion.get(Color.class, id);
        //sesion.close();
        return p;
    }
    
    
    public static int  Elimina(Color esto){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            
            if(esto!=null){
               System.out.println(esto.getColorId());
                sesion.delete(esto);
                sesion.getTransaction().commit();
                return 1;
            }
                return -1;
        }catch(Exception ex){
           // System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        }finally{
           // sesion.close();
        } 
    }
    public static int  Inserta(Color c){
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
    public static int  Modifica(Color c){      
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            sesion.update(c);
            sesion.getTransaction().commit();
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        }finally{
           // sesion.close();
        } 
    }
}
