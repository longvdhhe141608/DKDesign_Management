package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Repository.AccountDao;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.Objects;

@Controller
public class LoginController {

    @Autowired
    private AccountDao dao;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView Login(ModelMap modelMap) {
        return new ModelAndView("Login");
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView Login(@ModelAttribute(value = "account") Account account, ModelMap modelMap,
                              HttpServletRequest request,
                              HttpServletResponse response, HttpSession session) throws IOException, ServletException {
        ModelAndView view = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Account ac = dao.getAccount(username);

        if (Objects.isNull(ac)) {
            request.setAttribute("message", "Invalid username or password!");
            view = new ModelAndView("Login");
        } else {
            if (ac.getPassAcc().equals(password)) {
                session.setAttribute("loginUser", ac);
                view = new ModelAndView("Home");
            } else {
                request.setAttribute("message", "Invalid username or password!");
                view = new ModelAndView("Login");
            }
        }
        return view;
    }
}
