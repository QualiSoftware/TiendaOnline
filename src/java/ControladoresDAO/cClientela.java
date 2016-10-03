/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import Modelos.Categoria;
import Modelos.Clientela;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author LaPlaga
 */
public class cClientela {
    static Session sesion;
    
    public static List<Clientela> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        Query query =sesion.createQuery("FROM Clientela WHERE clientelaDescripcion LIKE'%"+filtro+"%'"); 
        List<Clientela> la = query.list();
        System.out.println(la.size());
        //sesion.close();
        return la;
    }
    
    public static Clientela RecuperaPorId(int id){
        //System.out.println(id);
       sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
       // Query query =sesion.createQuery("From Agenda where agId =" + id);
      //sesion.get("Agenda.class", id);
        //Agenda a = query.;
        Clientela p =(Clientela) sesion.get(Clientela.class, id);
        //sesion.close();
        return p;
    }
    
    
    public static int  Elimina(Clientela esto){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{

            
            if(esto!=null){
               System.out.println(esto.getClientelaId());
                sesion.delete(esto);
                sesion.getTransaction().commit();
                sesion.evict(esto);
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
    public static int  Inserta(Clientela c){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            sesion.save(c);
            sesion.getTransaction().commit();
            sesion.evict(c);
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        }finally{
            //sesion.close();
        } 
    }
    public static int  Modifica(Clientela c){      
        
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            sesion.update(c);
            sesion.getTransaction().commit();
            sesion.evict(c);
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
