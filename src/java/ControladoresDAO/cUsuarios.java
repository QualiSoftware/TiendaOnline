/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import Modelos.Usuarios;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author javiermartinroncero
 */
public class cUsuarios {
    
    static Session sesion;
    
     public static List<Usuarios> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM Usuarios WHERE usuNombre LIKE'%"+filtro+"%'"); 
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
    
    public static List<Usuarios> Login(String u, String p){
        sesion = (Session) NewHibernateUtil.getSession();
        
        //Puedo usar esto
        //Query query = sesion.createQuery("From Usuarios WHERE usu_nombre  '%"+u+"%' AND usu_password = '"+p+"'"); //esto equivale a SELECT * FROM agenda
        //List<Usuarios> lista = (List) query.list();
        
        //O esto
        Criteria criterio = sesion.createCriteria(Usuarios.class);
        criterio.add(Restrictions.eq("usuEmail", u));
        criterio.add(Restrictions.eq("usuPassword",p));
        List<Usuarios> lista = criterio.list();
        return lista;
    }
    
}
