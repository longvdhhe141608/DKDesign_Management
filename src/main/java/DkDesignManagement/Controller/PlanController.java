package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.TaskService;
import DkDesignManagement.model.TaskPageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import static DkDesignManagement.utils.Constant.NOT_APPROVED_TASK_STATUS;

@Controller
public class PlanController {

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private TaskService taskService;

    @RequestMapping(value = "/plan_approval", method = RequestMethod.GET)
    public ModelAndView viewPlanAproval(HttpServletRequest request){
        ModelAndView view = new ModelAndView("plan_approval");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectDao.getProject(id);
        int page = 1;
        if(!ObjectUtils.isEmpty(request.getParameter("page"))){
            page = Integer.parseInt(request.getParameter("page"));
        }

        TaskPageResponse taskPageResponse = taskService.getListSubTask(page,NOT_APPROVED_TASK_STATUS);
        view.addObject("project", project);
        view.addObject("listTask", taskPageResponse.getTasksList());
        view.addObject("endPage", taskPageResponse.getEndPage());
        view.addObject("projectId", id);
        return view;
    }
}
