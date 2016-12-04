/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import Modelos.Paises;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author javiermartinroncero
 */
public class cPaises {
    static Session sesion;
        public static List<Paises> RecuperaTodos(String filtro){
        sesion = (Session) NewHibernateUtil.getSession();
        Query query =sesion.createQuery("FROM Paises WHERE paisId LIKE'%"+filtro+"%'"); 
        List<Paises> la = query.list();
        return la;
    }
        
        public static Paises RecuperaPorId(int id){
        sesion = (Session) NewHibernateUtil.getSession();
        Paises p =(Paises) sesion.get(Paises.class, id);
        return p;
    }
    
}
