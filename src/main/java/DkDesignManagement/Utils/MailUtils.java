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

    public String sendEmail(String email,String password,String name) {
        try {
            MimeMessage message = mailSender.createMimeMessage();

            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

            helper.setTo(email);
            helper.setSubject("[DKDesignManagement] Quên mật khẩu.");
            String mess = "Xin chào "+name+" \n , Bạn đã quên mất khẩu , mật khẩu mới của bạn là :"+password;
            helper.setText(mess, true);

            mailSender.send(message);

        } catch (Exception e) {
            logger.error(e.getMessage());
            return "fail";
        }
        return "successes";
    }

    public String generatePassword() {
        // StringBuilder capcha = new StringBuilder();
        String capchaString = "";

        Random R = new Random();
        String s = "123456789qwertyuiopasdfghjklzxcvbnmQƯERTYUIOPASDFGHJKLZXCVBNM";
        for (int i = 0; i < 6; i++) {
            int a = R.nextInt(s.length());
            capchaString += s.charAt(a);
        }

        return capchaString;
    }


}
