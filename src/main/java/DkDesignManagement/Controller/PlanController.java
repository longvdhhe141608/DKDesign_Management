package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Notification;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Model.TaskPageResponse;
import DkDesignManagement.Service.AccountService;
import DkDesignManagement.Service.NotificationService;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.Service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

import static DkDesignManagement.Utils.Constant.*;

@Controller
public class PlanController {

    @Autowired
    private ProjectService projectService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private AccountService accountService;

    @Autowired
    NotificationService notificationService;

    @RequestMapping(value = "/plan_approval", method = RequestMethod.GET)
    public ModelAndView viewPlanAproval(HttpServletRequest request, @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("leader/plan_approval");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectService.getProject(id);
        int page = 1;
        if (!ObjectUtils.isEmpty(request.getParameter("page"))) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        String accountId = request.getParameter("accountId");
        if(!ObjectUtils.isEmpty(accountId)){
            accountId = accountId.trim();
        }

        String name = request.getParameter("name");
        if(!ObjectUtils.isEmpty(name)){
            name = name.trim();
        }

        TaskPageResponse taskPageResponse = taskService.getListSubTask(page, id, NOT_APPROVED_TASK_STATUS, name, accountId);
        view.addObject("project", project);
        view.addObject("page", page);
        view.addObject("listTask", taskPageResponse.getTasksList());
        view.addObject("endPage", taskPageResponse.getEndPage());
        view.addObject("projectId", id);
        view.addObject("mess", mess);
        view.addObject("listAccount", accountService.getAccountsByProjectId(id));
        view.addObject("accountId", accountId);
        view.addObject("name", name);
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

        //add notification to design
        //find design
        int design = task.getAssignToId();

        //add notification send leader
        String url = HOST + "/" + PROJECT_NAME + "/design/sub-task/view-sub-task-detail?project-id=" + task.getProjectId() + "&section-id=" + task.getSectionId() + "&task-id=" + task.getTaskfId() + "&sub-task-id=" + task.getTaskId();
        String message = "Sub-task của bạn đã được phê duyệt";
        Notification notification = new Notification(-1, new java.util.Date(), message, design, task.getProjectId(), url);
        notificationService.addNotification(notification);


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

        //add notification to design
        //find design
        int design = task.getAssignToId();

        //add notification send leader
        String url = HOST + "/" + PROJECT_NAME + "/design/sub-task/view-sub-task-detail?project-id=" + task.getProjectId() + "&section-id=" + task.getSectionId() + "&task-id=" + task.getTaskfId() + "&sub-task-id=" + task.getTaskId();
        String message = "Sub-task của bạn đã bị từ chối";
        Notification notification = new Notification(-1, new java.util.Date(), message, design, task.getProjectId(), url);
        notificationService.addNotification(notification);

        return view;
    }
}
