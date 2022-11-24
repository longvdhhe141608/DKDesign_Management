package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.ProjectDao;
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
import java.util.Date;

import static DkDesignManagement.utils.Constant.*;

@Controller
public class PlanController {

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private TaskService taskService;

    @RequestMapping(value = "/plan_approval", method = RequestMethod.GET)
    public ModelAndView viewPlanAproval(HttpServletRequest request, @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("plan_approval");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectDao.getProject(id);
        int page = 1;
        if (!ObjectUtils.isEmpty(request.getParameter("page"))) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        TaskPageResponse taskPageResponse = taskService.getListSubTask(page, NOT_APPROVED_TASK_STATUS);
        view.addObject("project", project);
        view.addObject("page", page);
        view.addObject("listTask", taskPageResponse.getTasksList());
        view.addObject("endPage", taskPageResponse.getEndPage());
        view.addObject("projectId", id);
        view.addObject("mess", mess);
        return view;
    }

    @RequestMapping(value = "/plan_approval/agree", method = RequestMethod.GET)
    public ModelAndView updateStatusPlanAgree(HttpServletRequest request, RedirectAttributes redirect) {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskService.getTaskById(taskId);
        ModelAndView view = new ModelAndView("redirect:/plan_approval?id=" + task.getProjectId());

        // update
        task.setTaskStatus(PROCESS_TASK_STATUS);
        taskService.updateTask(task);

        redirect.addAttribute("mess", "agree task successfully ");

        return view;
    }

    @RequestMapping(value = "/plan_approval/cancel", method = RequestMethod.POST)
    public ModelAndView updateStatusPlanCancel(HttpServletRequest request, RedirectAttributes redirect) {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskService.getTaskById(taskId);
        ModelAndView view = new ModelAndView("redirect:/plan_approval?id=" + task.getProjectId());

        String description = request.getParameter("description");
        // update
        task.setTaskStatus(CANCEL_TASK_STATUS);
        task.setDescription(description);
        taskService.updateTask(task);


        redirect.addAttribute("mess", "cancel task successfully ");

        return view;
    }
}
