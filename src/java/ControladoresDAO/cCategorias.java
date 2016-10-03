/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import Modelos.Categoria;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author LaPlaga
 */
public class cCategorias {
    
    static Session sesion;
    
    public static List<Categoria> RecuperaTodos(String filtro){
        //Session sesion = NewHibernateUtil.getSession();
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        Query query =sesion.createQuery("FROM Categoria WHERE catDescripcion LIKE'%"+filtro+"%'"); 
        List<Categoria> la = query.list();
        System.out.println("lista de recupera todos "+la.size());
        //sesion.close();
        return la;
    }
    
    public static Categoria RecuperaPorId(int id){
        //System.out.println(id);
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
       // Query query =sesion.createQuery("From Agenda where agId =" + id);
      //sesion.get("Agenda.class", id);
        //Agenda a = query.;
        Categoria p =(Categoria) sesion.get(Categoria.class, id);
        //sesion.close();
        return p;
    }    
    
    public static int  Elimina(Categoria e){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            if(e!=null){
               System.out.println(e.getCatId());
                sesion.delete(e);
                sesion.getTransaction().commit();
                sesion.evict(e);
                return 1;
            }
                return -1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        }finally{
           // sesion.close();
        } 
    }
    public static int  Inserta(Categoria c){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        //sesion = (Session) NewHibernateUtil.getSession();
        //sesion =  NewHibernateUtil.getSessionFactory().openSession();
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
    public static int  Modifica(Categoria c){
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
