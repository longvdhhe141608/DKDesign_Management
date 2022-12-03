package DkDesignManagement.Controller.Design;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/design")
public class HomePageByDesignController {

    @Autowired
    private ProjectService projectService;

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response){
        ModelAndView view = new ModelAndView("design/headerHome");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("loginUser");
        view.addObject("listProDoing", projectService.getProjectByAcc(a.getId()));
        return view;
    }
}
