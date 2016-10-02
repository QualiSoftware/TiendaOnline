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
    public static List<Categoria> RecuperaTodos(String filtro){
        Session sesion = NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM Categoria WHERE cat_descripcion LIKE'%"+filtro+"%'"); 
        List<Categoria> la = query.list();
        //sesion.close();
        return la;
    }
    
    public static Categoria RecuperaPorId(int id){
        //System.out.println(id);
        Session sesion = NewHibernateUtil.getSession();
       // Query query =sesion.createQuery("From Agenda where agId =" + id);
      //sesion.get("Agenda.class", id);
        //Agenda a = query.;
        Categoria p =(Categoria) sesion.get(Categoria.class, id);
        //sesion.close();
        return p;
    }
    
    
    public static int  Elimina(int id){
        Session sesion = NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            //borrar
            Categoria esto = RecuperaPorId(id);
            
            if(esto!=null){
               System.out.println(esto.getCatId());
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
    public static int  Inserta(Categoria c){
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
    public static int  Modifica(Categoria c){
        c.getCatId();
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
