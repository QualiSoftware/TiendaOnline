/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import static ControladoresDAO.cColor.sesion;
import Modelos.Color;
import Modelos.Usuarios;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author javiermartinroncero
 */
public class cUsuarios {
    
     public static List<Usuarios> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM Usuarios WHERE colorDescripcion LIKE'%"+filtro+"%'"); 
        List<Usuarios> la = query.list();
        return la;
    }
    
    public static Usuarios RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        Usuarios p =(Usuarios) sesion.get(Usuarios.class, id);
        return p;
    }
    
    
    public static int  Elimina(Usuarios esto){
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            if(esto!=null){
               System.out.println(esto.getUsuId());
                sesion.delete(esto);
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
    public static int  Inserta(Usuarios c){
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
    public static int  Modifica(Usuarios c){      
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
