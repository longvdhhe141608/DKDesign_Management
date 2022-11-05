package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Repository.AccountDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@Controller
@RequestMapping(value = "/")

public class LoginController {
    @Autowired
    private AccountDao accountDao;

    @GetMapping(value = "")
    public String login() {
        return "login";
    }

    @RequestMapping (value = "/login", method=RequestMethod.GET)
    public ModelAndView login(ModelMap modelMap) {
        Account account = new Account();
        modelMap.put("account", account);
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@ModelAttribute("account") Account account,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        ModelAndView view;
        String username = request.getParameter("username").trim().toLowerCase();
        String password = request.getParameter("password");

        account = accountDao.getAccount(username);
            if (account.getPassword().equals(password)) {
                session.setAttribute("loginUser", account);
                view = new ModelAndView("redirect:headerHome");
            } else {
                request.setAttribute("message", "Invalid username or password!");
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
