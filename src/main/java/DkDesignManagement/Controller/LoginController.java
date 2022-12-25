package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Service.AccountService;
import DkDesignManagement.Service.EmployeeService;
import DkDesignManagement.Utils.MailUtils;
import DkDesignManagement.Utils.ValidateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping(value = "/")
public class LoginController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private MailUtils mailService;

    @GetMapping(value = "")
    public String login() {
        return "redirect:login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(ModelMap modelMap, HttpServletRequest request, @ModelAttribute("mess") String mess) {
        ModelAndView view;
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");
        if (ObjectUtils.isEmpty(account)) {
            modelMap.put("account", account);
            view = new ModelAndView("/login");
            view.addObject("mess", mess);
        } else {
            if (account.getRole_id() == 2) {
                view = new ModelAndView("redirect:/allProject");
            } else if (account.getRole_id() == 3) {
                view = new ModelAndView("redirect:design/project/view-all-project");
            } else {
                view = new ModelAndView("redirect:admin/memberlist");
            }
        }
        return view;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@ModelAttribute("account") Account account,
                              HttpServletRequest request,
                              HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        ModelAndView view;

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (accountService.isExisted(username)) {
            account = accountService.getAccount(username);
            if (account.getStatus() == 1) {
                if (account.getPassword().equals(password)) {
                    session.setAttribute("loginUser", account);

                    if (account.getRole_id() == 2) {
                        view = new ModelAndView("redirect:/allProject");
                    } else if (account.getRole_id() == 3) {
                        view = new ModelAndView("redirect:design/project/view-all-project");
                    } else {
                        view = new ModelAndView("redirect:admin/memberlist");
                    }
                } else {
                    request.setAttribute("message", "Lỗi Nhập Tài Khoản Hoặc Mật Khẩu");
                    view = new ModelAndView("login");
                }
            } else {
                request.setAttribute("message", "Tên Người Dùng Không Tồn Tại");
                view = new ModelAndView("login");
            }
        } else {
            request.setAttribute("message", "Tài Khoản Của Bạn Đã Bị Chặn");
            view = new ModelAndView("login");
        }
        return view;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpSession session) {
        session.removeAttribute("loginUser");
        return new ModelAndView("redirect:login");
    }

    @RequestMapping(value = "forgotPassword", method = RequestMethod.GET)
    public ModelAndView forgotPassword(HttpServletRequest request, @ModelAttribute("mess") String mess, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("/forgot_password");
        return view;
    }

    @RequestMapping(value = "forgotPassword", method = RequestMethod.POST)
    public ModelAndView sendNewPass(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirect) {
        String email = request.getParameter("email_sendNewPass");
        if (employeeService.emailIsExisted(email)) {
            //send email
            try {
                Employee employee = employeeService.getEmployeeByEmail(email);
                Account account = accountService.getAccountByAccountId(employee.getId_acc());
                String newPassword = ValidateUtils.generateCommonLangPassword();
                String status = mailService.sendForgotPassEmail(email, account.getUsername(), newPassword, employee.getName());
                if (status.equals("success")) {
                    //update DB
                    accountService.changePassword(employee.getId_acc(), newPassword);
                } else {
                    throw new Exception("có lỗi khi gửi mail");
                }

            } catch (Exception e) {
                e.printStackTrace();
                redirect.addAttribute("mess", "có lỗi khi gửi mail");
            }
        } else {
            redirect.addAttribute("mess", "email không tồn tại ");
        }

        redirect.addAttribute("mess", "mail quên mật khẩu đã được gửi");

        return new ModelAndView("redirect:login");
    }
}
