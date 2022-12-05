package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Service.AccountService;
import DkDesignManagement.Service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

    @GetMapping(value = "")
    public String login() {
        return "redirect:login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(ModelMap modelMap, @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("/login");
        Account account = new Account();
        modelMap.put("account", account);
        view.addObject("mess", mess);
        return view;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@ModelAttribute("account") Account account, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
    public ModelAndView forgotPassword(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("/forgot_password");
        return view;
    }

    @RequestMapping(value = "forgotPassword", method = RequestMethod.POST)
    public ModelAndView sendNewPass(HttpServletRequest request, HttpServletResponse response){
        ModelAndView view = new ModelAndView("/forgot_password");
        String email = request.getParameter("email_sendNewPass");
        
        return new ModelAndView("redirect:login");
    }
}
