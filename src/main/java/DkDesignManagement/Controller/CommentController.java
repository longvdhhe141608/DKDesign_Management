package DkDesignManagement.Controller;

import DkDesignManagement.Entity.*;
import DkDesignManagement.Service.CommentService;
import DkDesignManagement.Service.NotificationService;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.Service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

import static DkDesignManagement.Utils.Constant.HOST;
import static DkDesignManagement.Utils.Constant.PROJECT_NAME;

@Controller
public class CommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    TaskService taskService;

    @Autowired
    ProjectService projectService;

    @Autowired
    NotificationService notificationService;

    @RequestMapping(value = "/add-comment", method = RequestMethod.POST)
    public ModelAndView addComment(HttpServletRequest request, RedirectAttributes redirect) {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        String operation = request.getParameter("operation");
        ModelAndView view = new ModelAndView();
        Task task = taskService.getTaskById(taskId);
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }
        Account account = (Account) session.getAttribute("loginUser");
        //check previous page
        if (account.getRole_id() == 2) {
            view = new ModelAndView("redirect:/task_detail?taskId=" + taskId);
            if (operation.equals("subTaskDetail")) {
                view = new ModelAndView("redirect:/subtask?taskId=" + taskId);
            }
        } else {
            view = new ModelAndView("redirect:/design/task/view-detail-task?project-id=" + task.getProjectId() + "&section-id=" + task.getSectionId() + "&task-id=" + task.getTaskId());
            if (operation.equals("subTaskDetail")) {
                view = new ModelAndView("redirect:/design/sub-task/view-sub-task-detail?project-id=" + task.getProjectId() + "&section-id=" + task.getSectionId() + "&task-id=" + task.getTaskfId() + "&sub-task-id=" + task.getTaskId());
            }
        }

        //get value
        String content = request.getParameter("content");

        //create model
        Comment comment = new Comment(-1, content, new Date(), taskId, account.getId(), false);

        //add
        commentService.addComment(comment);

        //find leader

        Project project = projectService.getProject(task.getProjectId());


        //find task
        //case : account tự comment vào bài mình và hiện thông báo

        if (account.getId() != project.getCreator()) {
            //role leader
            addNotificationSendLeader(account, task, project);
        }
        if (account.getId() != task.getAssignToId()) {
            //role design
            addNotificationSendDesign(account, task);
        }

        return view;
    }

    private void addNotificationSendDesign(Account account, Task task) {

        //add notification send leader
        String url = HOST + "/" + PROJECT_NAME + "/subtask?taskId=" + task.getTaskId();

        String messageNotification = account.getUsername() + " đã bình luận về sub-task : " + task.getTaskName();
        ;//sub task
        //check task or sub task
        if (ObjectUtils.isEmpty(task.getTaskfId())) {
            //task
            messageNotification = account.getUsername() + " đã bình luận về task : " + task.getTaskName();
        }
        int design = task.getAssignToId();

        Notification notification = new Notification(-1, new java.util.Date(), messageNotification, design, task.getProjectId(), url);
        notificationService.addNotification(notification);
    }


    private void addNotificationSendLeader(Account account, Task task, Project project) {

        //add notification send leader
        String url = HOST + "/" + PROJECT_NAME + "/subtask?taskId=" + task.getTaskId();

        String messageNotification = account.getUsername() + " đã bình luận về sub-task : " + task.getTaskName();
        ;//sub task
        //check task or sub task
        if (ObjectUtils.isEmpty(task.getTaskfId())) {
            //task
            messageNotification = account.getUsername() + " đã bình luận về task : " + task.getTaskName();
        }
        int leaderId = project.getCreator();


        Notification notification = new Notification(-1, new java.util.Date(), messageNotification, leaderId, project.getId(), url);
        notificationService.addNotification(notification);
    }

    @RequestMapping(value = "/pin-comment", method = RequestMethod.GET)
    public ModelAndView pinComment(HttpServletRequest request, RedirectAttributes redirect) {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        ModelAndView view = new ModelAndView("redirect:/task_detail?taskId=" + taskId);
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            view = new ModelAndView("redirect:/login");
            return view;
        }
        //check previous page
        String operation = request.getParameter("operation");
        if (operation.equals("subTaskDetail")) {
            view = new ModelAndView("redirect:/subtask?taskId=" + taskId);
        }
        Account account = (Account) session.getAttribute("loginUser");
        //check role
        if (account.getRole_id() != 2) {
            redirect.addAttribute("mess", "You are not authorized");
            view = new ModelAndView("redirect:/task_detail?taskId=" + taskId);
            return view;
        }

        //update
        int commentId = Integer.parseInt(request.getParameter("commentId"));

        commentService.updatePinComment(commentId);


        return view;
    }
}
