package ControladoresDAO;

import Modelos.Usuarios;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class cUsuarios {
    
    public static List<Usuarios> Login(String login, String clave) {
        
        Session sesion=NewHibernateUtil.getSessionFactory().openSession();
        String sql = "FROM Usuarios where usu_login='" + login + "' AND usu_clave='" + clave +"'";
        System.out.println(sql);
        Query q=sesion.createQuery(sql);
        List<Usuarios> l=q.list();
        System.out.println("Lista: " + l);
        sesion.close();
        return l;
    }
}
