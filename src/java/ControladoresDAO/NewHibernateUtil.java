/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * @author LaPlaga
 */
public class NewHibernateUtil {
    
 private static final SessionFactory sessionFactory;
    private static Session sesion;
    
    static {
        try {
            // Create the SessionFactory from standard (hibernate.cfg.xml) 
            // config file.
            sessionFactory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public static Session getSession(){
        if(sesion == null){
            sesion = getSessionFactory().openSession();
            System.out.println("Era null la conexión");
        }/*else{
            sesion.clear();
            sesion = getSessionFactory().openSession();
        }*/
        //System.out.println("Una conexion Hibernate");
        return sesion;
}
}
