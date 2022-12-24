package DkDesignManagement.Utils;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Random;

@Service
public class MailUtils {

    @Autowired
    private JavaMailSender mailSender;

    private static final Logger logger = LoggerFactory.getLogger("Sent Email login log");

    public String sendForgotPassEmail(String email,String username, String password,String name) {
        try {
            MimeMessage message = mailSender.createMimeMessage();

            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

            helper.setTo(email);
            helper.setSubject("[DKDesignManagement] Quên mật khẩu");
            String mess = "Xin chào " + name + ",<br>" +
                    "Tài khoản dkmanagement của bạn đã được tạo lại<br>" +
                    "Tài khoản: " + username + "<br>" +
                    "Mật Khẩu mới: " + password + "<br>" +
                    "Vui lòng đăng nhập và đổi lại mật khẩu để tiếp tục sử dụng tài khoản.<br>" +
                    "Thân,<br>" +
                    "Dkmangament Admin";
            helper.setText(mess, true);
            mailSender.send(message);

        } catch (Exception e) {
            logger.error(e.getMessage());
            return "fail";
        }
        return "success";
    }


}
