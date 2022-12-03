package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.AccountService;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.Service.TaskService;
import DkDesignManagement.model.TaskPageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

import static DkDesignManagement.utils.Constant.*;

@Controller
@RequestMapping(value = "/progress")
public class ProcessController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private TaskService taskService;

    @Autowired
    AccountService accountService;


    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView viewProgress(HttpServletRequest request){
        ModelAndView view = new ModelAndView("progress");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectService.getProject(id);
        int page = 1;
        if (!ObjectUtils.isEmpty(request.getParameter("page"))) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        //todo:search

        TaskPageResponse taskPageResponse = taskService.getListSubTaskProcess(page ,id);
        view.addObject("listTask", taskPageResponse.getTasksList());
        view.addObject("page", page);
        view.addObject("endPage", taskPageResponse.getEndPage());
        view.addObject("projectId", id);
        view.addObject("project", project);

        return view;
    }

}
