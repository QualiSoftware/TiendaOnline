/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import static ControladoresDAO.cRopa.sesion;
import Modelos.Cesta;
import org.hibernate.Session;

/**
 *
 * @author javiermartinroncero
 */
public class cCesta {
    //inserta ropa en cesta por usuario
    public static int InsertaRopaCestaUsuario(Cesta c) {
        sesion = (Session) NewHibernateUtil.getSession();
        sesion.beginTransaction();
        try {
            sesion.save(c);
            sesion.getTransaction().commit();
            sesion.evict(c);
            return 1;
        } catch (Exception e) {
            sesion.getTransaction().rollback();
            System.out.println("Exception: " + e);
            return -1;
        }
    }
}
