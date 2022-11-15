package DkDesignManagement.Controller.Design;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Section;
import DkDesignManagement.Entity.Tasks;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Repository.SectionDAO;
import DkDesignManagement.Repository.TaskDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/design/sub-task")
public class SubTaskByDesignController {

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private SectionDAO sectionDao;

    @Autowired
    private TaskDAO taskDAO;

    @RequestMapping(value = "/view-sub-task-detail", method = RequestMethod.GET)
    public ModelAndView viewListTask(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("design/sub-task-design");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectDao.getProject(projectID);

        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        Section section = sectionDao.getOneSectionBySectionID(sectionID);

        int taskID = Integer.parseInt(request.getParameter("task-id"));
        Tasks tasks = taskDAO.getOneTasksByTaskID(taskID);
        List<Tasks> subTasksList = taskDAO.getAllSubTasksByProjectIDAndSectionIDAndTaskID(project.getId(), section.getSectionId(), tasks.getId());

        int subTaskID = Integer.parseInt(request.getParameter("sub-task-id"));
        Tasks subtask = taskDAO.getOneSubTaskBySubTaskID(subTaskID, tasks.getId());

        view.addObject("project", project);
        view.addObject("tasks", tasks);
        view.addObject("section", section);
        view.addObject("subTasksList", subTasksList);
        view.addObject("subTask", subtask);

        return view;
    }
}
