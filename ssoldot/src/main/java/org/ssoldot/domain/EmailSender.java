package org.ssoldot.domain;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSender {
	
	@Autowired
    protected JavaMailSender mailSender;
    public void SendEmail(EmailVO email) throws Exception {
    	 MimeMessage msg = mailSender.createMimeMessage();
         try {
        	 msg.setFrom(new InternetAddress("ssoldot2@gmail.com","운영자"));
             msg.setSubject(email.getSubject());
             msg.setText(email.getContent(), "utf-8", "html");
             msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));


            
         }catch(MessagingException e) {
             System.out.println("MessagingException");
             e.printStackTrace();
         }
         try {
             mailSender.send(msg);
         }catch(MailException e) {
             System.out.println("MailException발생");
             e.printStackTrace();
         }


    }


}
