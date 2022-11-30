package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Notification;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Requirement;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Repository.RequirementDao;
import DkDesignManagement.Service.NotificationService;
import DkDesignManagement.Service.RequirementService;
import DkDesignManagement.Service.TaskService;
import DkDesignManagement.Service.TestService;
import DkDesignManagement.model.NotificationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static DkDesignManagement.utils.Constant.*;

@Controller
@RequestMapping(value = "/requirement")
public class RequirementController {

    @Autowired
    private RequirementDao requirementDao;

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private RequirementService requirementService;

    @Autowired
    private TaskService taskService;

    @Autowired
    NotificationService notificationService;

    private List<Task> taskList;

    @RequestMapping(value = "/requirement-for-leader", method = RequestMethod.GET)
    public ModelAndView viewRequirement(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("requirement");

        int projectID = Integer.parseInt(request.getParameter("id"));
        Project project = projectDao.getProject(projectID);

        String indexPage = request.getParameter("pageNo");
        int page = 0;
        if (indexPage != null) {
            page = Integer.parseInt(indexPage);
        }

        int totalRequirement = requirementDao.getAllRequirementByProjectID(projectID).size();
        int totalPages = (totalRequirement % 10 == 0) ? totalRequirement / 10 : totalRequirement / 10 + 1;

        List<Requirement> requirements = requirementDao.getPaginationRequirementByProjectID(projectID, page);
        //check and update status
        for (Requirement requirement : requirements) {
            requirement.setStatus(requirementService.checkAndUpdaterRequirementDone(requirement));
        }

        List<Integer> lsPage = new ArrayList<>();
        // for này có chức năng hiển thị list page
        for (int i = 1; i <= totalPages; ++i) {
            lsPage.add(i);
        }

        view.addObject("requirements", requirements);
        view.addObject("lsPage", lsPage);
        view.addObject("project", project);
        return view;
    }

    @RequestMapping(value = "/add-new-requirement", method = RequestMethod.POST)
    public ModelAndView insertRequirement(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view;
        int projectID = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("ten-vi-tri").trim();
        String detail = request.getParameter("noi-dung-yeu-cau").trim();
        Requirement requirement = Requirement.builder()
                .projectId(projectID)
                .requirementName(name)
                .requirementDetail(detail)
                .status(4)
                .build();
        int saveRequirement = requirementDao.insertRequirement(requirement);
        if (saveRequirement == 0) {
            view = new ModelAndView("redirect:/requirement/requirement-for-leader?id=" + projectID);
            view.addObject("mess", "Save failed");
        } else {
            view = new ModelAndView("redirect:/requirement/requirement-for-leader?id=" + projectID);
            view.addObject("mess", "Save success");
        }
        view.addObject("id", projectID);
        return view;
    }

    @RequestMapping(value = "/delete-requirement-by-leader", method = RequestMethod.POST)
    public void deleteRequirement(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        ModelAndView view;
        int requirementID = Integer.parseInt(request.getParameter("requirementId"));
//        int projectID = Integer.parseInt(request.getParameter("projectID"));
        Requirement requirement = requirementDao.getRequirementById(requirementID);
        int delete = requirementDao.deleteRequirement(requirement);
        List<Task> taskList = taskService.getAllTaskByRequirementId(requirementID);
        if (delete == 0) {
            response.getWriter().println("Đã hủy");
//            view = new ModelAndView("redirect:/requirement/requirement-for-leader");
//            view.addObject("mess", "Delete failed");
        } else {
            List<Integer> listDesign = new ArrayList<Integer>();//to send notification

            for (Task task : taskList) {
                task.setTaskStatus(CANCEL_TASK_STATUS);
                taskService.updateTask(task);
                listDesign.add(task.getAssignToId());
            }
            response.getWriter().println("Đã xóa");

            //add notification send design

            //find desing
            if (!ObjectUtils.isEmpty(listDesign)) {
                //send to design
                for (Integer designId : listDesign) {
                    String url = HOST + "/" + PROJECT_NAME + "/design/requirement/view-requirement?project-id" + requirement.getProjectId();
                    String message = "Yêu cầu của khách hàng đã xóa";

                    Notification notification = new Notification(-1, new java.util.Date()
                            , message, designId, requirement.getProjectId(), url);
                    notificationService.addNotification(notification);
                }
            }

//            view = new ModelAndView("redirect:/requirement/requirement-for-leader");
//            view.addObject("mess", "Delete success");
        }

//        view.addObject("id", projectID);
    }

    @RequestMapping(value = "/update-requirement", method = RequestMethod.POST)
    public ModelAndView updateRequirement(HttpServletRequest request, HttpServletResponse response) {
        int requirementId = Integer.parseInt(request.getParameter("requirementId"));
        Requirement requirement = requirementService.getRequirementById(requirementId);
        ModelAndView view = new ModelAndView("redirect:/requirement/requirement-for-leader?id=" + requirement.getProjectId());

        //update
        String name = request.getParameter("name");
        String detail = request.getParameter("detail");

        requirement.setRequirementName(name);
        requirement.setRequirementDetail(detail);
        if (requirement.getStatus() == COMPLETE_REQUIREMENT_STATUS) {
            requirement.setStatus(PROCESS_REQUIREMENT_STATUS);
        }

        //update status task
        List<Task> tasksList = taskService.getAllTaskByRequirementId(requirementId);

        //list design of task  ,project
        List<Integer> listDesign = new ArrayList<Integer>();
        for (Task task : tasksList) {
            if (task.getTaskStatus() == COMPLETE_TASK_STATUS) {
                task.setTaskStatus(PROCESS_TASK_STATUS);
                taskService.updateTask(task);
            }
            //add design of task to list
            listDesign.add(task.getAssignToId());
        }

        //add notification send design
        //find desing
        if (!ObjectUtils.isEmpty(listDesign)) {
            //send to design
            for (Integer designId : listDesign) {
                String url = HOST + "/" + PROJECT_NAME + "/design/requirement/view-requirement?project-id" + requirement.getProjectId();
                String message = "Yêu cầu của khách hàng đã bị sửa";

                Notification notification = new Notification(-1, new java.util.Date()
                        , message, designId, requirement.getProjectId(), url);
                notificationService.addNotification(notification);
            }
        }


        requirementService.updateRequirement(requirement);

        return view;
    }

}
