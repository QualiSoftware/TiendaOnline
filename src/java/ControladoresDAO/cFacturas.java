package ControladoresDAO;

import Modelos.Facturas;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class cFacturas {
    
    static Session sesion;
    
    public static List<Facturas> RecuperaTodos(String filtro, String orden, String fi, String ff){
        sesion = (Session) NewHibernateUtil.getSessionModif();
        if(orden.equals("")){
            orden = "facCodigo";
        }
        String sql = "From Facturas WHERE ";
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
            sql += "facFecha >= '" + fi + "' AND facFecha <= '" + ff + "' AND ";
        }
        sql += "(facRazonsocial like '%"+filtro+"%'";
        sql += " OR facCodigo like '%"+filtro+"%'";
        sql += " OR facDireccion like '%"+filtro+"%'";
        sql += " OR facPoblacion like '%"+filtro+"%'";
        sql += " OR facProvincia like '%"+filtro+"%'";
        sql += " OR facCp like '%"+filtro+"%'";
        sql += " OR facPais like '%"+filtro+"%'";
        sql += " OR facDni like '%"+filtro+"%'";
        sql += " OR facDescuento like '%"+filtro+"%'";
        sql += " OR facIva like '%"+filtro+"%'";
        sql += " OR facObservaciones like '%"+filtro+"%')";
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
    
    public static List<Facturas> RecuperaPorUsuario(int usu_id){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From Facturas WHERE ";
        sql += "facUsuId = "+usu_id;
        sql += " ORDER BY facFecha";
        Query query = sesion.createQuery(sql);
        List<Facturas> lu = query.list();
        return lu;
    }
    
    public static int Inserta(Facturas t){
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            sesion.save(t);
            sesion.getTransaction().commit();
            sesion.evict(t);
            int id = SaberUltimoId();
            return id;
        }catch(Exception e){
            sesion.getTransaction().rollback();
            return -1;
        }
    }
    public static int Modifica(Facturas t){
        sesion = (Session) NewHibernateUtil.getSessionModif();
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
        sesion = (Session) NewHibernateUtil.getSessionModif();
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
    
    public static String SiguienteFactura(){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "select facCodigo From Facturas ORDER BY facId";
        Query query = sesion.createQuery(sql);
        List<String> uf = query.list();
        int j=-1;
        List<Integer> listaInt = new ArrayList<Integer>();
        for(String list:uf){
            listaInt.add(Integer.parseInt(list));
            j++;
        }
        int i = listaInt.get(j)+1;
        listaInt.clear();
        uf.clear();
        return ""+i;
    }
    
    public static int SaberUltimoId(){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "select max(facId) From Facturas";
        Query query = sesion.createQuery(sql);
        List<Integer> uf = query.list();
        return uf.get(0);
    }
}
