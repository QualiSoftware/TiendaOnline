package ControladoresDAO;

import Modelos.Usuarios;

/*  
*   Author     : QualiSoftware
*/
public class cEmailDisenio {
    
    public static String DisenioAlta(int id){
        String enlace = Acciones.HomePropiedades.muestraValor("url")+"/TiendaOnline/Vistas/activa.action?accion="+id;
        String mensaje = "<HTML><BODY>"
                + "<h1>Para confirmar su usuario </h1><a href=\""+enlace+"\">Presione este enlace</a>"
                + "</BODY></HTML>";
        return mensaje;
    }
    
    public static String DisenioCompra(String to, String file){
        String mensaje = "<HTML><BODY>"
                + "Se adjunta la factura"
                + "</BODY></HTML>";
        //para agregar imágenes pongo dentro del body
        //<img src='cid:cidnombre' />
        //colocando en el campo cidnombre el nombre que quiera
        return mensaje;
    }
    
    public static String DisenioApadrina(String nombre, String email, Usuarios u){
        String enlace = Acciones.HomePropiedades.muestraValor("url")+"/TiendaOnline/Vistas/altaUsuarioApadrinado.action?usuEmail="+email;
        String mensaje = "<HTML><BODY>"
                + "<h1>Hola <b>"+nombre+"</b>!</h1><br>"
                + "<p>Este email te llega porque "+u.getUsuNombre()+" "+u.getUsuApellidos()
                +" te está enviando esta invitación para que te puedas dar de alta en nuestra tienda beneficiándote en"
                + " tus compras con un "+ Acciones.HomePropiedades.muestraValor("descuento") +"% de descuento"
                + " durante "+ Acciones.HomePropiedades.muestraValor("dias.descuento") +" días!<br>"
                + "Para poder darte de alta por favor pincha en el siguiente enlace:<br>"
                + "<a href=\""+enlace+"\">Pincha aquí para darte de alta</a></p>"
                + "</BODY></HTML>";
        return mensaje;        
    }
    
    public static String DisenioRecuperaPass(Usuarios u){
        String enlace = Acciones.HomePropiedades.muestraValor("url")+"/TiendaOnline/Vistas/Tienda.action";
        String mensaje = "<HTML><BODY>"
                + "<h1>Hola <b>"+u.getUsuNombre()+" "+u.getUsuApellidos()+"</b>!</h1><br>"
                + "<p>Este email te llega porque has pedido recuperar tu contraseña en nuestra tienda. "
                + "Te hacemos llegar tu nueva contraseña.<br><br>"
                + "Usuario: "+u.getUsuEmail()+"<br>"
                + "Contraseña: nueva<br><br>"
                + "Para abrir la página de nuestra tienda por favor pincha en el siguiente enlace:<br>"
                + "<a href=\""+enlace+"\">Super Look</a></p>"
                + "</BODY></HTML>";
        return mensaje;        
    }
}
