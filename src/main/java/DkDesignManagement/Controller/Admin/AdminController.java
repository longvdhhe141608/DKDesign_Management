package DkDesignManagement.Controller.Admin;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Member;
import DkDesignManagement.Service.AccountService;
import DkDesignManagement.Service.EmployeeService;
import DkDesignManagement.Service.MailService;
import DkDesignManagement.Service.MemberService;
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

import static DkDesignManagement.Utils.ValidateUtils.*;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private MailService mailService;

    @RequestMapping(value = "/memberlist", method = RequestMethod.GET)
    public ModelAndView loadMemberAdminPage(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("admin/memberAdmin");
        List<Member> memberList = memberService.getAllMember();
        view.addObject("memberList", memberList);
        return view;
    }

    @RequestMapping(value = "/searchMember", method = RequestMethod.GET)
    public ModelAndView loadMemberAminSearchingPage(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("admin/memberAdmin");

        int role = Integer.parseInt(request.getParameter("roleSearch"));
        String name = request.getParameter("nameSearch");

        if(!ObjectUtils.isEmpty(name)){
            name = name.trim();
        }

        List<Member> memberList = memberService.getAllMemberInSearch(role, name);
        view.addObject("memberList", memberList);
        view.addObject("roleSearch", role);
        view.addObject("nameSearch", name);
        return view;
    }

    @RequestMapping(value = "/createAccount", method = RequestMethod.GET)
    public ModelAndView loadCreateAccountPage(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("admin/createAccount");
        List<Account> accountList = accountService.getAllAccount();
        view.addObject("accountList", accountList);
        return view;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createAccount(HttpServletRequest request, RedirectAttributes redirect) {
        HttpSession session = request.getSession();
        String name = request.getParameter("name").trim();
        String mail = request.getParameter("mail").trim().toLowerCase();
        int role = Integer.parseInt(request.getParameter("role"));


        List<String> userList = accountService.getUsernameList();
        String username = generateEmployeeCode(removeAccent(name.toLowerCase()), userList);
        String password = generateCommonLangPassword();

        if (employeeService.emailIsExisted(mail) == false) {
            //send mail
            mailSender.send(new MimeMessagePreparator() {
                public void prepare(MimeMessage mimeMessage) throws MessagingException {
                    MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                    message.setTo(mail);
                    message.setSubject("[DKDesignManagement] Tài Khoản Mới");
                    message.setText("Xin chào " + name + ",<br>" +
                            "Tài khoản dkmanagement của bạn đã được tạo thành công<br>" +
                            "Tài khoản: " + username + "<br>" +
                            "Mật Khẩu: " + password + "<br>" +
                            "Vui lòng đăng nhập và đổi mật khẩu lần đầu để sử dụng tài khoản.<br>" +
                            "Thân,<br>" +
                            "Dkmangament Admin", true);

                }
            });

            accountService.addNewAccount(username, toMd5(password), role);
            Account account = accountService.getAccount(username);
            memberService.addNewMember(name, mail, account.getId());
            return new ModelAndView("redirect:/admin/memberlist");
        } else {
            String error = "Email has existed";
            request.setAttribute("name", name);
            request.setAttribute("error1", error);
        }
        return new ModelAndView("admin/createAccount");
    }

    @RequestMapping(value = "/changeMemberStatus")
    public ModelAndView changeStatusMemberByAdmin(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("admin/memberAdmin");

        int status = Integer.parseInt(request.getParameter("status"));
        if (status == 1) {
            status = 2;
        } else {
            status = 1;
        }
        String username = request.getParameter("username");

        memberService.updateMemberStatus(status, username);
        List<Member> memberList = memberService.getAllMember();
        view.addObject("memberList", memberList);
        return view;
    }
}

