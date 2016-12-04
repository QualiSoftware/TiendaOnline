package ControladoresDAO;

import Modelos.Cesta;
import Modelos.Ropa;
import Modelos.ropaSH;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import org.hibernate.Query;
import org.hibernate.Session;

public class cRopa {

    static Session sesion;

    public static ArrayList<Ropa> RecuperaTodos(String filtro, String orden, String fi, String ff, String eliminadas) {
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From Ropa WHERE ";
        if(!fi.equals("") && !ff.equals("")){
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
        }
        if(!eliminadas.equals("2")){
            sql += " (roVisible = '" + eliminadas + "') AND";
        }
        sql += " (roDescripcion LIKE '%" + filtro + "%'";
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
        sql += " OR categoria.catDescripcion LIKE '%" + filtro + "%'";
        sql += " OR subcategoria.subDescripcion LIKE '%" + filtro + "%')";
        sql += " ORDER BY "+orden;
        //System.out.println("sql: "+sql);
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
    
    public static ropaSH RecuperaPorIdSH(int codigo) {
        ropaSH ficha = null;
        String sql = "SELECT * FROM ropa WHERE ro_id = " + codigo;
        //System.out.println(sql);
        try {
                Connection cnx = new Conexion().getConexion();
                if (cnx == null) {
                        return null;
                }
                Statement comando = cnx.createStatement();
                ResultSet rs = comando.executeQuery(sql);
                if (rs.next() == true) {
                    int ro_id = rs.getInt("ro_id");
                    int ro_marca_id = rs.getInt("ro_marca_id");
                    int ro_clientela_id = rs.getInt("ro_clientela_id");
                    String ro_descripcion = rs.getString("ro_descripcion");
                    int ro_look_id = rs.getInt("ro_look_id");
                    int ro_talla_id = rs.getInt("ro_talla_id");
                    double ro_precio = rs.getDouble("ro_precio");
                    double ro_descuento = rs.getDouble("ro_descuento");
                    int ro_color_id = rs.getInt("ro_color_id");
                    int ro_coleccion_id = rs.getInt("ro_coleccion_id");
                    String ro_caracteristicas = rs.getString("ro_caracteristicas");
                    int ro_visible = rs.getInt("ro_visible");
                    int ro_unidades = rs.getInt("ro_unidades");
                    Date ro_fecha = rs.getDate("ro_fecha");
                    int ro_cat_id = rs.getInt("ro_cat_id");
                    int ro_sub_id = rs.getInt("ro_sub_id");
                    ficha = new ropaSH(ro_id, ro_marca_id, ro_clientela_id, ro_descripcion, ro_look_id, ro_talla_id, ro_precio, ro_descuento, ro_color_id, ro_coleccion_id, ro_caracteristicas, ro_visible, ro_unidades, ro_fecha, ro_cat_id, ro_sub_id);
                }
                cnx.close();
                return ficha;
        } catch (SQLException e) {
                System.out.println(e.getStackTrace());
                return null;
        }

    }
}
