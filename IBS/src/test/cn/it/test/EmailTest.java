package cn.it.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class EmailTest extends BaseTest {
    @Autowired
    MailSender mailSender;
    @Test
    public void testEmail() throws Exception {
        //JavaMailSenderImpl xxx = (JavaMailSenderImpl)mailSender
        // 简单邮件对象
        SimpleMailMessage msg = new SimpleMailMessage();
        // 发送人:和配置一致
        msg.setFrom("ctguctgu@163.com");
        // 收件人
        msg.setTo("365639948@qq.com");
        // 主题
        msg.setSubject("牛皮大学录取通知书");
        // 内容
        msg.setText("你已经被录取了");
        // 设置固定回邮地址
        msg.setReplyTo("ctguctgu@163.com");
        // 发送
        mailSender.send(msg);
    }

}
