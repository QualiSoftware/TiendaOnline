/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import Modelos.Clientela;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author LaPlaga
 */
public class cClientela {
    public static List<Clientela> RecuperaTodos(String filtro){
        Session sesion = NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM Clientela WHERE clientelaDescripcion LIKE'%"+filtro+"%'"); 
        List<Clientela> la = query.list();
        //sesion.close();
        return la;
    }
    
    public static Clientela RecuperaPorId(int id){
        //System.out.println(id);
        Session sesion = NewHibernateUtil.getSession();
       // Query query =sesion.createQuery("From Agenda where agId =" + id);
      //sesion.get("Agenda.class", id);
        //Agenda a = query.;
        Clientela p =(Clientela) sesion.get(Clientela.class, id);
        //sesion.close();
        return p;
    }
    
    
    public static int  Elimina(int id){
        Session sesion = NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            //borrar
            Clientela esto = RecuperaPorId(id);
            
            if(esto!=null){
               System.out.println(esto.getClientelaId());
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
    public static int  Inserta(Clientela c){
        Session sesion = NewHibernateUtil.getSession();
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
    public static int  Modifica(Clientela c){      
        c.getClientelaId();
        Session sesion = NewHibernateUtil.getSession();
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
