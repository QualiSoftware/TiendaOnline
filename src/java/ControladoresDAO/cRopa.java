/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import Modelos.Ropa;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author LaPlaga
 */
public class cRopa {
    
    static Session sesion;
    
    public static ArrayList<Ropa> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        String sql = "From Ropa WHERE roDescripcion like '%"+filtro+"%'";
          
        Query query = sesion.createQuery(sql);
        ArrayList<Ropa> lt = (ArrayList) query.list();
        return lt;
    }
    public static Ropa RecuperaPorId(String id){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        Ropa t = (Ropa) sesion.get(Ropa.class, Integer.parseInt(id));
        return t;
    }
    
    public static int Inserta(Ropa t){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            sesion.save(t);
            sesion.getTransaction().commit();
            sesion.evict(t);
            return 1;
        }catch(Exception e){
            sesion.getTransaction().rollback();
            return -1;
        }
    }
    public static int Modifica(Ropa t){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            sesion.update(t);
            sesion.getTransaction().commit();
            sesion.evict(t);
            return 1;
        }catch(Exception e){
            sesion.getTransaction().rollback();
            return -1;
        }
    }
    
    public static int Elimina(Ropa t){
        sesion = (Session) NewHibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        try{
            if(t != null){
                sesion.delete(t);
                sesion.getTransaction().commit();
                sesion.evict(t);
                return 1;
            }
            return -1;
        }catch(Exception e){
            sesion.getTransaction().rollback();
            return -1;
        }
    }
}
