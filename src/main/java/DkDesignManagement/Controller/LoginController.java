package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Repository.AccountDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/")
public class LoginController {


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String Login(ModelMap modelMap) {
        modelMap.put("account", new Account());
        return "Login";
    }

    @RequestMapping(value = "/Login", method = RequestMethod.POST)
    public String Login(@ModelAttribute(value = "account") Account account, ModelMap modelMap, HttpSession session) {
        AccountDao accountDao = new AccountDao();

        if (account.getNameAcc().equals("abc")
                && account.getPassAcc().equals("123456")) {
            session.setAttribute("username", account.getNameAcc());
        } else {
            modelMap.put("message", "Tai khoan k ok");
        }
        return "Login";
    }
//    @RequestMapping(value = "/login", method = RequestMethod.POST)
//    public ModelAndView executeLogin(HttpServletRequest request, HttpServletResponse response,
//                                     @ModelAttribute("loginBean") Account loginBean) {
//        ModelAndView view = null;
//        AccountServiceImpl accountService = new AccountServiceImpl();
//        if (accountService.isUser(loginBean.getPassAcc(), loginBean.getPassAcc())) {
//            request.setAttribute("loggedInUser", loginBean.getNameAcc());
//            view = new ModelAndView("welcome");
//        } else {
//            request.setAttribute("message", "Invalid ussename or password!");
//            view = new ModelAndView("login");
//        }
//        return view;
//    }
}
