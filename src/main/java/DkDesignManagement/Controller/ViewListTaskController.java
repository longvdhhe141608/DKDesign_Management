package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.ProjectDao;
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
public class ViewListTaskController {
    @Autowired
    private ProjectDao projectDao;
    @Autowired
    private TaskDAO taskDAO;

    @RequestMapping(value = "/list_task", method = RequestMethod.GET)
    public ModelAndView viewListTask(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("list_task");
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
//        Project project = projectDao.getProject(id);
//        List<Task> taskList = taskDAO.getAllBigTaskInProject(id);
//
//        view.addObject("project", project);
//        view.addObject("taskList", taskList);
        return view;
    }
}
