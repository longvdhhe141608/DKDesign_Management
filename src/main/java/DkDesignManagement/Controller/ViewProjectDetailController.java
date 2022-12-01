package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Status;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Repository.StatusDao;
import DkDesignManagement.Service.CategoryService;
import DkDesignManagement.Service.HistoryService;
import DkDesignManagement.Service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/project")
public class ViewProjectDetailController {
    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private StatusDao statusDao;

    @Autowired
    private ProjectService projectService;

    @Autowired
    HistoryService historyService;

    @RequestMapping(value = "/summary", method = RequestMethod.GET)
    public ModelAndView projectDetail(HttpServletRequest request, @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("summary");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectDao.getProject(id);
        HttpSession session = request.getSession();

        //list status
        List<Status> listStatus = statusDao.getAllStatus();
        List<Status> listRemove = new ArrayList<>();
        for (Status status : listStatus) {
            if (ObjectUtils.isEmpty(status.getStatusProject())) {
                listRemove.add(status);
            }
        }

        listStatus.removeAll(listRemove);
        view.addObject("listHistory", historyService.getAlLRevisionHistoryOfTable(project.getId(), "project"));
        session.setAttribute("project", project);
        session.setAttribute("listStatus", listStatus);
        view.addObject("mess", mess);
        return view;
    }

    @RequestMapping(value = "/change-status", method = RequestMethod.POST)
    public ModelAndView changeStatusProject(HttpServletRequest request, RedirectAttributes redirect) {
        int projectId = Integer.parseInt(request.getParameter("projectId"));

        ModelAndView view = new ModelAndView("redirect:/project/summary?id=" + projectId);

        //get value
        int status = Integer.parseInt(request.getParameter("statusId"));


        //update
        Project project = projectDao.getProject(projectId);
        if (status == 3) {
            project.setEndDate(new Date());
        }
        project.setStatus(status);

        projectDao.editProject(project);

        redirect.addAttribute("mess", "change status project successfully ");

        return view;
    }
}
