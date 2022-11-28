package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Member;
import DkDesignManagement.Repository.AccountDao;
import DkDesignManagement.Repository.MemberDao;
import DkDesignManagement.Service.Impl.AccountServiceImpl;
import DkDesignManagement.Service.Impl.EmployeeServiceImpl;
import DkDesignManagement.Service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

import static DkDesignManagement.utils.ValidateUtils.*;

@Controller
@RequestMapping(value = "/notification")
public class NotificationController {

    @Autowired
    NotificationService notificationService;


    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView loadMemberAdminPage(HttpServletRequest request,RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("notification");

        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }
        Account account = (Account) session.getAttribute("loginUser");

        view.addObject("listNotification",notificationService.getAllByAccountId(account.getId()));

        return view;
    }


}

