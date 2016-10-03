/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import Modelos.Coleccion;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author LaPlaga
 */
public class cColeccion {
    static Session sesion;
    
    public static List<Coleccion> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        Query query =sesion.createQuery("FROM Coleccion WHERE coleccionDescripcion LIKE'%"+filtro+"%'"); 
        List<Coleccion> la = query.list();
        //sesion.close();
        return la;
    }
    
    public static Coleccion RecuperaPorId(int id){
        //System.out.println(id);
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
       // Query query =sesion.createQuery("From Agenda where agId =" + id);
      //sesion.get("Agenda.class", id);
        //Agenda a = query.;
        Coleccion p =(Coleccion) sesion.get(Coleccion.class, id);
        //sesion.close();
        return p;
    }
    
    
    public static int  Elimina(Coleccion esto){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            //borrar
            
            if(esto!=null){
               System.out.println(esto.getColeccionId());
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
    public static int  Inserta(Coleccion c){
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
    public static int  Modifica(Coleccion c){      
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
