package ControladoresDAO;

import Modelos.Cesta;
import Modelos.Ropa;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/*  
*   Author     : QualiSoftware
*/
public class cRopa {

    static Session sesion;

    public static ArrayList<Ropa> RecuperaTodos(String filtro, String orden, String fi, String ff, String eliminadas) {
        sesion = (Session) NewHibernateUtil.getSessionModif();
        String sql = "From Ropa WHERE ";
        /*if(!fi.equals("") && !ff.equals("")){
            String year;
            String month;
            String day;
            year = fi.substring(6, 10);
            month = fi.substring(3, 5);
            day = fi.substring(0, 2);
            fi = year+"-"+month+"-"+day;
            year = ff.substring(6, 10);
            month = ff.substring(3, 5);
            day = ff.substring(0, 2);
            ff = year+"-"+month+"-"+day;
            sql += "roFecha >= '" + fi + "' AND roFecha <= '" + ff + "' AND";
        }*/
        if(!eliminadas.equals("2")){
            sql += " (roVisible = '" + eliminadas + "') AND";
        }
        sql += " (roDescripcion LIKE '%" + filtro + "%'";
        sql += " OR marcas.marcaNombre LIKE '%" + filtro + "%'";
        sql += " OR clientela.clientelaDescripcion LIKE '%" + filtro + "%'";
        sql += " OR look.lookDescripcion LIKE '%" + filtro + "%'";
        //sql += " OR tallas.tallaDescripcion LIKE '%" + filtro + "%'";
        sql += " OR roPrecio LIKE '%" + filtro + "%'";
        sql += " OR roDescuento LIKE '%" + filtro + "%'";
        //sql += " OR color.colorDescripcion LIKE '%" + filtro + "%'";
        sql += " OR coleccion.coleccionDescripcion LIKE '%" + filtro + "%'";
        sql += " OR roCaracteristicas LIKE '%" + filtro + "%'";
        //sql += " OR roUnidades LIKE '%" + filtro + "%'";
        sql += " OR categoria.catDescripcion LIKE '%" + filtro + "%'";
        sql += " OR subcategoria.subDescripcion LIKE '%" + filtro + "%')";
        sql += " ORDER BY "+orden;
        //System.out.println("sql: "+sql);
        Query query = sesion.createQuery(sql);
        ArrayList<Ropa> lt = (ArrayList) query.list();
        return lt;
    }
    
    public static List<Ropa> RecuperaPorCampaña(String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM Ropa WHERE marcas = "+filtro); 
        List<Ropa> la = query.list();
        return la;
    }
    
    public static ArrayList<Ropa> RecuperaClientelaCategoria(String cli,String cat,String filtro){
       sesion = (Session) NewHibernateUtil.getSession();
       String sql = "FROM Ropa WHERE clientela.clientelaId = " + cli 
            + " AND categoria.catId = " + cat 
            + " AND roVisible = 1"
            + " AND(roDescripcion LIKE '%" + filtro + "%'"
            //+ " OR tallas.tallaDescripcion LIKE '%" + filtro + "%'"
            + " OR roPrecio LIKE '%" + filtro + "%'"
            + " OR (roPrecio - (roPrecio * roDescuento / 100)) LIKE '%" + filtro + "%'"
            //+ " OR color.colorDescripcion LIKE '%" + filtro + "%'"
            + " OR roCaracteristicas LIKE '%" + filtro + "%')";
        //System.out.println("sql: "+sql);
        Query query =sesion.createQuery(sql); 
        ArrayList<Ropa> lcc = (ArrayList) query.list();
        return lcc; 
    }
    
    public static ArrayList<Ropa> RecuperaPorMarca(String marca,String filtro){
       sesion = (Session) NewHibernateUtil.getSession();
       String sql = "FROM Ropa WHERE marcas.marcaId = " + marca
            + " AND roVisible = 1"
            + " AND(roDescripcion LIKE '%" + filtro + "%'"
            //+ " OR tallas.tallaDescripcion LIKE '%" + filtro + "%'"
            + " OR roPrecio LIKE '%" + filtro + "%'"
            + " OR (roPrecio - (roPrecio * roDescuento / 100)) LIKE '%" + filtro + "%'"
            //+ " OR color.colorDescripcion LIKE '%" + filtro + "%'"
            + " OR categoria.catDescripcion LIKE '%" + filtro + "%'"
            + " OR clientela.clientelaDescripcion LIKE '%" + filtro + "%'"
            + " OR roCaracteristicas LIKE '%" + filtro + "%')";
        //System.out.println("sql: "+sql);
        Query query =sesion.createQuery(sql); 
        ArrayList<Ropa> lcc = (ArrayList) query.list();
        return lcc; 
    }
    
    public static Ropa RecuperaPorId(int id) {
        sesion = (Session) NewHibernateUtil.getSessionModif();
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
            int id = SaberUltimoId();
            return id;
        } catch (Exception e) {
            sesion.getTransaction().rollback();
            System.out.println("Exception: " + e);
            return -1;
        }
    }

    public static int Modifica(Ropa t) {
        sesion = (Session) NewHibernateUtil.getSessionModif();
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
    
    public static ArrayList<Ropa> RecuperaTodoPorAlgo(String algo, int id, int visible) {
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From Ropa WHERE " + algo + " = " + id + " AND roVisible = " + visible;
        Query query = sesion.createQuery(sql);
        ArrayList<Ropa> lt = (ArrayList) query.list();
        return lt;
    }
    
    public static int SaberUltimoId(){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "select max(roId) From Ropa";
        Query query = sesion.createQuery(sql);
        List<Integer> uf = query.list();
        return uf.get(0);
    }
    
    public static ArrayList<Ropa> RecuperaRopaConDescuento(String filtro){
       sesion = (Session) NewHibernateUtil.getSession();
       String sql = "FROM Ropa WHERE roDescuento > 0 "
            + " AND roVisible = 1"
            + " AND(roDescripcion LIKE '%" + filtro + "%'"
            + " OR roPrecio LIKE '%" + filtro + "%'"
            + " OR (roPrecio - (roPrecio * roDescuento / 100)) LIKE '%" + filtro + "%'"
            + " OR roCaracteristicas LIKE '%" + filtro + "%')";
        Query query =sesion.createQuery(sql); 
        ArrayList<Ropa> lcc = (ArrayList) query.list();
        return lcc;
    }
}