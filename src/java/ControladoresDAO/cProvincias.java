/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import Modelos.Provincias;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author javiermartinroncero
 */
public class cProvincias {
    
        static Session sesion;
        public static List<Provincias> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM Provincias WHERE proId LIKE'%"+filtro+"%'"); 
        List<Provincias> la = query.list();
        return la;
    }
        public static Provincias RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        Provincias p =(Provincias) sesion.get(Provincias.class, id);
        return p;
    }
    
}
