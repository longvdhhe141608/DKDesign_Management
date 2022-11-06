package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.ProjectDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Track;
import javax.swing.plaf.basic.BasicSliderUI;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {
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

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView loadProjectDetail(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("summary");
        try {
            int projectId = Integer.parseInt(request.getParameter("id"));
            Project project = projectDao.getProject(projectId);
            view.addObject("project", project);
        } catch (Exception e) {
            throw e;
        }
        return view;
    }
}
