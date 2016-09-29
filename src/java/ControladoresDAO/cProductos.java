package ControladoresDAO;

import Modelos.Productos;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class cProductos {
        public static List<Productos> Recupera_todos() {
        /// Crear sesion (Conexion a la base de datos) a traves de hibernate.
        Session sesion=NewHibernateUtil.getSessionFactory().openSession();
        sesion.flush();
        sesion.clear();
        //Crear el query desde hibernate para volcar todo de Agenda
        Query query=sesion.createQuery("From Productos ORDER by prod_fecha_alta");
        //Vaciar el resultado de la seleccion en la lista
        List<Productos> la =query.list();
        for (Productos l:la) {
            System.out.println(l.getOfertas().getOfertaDescuento());
            System.out.println(l.getSecciones().getSeccNombre());
        }
        
        return la;
    }
    public static List<Productos> CargaProOferta(){
       Session sesion = ControladoresDAO.NewHibernateUtil.getSessionFactory().openSession();
        Query query =sesion.createQuery("From Productos where ofertas !='1'");
        System.out.println(query);
        List<Productos> lp = query.list();
        sesion.close();
        return lp;
   }
}