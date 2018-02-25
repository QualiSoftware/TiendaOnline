package ControladoresDAO;

import Modelos.RopaStock;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/*  
*   Author     : QualiSoftware
*/
public class cRopaStock {
    
    
    static Session sesion;
    
    public static List<RopaStock> RecuperaTodos(int roId,String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From RopaStock WHERE ropa.roId = " + roId;
        Query query = sesion.createQuery(sql);
        List<RopaStock> lt = query.list();
        return lt;
    }
    
    public static List<RopaStock> RecuperaPorRopaColor(int roId, int color){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From RopaStock WHERE ropa.roId="+roId+" AND color.colorId="+color;
        Query query = sesion.createQuery(sql);
        List<RopaStock> lt = query.list();
        return lt;
    }
    
    public static List<RopaStock> RecuperaPorTalla(int talla){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From RopaStock WHERE tallas.tallaId="+talla;
        Query query = sesion.createQuery(sql);
        List<RopaStock> lt = query.list();
        return lt;
    }
    
    public static RopaStock RecuperaPorRopaColorTalla(int roId, int color, int talla){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From RopaStock WHERE ropa.roId="+roId+" AND color.colorId="+color+" AND tallas.tallaId="+talla;
        Query query = sesion.createQuery(sql);
        List<RopaStock> lt = query.list();
        RopaStock rs = null;
        try{
            rs = lt.get(0);
        }catch(Exception e){
            
        }
        return rs;
    }
    
    public static RopaStock RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        RopaStock rs = (RopaStock) sesion.get(RopaStock.class, id);
        return rs;
    }
    
    public static int Inserta(RopaStock t){
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
    public static int Modifica(RopaStock t){
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
    
    public static int Elimina(RopaStock t){
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
    
    public static List<RopaStock> RecuperaRopaNovedades(int dias, String filtro){
       sesion = (Session) NewHibernateUtil.getSession();
       String sql = "FROM RopaStock WHERE ";
            Date hoy = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
            String fechaHoy = sdf.format(hoy);
            Calendar cal = Calendar.getInstance();
            cal.setTime(hoy);
            cal.add(Calendar.DATE, dias * (-1));
            Date nuevaFecha = cal.getTime();            
            String fechaPeriodo = sdf.format(nuevaFecha);
            sql += "(rostockFecha BETWEEN '" + fechaPeriodo + "' AND '" + fechaHoy + "')"
            + " AND (ropa.roVisible = 1)"
            + " AND(ropa.roDescripcion LIKE '%" + filtro + "%'"
            + " OR ropa.roPrecio LIKE '%" + filtro + "%'"
            + " OR (ropa.roPrecio - (ropa.roPrecio * ropa.roDescuento / 100)) LIKE '%" + filtro + "%'"
            + " OR ropa.roCaracteristicas LIKE '%" + filtro + "%')"
            + " GROUP BY ropa.roId";
        Query query =sesion.createQuery(sql); 
        List<RopaStock> lcc = query.list();
        return lcc;
    }
}
