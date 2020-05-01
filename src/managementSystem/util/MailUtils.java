package managementSystem.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailUtils {
    public static String Addressee_mail;
    public static String content;

//    public static void main(String[] args) {
//        sendMail();
//    }

    public static void sendMail(){

        //1  编写配置  服务器，  端口，  验证    协议到  配置文件
        Properties prop =  new Properties();
        prop.put("mail.smtp.host", "smtp.163.com"); //smtp服务端
        prop.put("mail.smtp.auth", "true");      //是否验证
        prop.put("mail.transport.protocol", "smtp"); //传输协议
        prop.put("mail.smtp.socketFactory.class",   "javax.net.ssl.SSLSocketFactory");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.port", 465);   //这三句我也不知道干啥的。。。大概就是用ssh验证登录的另一个端口，  一般发送邮件的smtp是用25端口， 这个有ssl验证的不一样， 而且注意  socketFactory的后面一定要加双引号

        try {
            //2.创建sesssion
            Session session = Session.getDefaultInstance(prop, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("changepeng2017@163.com","19971882qzp2017");
                }
            });

            //3.开启session的调试模式，可以查看当前邮件发送状态
            session.setDebug(true);

            //4.建邮件
            /**
             * 邮件对象， ---发件人 收件人 抄送人 主题  内容
             */
            MimeMessage mail =new MimeMessage(session);
            mail.setFrom(new InternetAddress("changepeng2017@163.com"));
            mail.setRecipient(Message.RecipientType.TO, new InternetAddress(Addressee_mail));
            mail.setSubject("公司入职申请结果通知");
            mail.setContent(content,"text/html;charset=utf-8"); // 注意 用text/plain text/html

            //4.通过session获取Transport对象（发送邮件的核心API）
            Transport ts=session.getTransport();
            //6.发送电子邮件

            ts.send(mail);

//          for(int i =0; i<10; i++){
//
//
//          Transport.send(mail);
//          }
//

        } catch ( Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            throw new RuntimeException(e);
        }



    }
}