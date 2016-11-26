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
    
    //public static boolean enviarCorreo(String[] para){
    public static boolean enviarCorreo(String para){
        boolean enviado = false;
            try{
            
                String host = "smtp.gmail.com";
                String de = "empresa2016sl@gamil.com";
                String asunto = "Envío de factura";
                String mensaje = "Se adjunta la factura";
                
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
                
                //attachment
                messageBodyPart = new MimeBodyPart();
                Ruta();
                String filename = ruta + "Cosas a hacer.pdf";
                System.out.println("Va a crear el DataSource de la ruta "+filename);
                DataSource source = new FileDataSource(filename);
                messageBodyPart.setDataHandler(new DataHandler(source));
                messageBodyPart.setFileName(filename);
                multipart.addBodyPart(messageBodyPart);
                System.out.println("El multipart está listo");
                
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
