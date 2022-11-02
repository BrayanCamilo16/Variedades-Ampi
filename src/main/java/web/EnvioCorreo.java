package web;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EnvioCorreo {
    //en este metodo se va a configurar todo lo de correo por tal razon es estatico
    public static void enviarCorreo(String servidor, String Puerto, final String usuario,
            final String clave, String direccion, String asunto, String mensaje)throws AddressException, MessagingException{
        
         //configuracion SMTP
        Properties propiedades = new Properties();
        propiedades.put("mail.smtp.host", servidor);
        propiedades.put("mail.smtp.port", Puerto);
        propiedades.put("mail.smtp.auth", "true");
        propiedades.put("mail.smtp.starttls.enable", "true");
        propiedades.put("mail.smtp.starttls.required",  true);
        propiedades.put("mail.smtp.ssl.protocols", "TLSv1.2");
        propiedades.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
         //llamr un metodo dentro de un objeto
        Authenticator autenticar = new Authenticator() {

            public PasswordAuthentication getAuthentication() {

                return new PasswordAuthentication(usuario, clave);
            }
        };
        
        //va acrear una sesion de correo por tal razon llegan las propiedades y autenticar
        Session sesion = Session.getInstance(propiedades, autenticar);
        //me cree ese mensaje 
        Message msg = new MimeMessage(sesion);
        msg.setFrom(new InternetAddress(usuario));

        InternetAddress[] direcciones = {new InternetAddress(direccion)};
        msg.setRecipients(Message.RecipientType.TO, direcciones);

        msg.setSubject(asunto);
        msg.setSentDate(new Date());
        msg.setContent(mensaje, "text/html; charset=utf-8");

        Transport.send(msg, usuario, clave);
    }
}
