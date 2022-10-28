package DkDesignManagement.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

public class LogoutController {
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView Logout(HttpSession session) {
        session.removeAttribute("loginUser");
        return new ModelAndView("login");
    }
}
