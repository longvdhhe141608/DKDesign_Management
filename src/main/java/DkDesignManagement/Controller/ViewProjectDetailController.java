package DkDesignManagement.Controller;

import DkDesignManagement.Entity.*;
import DkDesignManagement.Service.*;
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

import static DkDesignManagement.Utils.Constant.HOST;
import static DkDesignManagement.Utils.Constant.PROJECT_NAME;

@Controller
@RequestMapping(value = "/project")
public class ViewProjectDetailController {

    @Autowired
    private StatusService statusService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    HistoryService historyService;
    @Autowired
    private ImageAndFileService imageAndFileService;

    @Autowired
    NotificationService notificationService;

    @Autowired
    ProjectParticipationService projectParticipationService;

    @RequestMapping(value = "/summary", method = RequestMethod.GET)
    public ModelAndView projectDetail(HttpServletRequest request, @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("leader/summary");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectService.getProject(id);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");

        ProjectParticipation projectParticipation = projectParticipationService.getProjectParticipants(id,account.getId());
        if(projectParticipation.getRoleId() == 3 ){
            //design
            view = new ModelAndView("redirect:/design/project/summary?id="+id);
            return view;
        }
        //list status

        List<Status> listStatus = statusService.getAllStatus();
        List<Status> listRemove = new ArrayList<>();
        for (Status status : listStatus) {
            if (ObjectUtils.isEmpty(status.getStatusProject())) {
                listRemove.add(status);
            }else{
                if(status.getStatusProject().equals("Đã xóa")){
                    listRemove.add(status);
                }
            }
        }
        List<ImageAndFile> imageAndFiles = imageAndFileService.getAllImageSummary(id);
        listStatus.removeAll(listRemove);
        view.addObject("listHistory", historyService.getAlLRevisionHistoryOfTable(project.getId(), "project", project.getId()));
        view.addObject("listImage", imageAndFiles);
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
        Project project = projectService.getProject(projectId);
        int oldStatus = project.getStatus();
        if (status == 3) {
            project.setEndDate(new Date());
        }
        project.setStatus(status);

        projectService.editProject(project);

        //send notification add member
        String oldStatusName = "";
        String newStatusName = "";
        List<Status> statusList = statusService.getAllStatus();
        for (Status statusEntity : statusList) {
            if(statusEntity.getId()==oldStatus){
                oldStatusName = statusEntity.getStatusProject();
            }
            if(statusEntity.getId()==status){
                newStatusName = statusEntity.getStatusProject();
            }
        }

        //add notification
        List<ProjectParticipation> list = projectParticipationService.getProjectParticipantsByProjectId(projectId);
        for(ProjectParticipation participation : list){
            if(participation.getRoleId() != 2){
                addNotificationChangeStatusProject( projectId,  participation.getAccountId(), oldStatusName ,  newStatusName);
            }
        }




        return view;
    }

    private void addNotificationChangeStatusProject(int projectId, int accountId,String oldStatusName , String newStatusName) {
        String url = HOST + "/" + PROJECT_NAME + "/design/project/summary?id="+projectId;

        Project project = projectService.getProject(projectId);

        String message = "Dự án "+project.getProjectName() + " đã thay đổi trạng thái "+oldStatusName+" -> "+newStatusName+" ";

        //check notification exits
        // NotificationDto notificationDto = notificationService.getNotification(accountId, message, url);
        Notification notification = new Notification(-1, new java.util.Date()
                , message, accountId, projectId, url);
        notificationService.addNotification(notification);
    }

    @RequestMapping(value = "/delete-file", method = RequestMethod.GET)
    public ModelAndView deleteFile(HttpServletRequest request, RedirectAttributes redirect) {

        int projectId = Integer.parseInt(request.getParameter("projectId"));

        ModelAndView view = new ModelAndView("redirect:/project/summary?id=" + projectId);
        String listID[] = request.getParameterValues("listFile");
        System.out.println("aaaaaaaaaa");
        for (int i = 0; i < listID.length; i++) {
            System.out.println(listID[i]);
            imageAndFileService.updateStatus(projectId, Integer.parseInt(listID[i]));
        }
        return view;
    }

}
