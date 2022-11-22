package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Repository.EmployeeDao;
import DkDesignManagement.Service.AccountService;
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
    private EmployeeDao employeeDao;

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
            if (account.getPassword().equals(password)) {
                session.setAttribute("loginUser", account);
                String avatar;
                try {
                    avatar = employeeDao.getInformation(account.getId()).getAvatar();
                } catch (Exception e) {
                    avatar = "https://ssl.gstatic.com/accounts/ui/avatar_2x.png";
                }
                session.setAttribute("avatar", avatar);
                if (account.getRole_id() == 2) {
                    view = new ModelAndView("redirect:headerHome");
                } else if (account.getRole_id() == 3) {
                    view = new ModelAndView("redirect:design/home");
                } else {
                    view = new ModelAndView("redirect:admin/memberlist");
                }
            } else {
                request.setAttribute("message", "Invalid username or password!");
                view = new ModelAndView("login");
            }
        } else {
            request.setAttribute("message", "Username Does Not Exist!");
            view = new ModelAndView("login");
        }
        return view;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpSession session) {
        session.removeAttribute("loginUser");
        return new ModelAndView("redirect:login");
    }

}
