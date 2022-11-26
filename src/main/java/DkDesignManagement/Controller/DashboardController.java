package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Repository.TaskDAO;
import DkDesignManagement.Service.TaskService;
import DkDesignManagement.model.DashboardResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DashboardController {

    @Autowired
    TaskService taskService;

    @Autowired
    private ProjectDao projectDao;

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView dashboard(HttpServletRequest request) {
        ModelAndView v = new ModelAndView("dashboard");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectDao.getProject(id);
        DashboardResponse dashboardResponse = taskService.getDashboard(id);
        v.addObject("project",project);
        v.addObject("dashboardResponse",dashboardResponse);
        return v;
    }
}
