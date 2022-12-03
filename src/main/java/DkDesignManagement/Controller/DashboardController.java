package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Repository.TaskDAO;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.Service.TaskService;
import DkDesignManagement.model.DashboardResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class DashboardController {

    @Autowired
    TaskService taskService;

    @Autowired
    private ProjectService projectService;

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView dashboard(HttpServletRequest request) {
        ModelAndView v = new ModelAndView("dashboard");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectService.getProject(id);
        //dashboard leader
        DashboardResponse dashboardResponse = taskService.getDashboard(id, null);
        v.addObject("project", project);
        v.addObject("dashboardResponse", dashboardResponse);
        return v;
    }

    @RequestMapping(value = "design/dashboard", method = RequestMethod.GET)
    public ModelAndView designDashboard(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView v = new ModelAndView("design/dashboard");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectService.getProject(id);

        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return v;
        }
        Account account = (Account) session.getAttribute("loginUser");

        String designId = String.valueOf(account.getId());

        //dashboard design
        DashboardResponse dashboardResponse = taskService.getDashboard(id, designId);
        v.addObject("project", project);
        v.addObject("dashboardResponse", dashboardResponse);
        return v;
    }
}
