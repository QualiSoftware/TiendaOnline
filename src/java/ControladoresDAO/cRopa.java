package ControladoresDAO;

import Modelos.Cesta;
import Modelos.Ropa;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;

public class cRopa {

    static Session sesion;

    public static ArrayList<Ropa> RecuperaTodos(String filtro, String orden) {
        sesion = (Session) NewHibernateUtil.getSession();
        if(orden.equals("")){
            orden = "categoria.catDescripcion";
        }
        String sql = "From Ropa WHERE roDescripcion LIKE '%" + filtro + "%'";
        sql += " OR marcas.marcaNombre LIKE '%" + filtro + "%'";
        sql += " OR clientela.clientelaDescripcion LIKE '%" + filtro + "%'";
        sql += " OR look.lookDescripcion LIKE '%" + filtro + "%'";
        sql += " OR tallas.tallaDescripcion LIKE '%" + filtro + "%'";
        sql += " OR roPrecio LIKE '%" + filtro + "%'";
        sql += " OR roDescuento LIKE '%" + filtro + "%'";
        sql += " OR color.colorDescripcion LIKE '%" + filtro + "%'";
        sql += " OR coleccion.coleccionDescripcion LIKE '%" + filtro + "%'";
        sql += " OR roCaracteristicas LIKE '%" + filtro + "%'";
        sql += " OR roUnidades LIKE '%" + filtro + "%'";
        sql += " OR roFecha LIKE '%" + filtro + "%'";
        sql += " OR categoria.catDescripcion LIKE '%" + filtro + "%'";
        sql += " OR subcategoria.subDescripcion LIKE '%" + filtro + "%'";
        sql += " ORDER BY "+orden;
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
    
    public static ArrayList<Ropa> RecuperaTodoPorSubcategoria(int sub) {
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From Ropa WHERE ro_sub_id = " + sub;
        Query query = sesion.createQuery(sql);
        ArrayList<Ropa> lt = (ArrayList) query.list();
        return lt;
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
