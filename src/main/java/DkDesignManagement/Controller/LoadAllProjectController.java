package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Repository.ProjectDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;

@Controller
public class LoadAllProjectController {
    @Autowired
    private ProjectDao projectDao;

    @RequestMapping(value = "/allProject", method = RequestMethod.GET)
    public ModelAndView loadAllProject(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("allProject");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");
        view.addObject("listAllProject", projectDao.getAllProjectByAcc(account.getId()));
        return view;
    }
}
