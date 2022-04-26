/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author nghie
 */
public class Email {

    private static void send(String to, String sub, String msg) {
        Properties props = new Properties();
        final String user = "HrManagementSWP@gmail.com"; 
        final String pass = "F+n#Cce^3UttQz/R";
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            System.out.println(e);
        }
    }
    
    public void verifiedAccount(String email, String code) {
        String data = "qwertyuiopasdfghjklzxcvbnm1234567890";
        data = data + data.toUpperCase();
        String subject = "[HRManagement] Verify your account";
        String message
                = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + " <head>\n"
                + " </head>\n"
                + " <body>\n"
                + "    <h3 style=\"color: blue;\">This is an important email</h3>\n"
                + "    <p>Dear,</p>"
                + "    <p>We have Verify your account</p>"
                + "    <a href=\"http://localhost:8080/HRManagement/user-register?verified=" + code + "\">"
                + "          <button>Click here to Verify your account</button>"
                + "    </a>"
                + "    <p>Thanks,</p>"
                + " </body>\n"
                + "</html>";
        Email.send(email, subject, message);
    }

    public void resetPasswordEmail(String email, String code) {
        String subject = "Reset your password";
        String message
                = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + " <head>\n"
                + " </head>\n"
                + " <body>\n"
                + "    <h3 style=\"color: blue;\">This is an important email</h3>\n"
                + "    <p>Dear,</p>"
                + "    <p>We have received your password reset request</p>"
                + "    <a href=\"http://localhost:8080/HRManagement/reset-pass?request=" + code + "&action=set\">"
                + "          <button>Click here to reset password</button>"
                + "    </a>"
                + "    <p>If you ignore this email, your password will not be changed</p>"
                + "    <p>Note that this link is only valid for 30 minutes</p>"
                + "    <p>Thanks,</p>"
                + " </body>\n"
                + "</html>";
        Email.send(email, subject, message);
    }
    public void MailSendPassword(String email, String pass) {
        String subject = "Reset your password";
        String message
                = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + " <head>\n"
                + " </head>\n"
                + " <body>\n"
                + "    <h3 style=\"color: blue;\">This is an important email</h3>\n"
                + "    <p>Dear,</p>"
                + "You have new account to HRManagemt"
                + "    <p>Here your password</p>"
                +      pass
                + "    <p>Thanks,</p>"
                + " </body>\n"
                + "</html>";
        Email.send(email, subject, message);
    }

    public static void main(String[] args) {
        Email mail = new Email();
        String code = "aaaa";
        String b = "aaaaa";
        mail.MailSendPassword("huyddhe151062@fpt.edu.vn","pass: " + code + "user: " + b);
    }
}
