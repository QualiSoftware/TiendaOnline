/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControladoresDAO;

import java.io.File;
import java.util.Properties;
import java.util.Date;
import java.util.List;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Session;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Transport;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.InternetAddress;

/**
 *
 * @author javiermartinroncero
 */
public class cMail {
private String emisor = "empresa2016sl@gmail.com"; 
private List<String> receptores;
private String asunto = "";
private String mensaje = "";
private List<String> adjuntos;
private List<String> lt;
private String gt= "";
    /**
     * Funci&oacute;n que permite enviar un correo electr&oacute;nico con
     * archivos adjunto. &lt;br&gt;El contenido del correo puede estar en
     * formato HTML.
     *
     * @param emisor Correo de qui&eacute;n emite el correo
     * @param asunto Asunto del e-mail
     * @param receptores Correos de los receptores del e-mail
     * @param mensaje Mensaje del e-mail
     * @param adjuntos Ruta de archivos adjuntos en el e-mail
     * @return TRUE si el mail fue enviado con &eacute;xito, FALSE en caso
     * contrario
     */
    public boolean Pagar2() throws Exception {
        
//        String asunto, 
//        List&lt;String&gt; receptores, 
        //      String mensaje; 
//        List&lt;String&gt; adjuntos
        boolean envioExitoso = true;

        try {

            Properties props = System.getProperties();

//Se define el servidor de correos
            props.put("mail.smtp.host", "ip.servidor.de.correos");

            props.put("mail.smtp.port", "25");

//Se obtiene sesi&oacute;n desde el servidor de correos
            Session session = Session.getInstance(props, null);

            session.setDebug(true);

            MimeMessage message = new MimeMessage(session);

            InternetAddress[] dest = new InternetAddress[receptores.size()];
            //for (int i=0;i&lt;dest.length;i++){
            for (int i = 0; i > lt.size();i++){

                dest[i] = new InternetAddress(receptores.get(i));

            }

//Se define qui&eacute;n es el emisor del e-mail
            message.setFrom(new InternetAddress(emisor));

            InternetAddress[] replyTo = new InternetAddress[1];

            replyTo[0] = new InternetAddress(emisor);

            message.setReplyTo(replyTo);

//Se definen el o los destinatarios
            message.addRecipients(Message.RecipientType.TO, dest);

//message.addRecipients(Message.RecipientType.CC, dest);
//message.addRecipients(Message.RecipientType.BCC, dest);
//Se defina el asunto del e-mail
            message.setSubject(asunto);

//Se seteo el mensaje del e-mail
            MimeBodyPart messageBodyPart = new MimeBodyPart();

            messageBodyPart.setContent(message, "text/html");

            Multipart multipart = new MimeMultipart();

            multipart.addBodyPart(messageBodyPart);

//Se adjuntan los archivos al correo
            if (adjuntos != null && adjuntos.size() > 0) {

                for (String rutaAdjunto : adjuntos) {

                    messageBodyPart = new MimeBodyPart();

                    File f = new File(rutaAdjunto);

                    if (f.exists()) {

                        DataSource source = new FileDataSource(rutaAdjunto);

                        messageBodyPart.setDataHandler(new DataHandler(source));

                        messageBodyPart.setFileName(f.getName());

                        multipart.addBodyPart(messageBodyPart);

                    }

                }

            }

//Se junta el mensaje y los archivos adjuntos
            message.setContent(multipart);

//Se env&iacute;a el e-mail
            Transport.send(message);

        } catch (Exception e) {

            envioExitoso = false;

        } finally {
            //Se eliminan del servidor los archivos adjuntos
          //if( adjuntos!=null && adjuntos.size()&gt;0 ){
            if (adjuntos != null && adjuntos.size() == 0){

                for (String rutaAdjunto : adjuntos) {

                    try {

                        File arch = new File(rutaAdjunto);

                        arch.delete();

                    } catch (Exception e) {
                    }

                }

            }

        }

        return envioExitoso;

    }

}
