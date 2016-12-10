package ControladoresDAO;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import org.apache.struts2.ServletActionContext;

public class cEmail{
    
    static String ruta;
    
    public static boolean enviarAlta(String destinatario, int id){
        boolean enviadoAlta = false;
        String enlace = "http://localhost:8080/TiendaOnline/Vistas/activa.action?accion="+id+"&usuEmail2="+destinatario;
        String asunto = "Activación de cuenta de usuario";
        String mensaje = "<h1>Para confirmar su usuario </h1><a href=\""+enlace+"\">Presione este enlace</a>";
        enviadoAlta = funcionEnviar(destinatario, "", asunto, mensaje);
        return enviadoAlta;
    }
    
    public static boolean enviarCorreo(String to, String file){
        boolean enviadoCompra = false;
        String asunto = "Envío de factura";
        String mensaje = "Se adjunta la factura";
        enviadoCompra = funcionEnviar(to, file, asunto, mensaje);
        if(enviadoCompra){
            //Esto sirve para enviarle la factura también al vendedor cada vez que se realice una venta
            //boolean descarto = funcionEnviar("acá poner email del vendedor",file,"Se realizó una compra","Factura de la compra");
        }
        return enviadoCompra;
    }
    
    //public static boolean enviarCorreo(String[] para){
    private static boolean funcionEnviar(String para, String archivo, String asunto, String mensaje){
        boolean enviado = false;
            try{            
                String host = "smtp.gmail.com";
                String de = "empresa2016sl@gmail.com";
                
                Properties prop = System.getProperties();
                
                prop.put("mail.smtp.starttls.enable","true");
                prop.put("mail.smtp.host", host);
                prop.put("mail.smtp.port",587);
                prop.put("mail.smtp.auth","true");
                
                final String username = "empresa2016sl@gmail.com";
                final String password = "q.s.2016";
                
                Session sesion = Session.getInstance(prop,
                   new javax.mail.Authenticator() {
                      protected PasswordAuthentication getPasswordAuthentication() {
                         return new PasswordAuthentication(username, password);
                      }
                });                
                MimeMessage message = new MimeMessage(sesion);                
                message.setFrom(new InternetAddress(de));                
                /*                    
                    NOTA: para enviar correo electronico masivo
                
                    InternetAddress[] direcciones = new InternetAddress[para.length];
                    for(int i=0;i<para.length;i++){
                        direcciones[i] = new InternetAddress(para[i]);
                    }                
                    for(int i=0;i<direcciones.length;i++){
                        message.addRecipient(Message.RecipientType.TO, direcciones[i]);
                    }                
                */                
                //Para correo a un solo receptor va esta línea
                message.setRecipient(Message.RecipientType.TO, new InternetAddress(para));                
                message.setSubject(asunto);                
                BodyPart messageBodyPart = new MimeBodyPart();                
                messageBodyPart.setText(mensaje);                
                Multipart multipart = new MimeMultipart();                
                multipart.addBodyPart(messageBodyPart);
                if(!archivo.equals("")){
                    //attachment
                    messageBodyPart = new MimeBodyPart();
                    Ruta();
                    String filename = ruta + archivo;
                    //System.out.println("Va a crear el DataSource de la ruta "+filename);
                    DataSource source = new FileDataSource(filename);
                    messageBodyPart.setDataHandler(new DataHandler(source));
                    messageBodyPart.setFileName(archivo);
                    multipart.addBodyPart(messageBodyPart);
                    //System.out.println("El multipart está listo");
                }                
                message.setContent(multipart);                
                Transport.send(message);                
                enviado = true;                
            }catch(Exception e){
                e.printStackTrace();
            }        
        return enviado;
    }
        
    private static void Ruta(){
        ruta = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/");
        String eliminar = "build"+System.getProperty("file.separator");
        ruta = ruta.replace(eliminar, "");
        ruta += "Archivos"+System.getProperty("file.separator");       
   }
}