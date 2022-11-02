package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Repository.AccountDao;
import DkDesignManagement.Repository.ProjectDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoadHomeController {

    @Autowired
    AccountDao accountDao;
    ProjectDao projectDao;

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response){
        ModelAndView view = new ModelAndView("headerHome");
//        HttpSession session = request.getSession();
//        Account a = (Account) session.getAttribute("loginUser");
//        view.addObject("ten", a.getUsername());

        return view;
    }
}
