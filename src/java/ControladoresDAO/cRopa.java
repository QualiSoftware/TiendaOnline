package ControladoresDAO;

import Modelos.Ropa;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;

public class cRopa {

    static Session sesion;

    public static ArrayList<Ropa> RecuperaTodos(String filtro) {
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From Ropa WHERE roDescripcion like '%" + filtro + "%'";
        Query query = sesion.createQuery(sql);
        ArrayList<Ropa> lt = (ArrayList) query.list();
        return lt;
    }

    public static Ropa RecuperaPorId(int id) {
        sesion = (Session) NewHibernateUtil.getSession();
        Ropa p = (Ropa) sesion.get(Ropa.class, id);
        return p;
    }

    public static int Inserta(Ropa t) {
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try {
            sesion.save(t);
            sesion.getTransaction().commit();
            sesion.evict(t);
            return 1;
        } catch (Exception e) {
            sesion.getTransaction().rollback();
            System.out.println("Exception: " + e);
            return -1;
        }
    }

    public static int Modifica(Ropa t) {
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try {
            sesion.update(t);
            sesion.getTransaction().commit();
            sesion.evict(t);
            return 1;
        } catch (Exception e) {
            sesion.getTransaction().rollback();
            System.out.println("Exception: " + e);
            return -1;
        }
    }

    /*public static int Elimina(Ropa t){
        sesion = (Session) NewHibernateUtil.getSession();
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
    }*/
}
