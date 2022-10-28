package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
public class LoginController {
//    @RequestMapping(value = "/", method = RequestMethod.GET)
//    public ModelAndView Login(ModelMap modelMap) {
//        return new ModelAndView("member");
//    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView Login(@ModelAttribute(value = "account") Account account, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException {
        ModelAndView view = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        AccountDao accountDao = new AccountDao();
        account = new Account(username, "123");
        if (account.getPassAcc().equals(password)) {
            session.setAttribute("loginUser", account.getNameAcc());
            view = new ModelAndView("home");
        } else {
            request.setAttribute("message", "Invalid username or password!");
            view = new ModelAndView("login");
        }
        return view;
    }


}
