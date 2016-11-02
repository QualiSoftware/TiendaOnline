package ControladoresDAO;

import Modelos.Facturas;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class cFacturas {
    
    static Session sesion;
    
    public static List<Facturas> RecuperaTodos(String filtro, String orden, String fi, String ff){
        sesion = (Session) NewHibernateUtil.getSession();
        if(orden.equals("")){
            orden = "facCodigo";
        }
        String sql = "From Facturas WHERE ";
        if(!fi.equals("") && !ff.equals("")){
            sql += "facFecha >= '" + fi + "' AND facFecha <= '" + ff + "' AND (";
        }
        sql += "facRazonsocial like '%"+filtro+"%'";
        sql += " OR facCodigo like '%"+filtro+"%'";
        sql += " OR facDireccion like '%"+filtro+"%'";
        sql += " OR facPoblacion like '%"+filtro+"%'";
        sql += " OR facProvincia like '%"+filtro+"%'";
        sql += " OR facCp like '%"+filtro+"%'";
        sql += " OR facPais like '%"+filtro+"%'";
        sql += " OR facDni like '%"+filtro+"%'";
        sql += " OR facDescuento like '%"+filtro+"%'";
        sql += " OR facIva like '%"+filtro+"%'";
        sql += " OR facObservaciones like '%"+filtro+"%'";
        if(!fi.equals("") && !ff.equals("")){
            sql += ")";
        }
        sql += " ORDER BY "+orden;
        Query query = sesion.createQuery(sql);
        List<Facturas> lt = query.list();
        return lt;
    }
    public static Facturas RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        Facturas t = (Facturas) sesion.get(Facturas.class, id);
        return t;
    }
    
    public static int Inserta(Facturas t){
        sesion = (Session) NewHibernateUtil.getSession();
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
    public static int Modifica(Facturas t){
        sesion = (Session) NewHibernateUtil.getSession();
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
    
    public static int Elimina(Facturas t){
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
    }
}
