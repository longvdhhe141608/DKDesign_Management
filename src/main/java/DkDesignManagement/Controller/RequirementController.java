package DkDesignManagement.Controller;

import DkDesignManagement.Entity.*;
import DkDesignManagement.Service.*;
import DkDesignManagement.Model.RequirementPageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import static DkDesignManagement.Utils.Constant.*;

@Controller
@RequestMapping(value = "/requirement")
public class RequirementController {

    @Autowired
    private ProjectService projectService;
    @Autowired
    private RequirementService requirementService;

    @Autowired
    private TaskService taskService;

    @Autowired
    NotificationService notificationService;

    @Autowired
    HistoryService historyService;

    @RequestMapping(value = "/requirement-for-leader", method = RequestMethod.GET)
    public ModelAndView viewRequirement(@ModelAttribute("mess") String mess, HttpServletRequest request) {
        ModelAndView view = new ModelAndView("leader/requirement");

        int projectID = Integer.parseInt(request.getParameter("id"));
        Project project = projectService.getProject(projectID);

        int page = 1;
        if (!ObjectUtils.isEmpty(request.getParameter("page"))) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        RequirementPageResponse requirementPageResponse = requirementService.getPaginationRequirementByProjectID(page, projectID);
        List<Requirement> requirements = requirementPageResponse.getRequirementList();


        //show history
        List<RevisionHistory> listHistory = historyService.getAlLRevisionHistoryByType("requirement", projectID);

        //check and update status
        for (Requirement requirement : requirements) {
            requirement.setStatus(requirementService.checkAndUpdaterRequirementDone(requirement));

        }

        view.addObject("requirements", requirements);
        view.addObject("listHistory", listHistory);
        view.addObject("page", page);
        view.addObject("endPage", requirementPageResponse.getEndPage());
        view.addObject("project", project);
        view.addObject("projectId", projectID);
        view.addObject("mess", mess);
        return view;
    }

    @RequestMapping(value = "/add-new-requirement", method = RequestMethod.POST)
    public ModelAndView insertRequirement(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirect) {
        ModelAndView view;
        int projectID = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("ten-vi-tri").trim();
        String detail = request.getParameter("noi-dung-yeu-cau").trim();
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        Requirement requirement = Requirement.builder()
                .projectId(projectID)
                .requirementName(name)
                .requirementDetail(detail)
                .requirementDate(date)
                .status(4)
                .build();
        int saveRequirement = requirementService.insertRequirement(requirement);
        if (saveRequirement == 0) {
            view = new ModelAndView("redirect:/requirement/requirement-for-leader?id=" + projectID);
            redirect.addAttribute("mess", "Lưu yêu cầu không thành công.");
        } else {
            view = new ModelAndView("redirect:/requirement/requirement-for-leader?id=" + projectID);
            redirect.addAttribute("mess", "Lưu yêu cầu thành công.");
        }
        view.addObject("id", projectID);
        return view;
    }

    @RequestMapping(value = "/delete-requirement-by-leader", method = RequestMethod.POST)
    public void deleteRequirement(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirect) throws IOException {
//        ModelAndView view;
        int requirementID = Integer.parseInt(request.getParameter("requirementId"));
//        int projectID = Integer.parseInt(request.getParameter("projectID"));
        Requirement requirement = requirementService.getRequirementById(requirementID);
        int delete = requirementService.deleteRequirement(requirement);
        List<Task> taskList = taskService.getAllTaskByRequirementId(requirementID);
        if (delete == 0) {
            response.getWriter().println("Đã hủy");
//            view = new ModelAndView("redirect:/requirement/requirement-for-leader");
//            view.addObject("mess", "Delete failed");
            redirect.addAttribute("mess", "delete-cancel");
        } else {
            List<Integer> listDesign = new ArrayList<Integer>();//to send notification
            redirect.addAttribute("mess", "Xóa yêu cầu thành công.");
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
                listDesign = listDesign.stream().distinct().collect(Collectors.toList());
                for (Integer designId : listDesign) {
                    String url = HOST + "/" + PROJECT_NAME + "/design/requirement/view-requirement?project-id=" + requirement.getProjectId();
                    String message = "Yêu cầu của khách hàng đã xóa";

                    Notification notification = new Notification(-1, new java.util.Date()
                            , message, designId, requirement.getProjectId(), url);
                    notificationService.addNotification(notification);
                }
            }

            //add history
            //check history exits
            String type = "requirement";
            List<RevisionHistory> listHistory = historyService.getAlLRevisionHistoryByType(type, requirement.getProjectId());
            int revisionNoNew = 1;
            if (!ObjectUtils.isEmpty(listHistory)) {
                revisionNoNew = listHistory.size() + 1;
            }

            String revisionDetail = "Yêu cầu : " + requirement.getRequirementName() + " đã bị xóa";

            RevisionHistory revisionHistory = new RevisionHistory(-1, requirement.getId(), revisionNoNew, new Date(), revisionDetail, type, requirement.getProjectId());
            historyService.addHistory(revisionHistory);

//            view = new ModelAndView("redirect:/requirement/requirement-for-leader");
//            view.addObject("mess", "Delete success");
        }

//        view.addObject("id", projectID);
    }

    @RequestMapping(value = "/update-requirement", method = RequestMethod.POST)
    public ModelAndView updateRequirement(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirect) {
        int requirementId = Integer.parseInt(request.getParameter("requirementId"));
        Requirement requirement = requirementService.getRequirementById(requirementId);
        ModelAndView view = new ModelAndView("redirect:/requirement/requirement-for-leader?id=" + requirement.getProjectId());

        //update
        String name = request.getParameter("name");
        String detail = request.getParameter("detail");
        String oldName = requirement.getRequirementName();
        String oldDetail = requirement.getRequirementDetail();

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
            listDesign = listDesign.stream().distinct().collect(Collectors.toList());
            for (Integer designId : listDesign) {
                String url = HOST + "/" + PROJECT_NAME + "/design/requirement/view-requirement?project-id=" + requirement.getProjectId();
                String message = "Yêu cầu của khách hàng đã bị sửa";

                Notification notification = new Notification(-1, new java.util.Date()
                        , message, designId, requirement.getProjectId(), url);
                notificationService.addNotification(notification);
            }
        }

        requirementService.updateRequirement(requirement);
        redirect.addAttribute("mess", "Thay đổi thành công.");

        //add history
        //check history exits
        String type = "requirement";
        List<RevisionHistory> listHistory = historyService.getAlLRevisionHistoryByType(type, requirement.getProjectId());
        int revisionNoNew = 1;
        if (!ObjectUtils.isEmpty(listHistory)) {
            revisionNoNew = listHistory.size() + 1;
        }

        String revisionDetail = "Vị trí : " + oldName + " -> " + requirement.getRequirementName() + " <br> "
                + " Yêu cầu : " + oldDetail + " -> " + requirement.getRequirementDetail();
        RevisionHistory revisionHistory = new RevisionHistory(-1, requirement.getId(), revisionNoNew, new Date(), revisionDetail, type, requirement.getProjectId());
        historyService.addHistory(revisionHistory);

        return view;
    }

}
