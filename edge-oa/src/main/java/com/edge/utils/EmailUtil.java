package com.edge.utils;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Properties; 
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Authenticator; 
import javax.mail.Message.RecipientType; 
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication; 
import javax.mail.Session; 
import javax.mail.Transport; 
import javax.mail.internet.InternetAddress; 
import javax.mail.internet.MimeMessage; 

/*
 * 邮箱验证码发送
 */
public class EmailUtil {
	
	private static final String MAIL_USER = "767320980@qq.com";
	//
	private static final String MAIL_PASSWD = "fyvkhxsxnbcrbcij";//授权码
	private static final String MAIL_SMTP_HOST = "smtp.qq.com";
	private static final String MAIL_MESSAGE_TYPE = "text/html;charset=gb2312";
	@SuppressWarnings("static-access")
	public static void sendMessage(String to, String subject,String messageText) throws MessagingException {
		
		if(to == null){
			return;
		}
		// 设置收件人地址
		String check = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";    
		Pattern regex = Pattern.compile(check);    
		Matcher matcher = regex.matcher(to);    
		boolean isMatched = matcher.matches();   
		if(!isMatched){
			return;
		}
		
		
		// 第一步：配置javax.mail.Session对象
		System.out.println("为" + MAIL_SMTP_HOST + "配置mail session对象");
		
		
		Properties props = new Properties();
		props.put("mail.smtp.host", MAIL_SMTP_HOST);
		props.put("mail.smtp.starttls.enable","true");//使用 STARTTLS安全连接
		//props.put("mail.smtp.port", "465");			 //google使用465或587端口
		props.put("mail.smtp.auth", "true");		// 使用验证
		//props.put("mail.debug", "true");
		Session mailSession = Session.getInstance(props,new MyAuthenticator(MAIL_USER,MAIL_PASSWD));

		// 第二步：编写消息
		System.out.println("编写消息from——to:" + MAIL_USER + "——" + to);

		InternetAddress fromAddress = new InternetAddress(MAIL_USER);
		InternetAddress toAddress = new InternetAddress(to);

		MimeMessage message = new MimeMessage(mailSession);

		message.setFrom(fromAddress);
		message.addRecipient(RecipientType.CC, new InternetAddress(MAIL_USER));
		message.addRecipient(RecipientType.TO, toAddress);

		message.setSentDate(Calendar.getInstance().getTime());
		message.setSubject(subject);
		message.setContent(messageText, MAIL_MESSAGE_TYPE);

		// 第三步：发送消息
		Transport transport = mailSession.getTransport("smtp");
		transport.connect(MAIL_SMTP_HOST,MAIL_USER, MAIL_PASSWD);
		transport.send(message, message.getRecipients(RecipientType.TO));
		System.out.println("message yes");
	}
	public static void sendYZM(String to,String code) throws MessagingException {
		SimpleDateFormat simdf = new SimpleDateFormat("yyyy年MM月dd日");
        Calendar cal = Calendar.getInstance();
        String messageText = "<div style=\"background:#fff;border:1px solid #ccc;margin:2%;padding:0 30px\">"
		+"<div style=\"line-height:40px;height:40px\">&nbsp;</div>"
		+"<p style=\"margin:0;padding:0;font-size:14px;line-height:30px;color:#333;font-family:arial,sans-serif;font-weight:bold\">亲爱的用户：</p>"
		+"<div style=\"line-height:20px;height:20px\">&nbsp;</div>"
		+"<p style=\"margin:0;padding:0;line-height:30px;font-size:14px;color:#333;font-family:'宋体',arial,sans-serif\">您好！您的密码重设验证码为：</p>"
		+"<p style=\"margin:0;padding:0;line-height:30px;font-size:14px;color:#333;font-family:'宋体',arial,sans-serif\"><b style=\"font-size:18px;color:#f90\"><span style=\"border-bottom: 1px dashed rgb(204, 204, 204); z-index: 1; position: static;\" t=\"7\" onclick=\"return false;\" data="+"\""+code+"\"" +"isout=\"1\">"+code+"</span></b><span style=\"margin:0;padding:0;margin-left:10px;line-height:30px;font-size:14px;color:#979797;font-family:'宋体',arial,sans-serif\">(为了保障您帐号的安全性，请在5分钟内完成验证。)</span></p>"
		+"<div style=\"line-height:80px;height:80px\">&nbsp;</div>"
		+"<p style=\"margin:0;padding:0;line-height:30px;font-size:14px;color:#333;font-family:'宋体',arial,sans-serif\">"+simdf.format(cal.getTime())+"</p>"
		+"<div style=\"line-height:20px;height:20px\">&nbsp;</div></div>";
        
        EmailUtil.sendMessage(to, "密码重设", messageText);
	}
	public static void main(String[] args) {
		String m =  "<h4>姚工:<h4>"+
					"<p>您好！</p>"+
					"<p>您于 2016-08-06 12121，已于2016-08-07审批完毕。</p>"+
					"<p>您可登录系统查看审批详细信息及打印休假请假申请单。</p>"+
					"<p></p>"+
					"<hr style=\" height:2px;border:none;border-top:2px;width:250px;text-align:left;margin-left:0\" />"+
					"<p></p>"+
					"<p>12121</p>"+
					"<p>网址：12121</p>"+
					"<p>电话：12331231</p>";
		try {
			EmailUtil.sendMessage("767320980@qq.com", "11批完成通知",m);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
class MyAuthenticator extends Authenticator{
	String userName="";
	String password="";
	public MyAuthenticator(){
		
	}
	public MyAuthenticator(String userName,String password){
		this.userName=userName;
		this.password=password;
	}
	 protected PasswordAuthentication getPasswordAuthentication(){   
		return new PasswordAuthentication(userName, password);   
	 } 
}
