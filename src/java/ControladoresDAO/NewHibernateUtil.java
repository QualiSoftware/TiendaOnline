package ControladoresDAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class NewHibernateUtil {
    
 private static final SessionFactory sessionFactory;
 
    private static Session sesion;
    
    static {
        try {
            sessionFactory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) { 
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
        }/*else{
            sesion.clear();
            sesion = getSessionFactory().openSession();
        }*/
        return sesion;
    }
}