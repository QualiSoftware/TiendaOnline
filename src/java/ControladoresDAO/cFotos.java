/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import Modelos.Fotos;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author LaPlaga
 */
public class cFotos {
    
      static Session sesion;
    
    public static List<Fotos> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        Query query =sesion.createQuery("FROM Fotos WHERE fotosRuta LIKE'%"+filtro+"%'"); 
        List<Fotos> la = query.list();
         System.out.println("lista de recupera todos "+la.size());
        //sesion.close();
        return la;
    }
    
    public static Fotos RecuperaPorId(int id){
        //System.out.println(id);
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
       // Query query =sesion.createQuery("From Agenda where agId =" + id);
      //sesion.get("Agenda.class", id);
        //Agenda a = query.;
        Fotos p =(Fotos) sesion.get(Fotos.class, id);
        //sesion.close();
        return p;
    }
    
    
    public static int  Elimina(Fotos esto){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            
            if(esto!=null){
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
    public static int  Inserta(Fotos c){
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
    public static int  Modifica(Fotos c){      
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
