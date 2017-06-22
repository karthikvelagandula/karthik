<%@ page import="java.util.Properties,javax.mail.Message,javax.mail.MessagingException,javax.mail.PasswordAuthentication,javax.mail.Session,javax.mail.Transport,javax.mail.internet.InternetAddress,javax.mail.internet.MimeMessage" %>
<%
Properties props = new Properties();
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.port", "587");

javax.mail.Session session1 = javax.mail.Session.getInstance(props,
	new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("metrocitation@gmail.com", "Metro12!@");
		}
	});
session1.setDebug(true);
try {

	Message message = new MimeMessage(session1);
	message.setFrom(new InternetAddress("metrocitation@gmail.com"));
	message.setRecipients(Message.RecipientType.TO,
			InternetAddress.parse("santoshkumar.mandal@gmail.com"));
	message.setSubject("Testing Subject");
	message.setText("Dear Mail Crawler," +
			"\n\n No spam to my email, please!");

	Transport.send(message);

} catch (MessagingException e) {
	throw new RuntimeException(e);
}
%>