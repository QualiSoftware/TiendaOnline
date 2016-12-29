package ControladoresDAO;

import Modelos.Campania;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/*  Document   : HomeCampanias.java
*   Created on : 20-nov-2016
*   Author     : QualiSoftware
*/
public class cCampanias {
    
     static Session sesion;
    
    public static List<Campania> RecuperaTodos(String filtro, String fecha, String orden){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "From Campania WHERE ";        
        if(!fecha.equals("")){
            String year;
            String month;
            String day;
            year = fecha.substring(6, 10);
            month = fecha.substring(3, 5);
            day = fecha.substring(0, 2);
            fecha = year+"-"+month+"-"+day;
            sql += "camFin >= '" + fecha + "' AND camInicio <= '" + fecha + "' AND ";
        }
        sql += "(camNombre like '%"+filtro+"%')";
        sql += " ORDER BY "+orden;
        Query query =sesion.createQuery(sql); 
        List<Campania> lc = query.list();
        return lc;
    }
    
    public static List<Campania> RecuperaCampaniasActivas(String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        Date fechaHoy = new Date();        
        int year = fechaHoy.getYear() + 1900;
        int month = fechaHoy.getMonth()+1;
        int day = fechaHoy.getDate();
        String monthString;
        String dayString;
        if(month < 10){
            monthString = "0"+month;
        }else{
            monthString = ""+month;
        }
        if(day < 10){
            dayString = "0"+day;
        }else{
            dayString = ""+day;
        }
        String hoy = year+"-"+monthString+"-"+dayString;
        String sql = "From Campania WHERE ";
        sql += "camFin >= '" + hoy + "'";
        sql += " AND '" + hoy + "' >= camInicio";
        if(!filtro.equals("")){
            sql += " AND (camNombre LIKE '%"+filtro+"%')";
        }        
        sql += " ORDER BY camFin";
        Query query =sesion.createQuery(sql); 
        List<Campania> lc = query.list();
        return lc;
    }
    
    public static Campania RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        Campania c =(Campania) sesion.get(Campania.class, id);
        return c;
    }
    
    
    public static int  Elimina(Campania c){
        sesion = (Session) NewHibernateUtil.getSessionModif();
        sesion.beginTransaction();
        try{
            if(c!=null){
                ControladoresDAO.cCampaniasRopa.Elimina(c.getCamId());
                sesion.delete(c);
                sesion.getTransaction().commit();
                return 1;
            }
                return -1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
    }
    public static int  Inserta(Campania c){
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try{
            sesion.save(c);
            sesion.getTransaction().commit();
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        } 
    }
    public static int  Modifica(Campania c){      
        sesion = (Session) NewHibernateUtil.getSessionModif();
        sesion.beginTransaction();
        try{
            sesion.update(c);
            sesion.getTransaction().commit();
            return 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            sesion.getTransaction().rollback();
            return -1;
        }
    }
    
    public static int UltimaCampania(){
        sesion = (Session) NewHibernateUtil.getSession();
        String sql = "select max(camId) From Campania";
        Query query = sesion.createQuery(sql);
        List<Integer> uf = query.list();
        int i = uf.get(0);
        return i;
    }
}
