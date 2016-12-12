package ControladoresDAO;

public class cEmailDisenio {
    
    public static String DisenioAlta(String destinatario, int id){
        String enlace = "http://localhost:8080/TiendaOnline/Vistas/activa.action?accion="+id+"&usuEmail2="+destinatario;
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
}
