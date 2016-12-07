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
        sesion = (Session) NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM Clientela WHERE clientelaDescripcion LIKE'%"+filtro+"%'"); 
        List<Clientela> la = query.list();
        return la;
    }
    
    public static Clientela RecuperaPorId(int id){
       sesion = (Session) NewHibernateUtil.getSession();
        Clientela p =(Clientela) sesion.get(Clientela.class, id);
        return p;
    }
    
    
    public static int  Elimina(Clientela esto){
        sesion = (Session) NewHibernateUtil.getSessionModif();
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
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
    }
    public static int  Inserta(Clientela c){
        sesion = (Session) NewHibernateUtil.getSession();
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
        } 
    }
    public static int  Modifica(Clientela c){      
        
        sesion = (Session) NewHibernateUtil.getSessionModif();
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
        } 
    }
}
