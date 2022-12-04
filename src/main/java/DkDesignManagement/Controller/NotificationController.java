package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Notification;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Service.NotificationService;
import DkDesignManagement.Service.TaskService;
import DkDesignManagement.model.NotificationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import static DkDesignManagement.utils.Constant.HOST;
import static DkDesignManagement.utils.Constant.PROJECT_NAME;

@Controller
@RequestMapping(value = "/notification")
public class NotificationController {

    @Autowired
    NotificationService notificationService;
    @Autowired
    TaskService taskService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView notification(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("notification");

        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }
        Account account = (Account) session.getAttribute("loginUser");
        if (account.getRole_id() == 3) {
            view = new ModelAndView("/design/notification");
        }
        //sendNotification
        //check Role
        if (account.getRole_id() == 2) {
            //leader
            sendNotificationToLeader(account);
        } else if (account.getRole_id() == 3) {
            //design
            sendNotificationToDesign(account);
        }

        view.addObject("listNotification", notificationService.getAllByAccountId(account.getId()));

        return view;
    }

    private void sendNotificationToDesign(Account account) {
        //check task Expired
        List<Task> listTaskExpired = taskService.getListTaskExpiredToDayDesign(account.getId());
        if (!ObjectUtils.isEmpty(listTaskExpired)) {
            //find design
            int design = account.getId();
            for (Task task : listTaskExpired) {

                if (!ObjectUtils.isEmpty(task)) {
                    //add notification send leader
                    String url = HOST + "/" + PROJECT_NAME + "/design/sub-task/view-sub-task-detail?project-id=" + task.getProjectId() + "" +
                            "&section-id=" + task.getSectionId() + "&task-id=" + task.getTaskfId() + "&sub-task-id=" + task.getTaskId();
                    String message = "Bạn có sub-task trong dự án đến ngày hết hạn";

                    //check notification exits
                    NotificationDto notificationDto = notificationService.getNotification(design, message, url);
                    if (ObjectUtils.isEmpty(notificationDto)) {
                        Notification notification = new Notification(-1, new java.util.Date()
                                , message, design, task.getProjectId(), url);
                        notificationService.addNotification(notification);
                    }

                }
            }
        }

    }

    private void sendNotificationToLeader(Account account) {
        //check task Expired
        List<Task> listTaskExpired = taskService.getListTaskExpiredToDay(account.getId());
        if (!ObjectUtils.isEmpty(listTaskExpired)) {
            //find leader
            int leader = account.getId();
            for (Task task : listTaskExpired) {

                if (!ObjectUtils.isEmpty(task)) {
                    //add notification send leader
                    String url = HOST + "/" + PROJECT_NAME + "/subtask?taskId=" + task.getTaskId();
                    String message = "Bạn có sub-task trong dự án đến ngày hết hạn";

                    //check notification exits
                    NotificationDto notificationDto = notificationService.getNotification(leader, message, url);
                    if (ObjectUtils.isEmpty(notificationDto)) {
                        Notification notification = new Notification(-1, new java.util.Date()
                                , message, leader, task.getProjectId(), url);
                        notificationService.addNotification(notification);
                    }
                }
            }
        }

    }


}

