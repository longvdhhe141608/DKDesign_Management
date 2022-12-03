package DkDesignManagement.Service;


import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.io.InputStream;
@Service
public class MailService implements JavaMailSender {

    /**
     * @return
     */
    @Override
    public MimeMessage createMimeMessage() {
        return null;
    }

    /**
     * @param contentStream the raw MIME input stream for the message
     * @return
     * @throws MailException
     */
    @Override
    public MimeMessage createMimeMessage(InputStream contentStream) throws MailException {
        return null;
    }

    /**
     * @param mimeMessage message to send
     * @throws MailException
     */
    @Override
    public void send(MimeMessage mimeMessage) throws MailException {

    }

    /**
     * @param mimeMessages messages to send
     * @throws MailException
     */
    @Override
    public void send(MimeMessage... mimeMessages) throws MailException {

    }

    /**
     * @param mimeMessagePreparator the preparator to use
     * @throws MailException
     */
    @Override
    public void send(MimeMessagePreparator mimeMessagePreparator) throws MailException {

    }

    /**
     * @param mimeMessagePreparators the preparator to use
     * @throws MailException
     */
    @Override
    public void send(MimeMessagePreparator... mimeMessagePreparators) throws MailException {

    }

    /**
     * @param simpleMessage the message to send
     * @throws MailException
     */
    @Override
    public void send(SimpleMailMessage simpleMessage) throws MailException {

    }

    /**
     * @param simpleMessages the messages to send
     * @throws MailException
     */
    @Override
    public void send(SimpleMailMessage... simpleMessages) throws MailException {

    }
}

