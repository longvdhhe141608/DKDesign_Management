package DkDesignManagement.Controller.Design;

import DkDesignManagement.Entity.*;
import DkDesignManagement.Service.*;
import DkDesignManagement.Model.TaskWaitDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import static DkDesignManagement.Utils.Constant.HOST;
import static DkDesignManagement.Utils.Constant.PROJECT_NAME;

@Controller
@RequestMapping("/design/sub-task")
public class SubTaskByDesignController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private SectionService sectionService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private ImageAndFileService imageAndFileService;

    @Autowired
    private RequirementService requirementService;

    @Autowired
    private StatusService statusService;

    @Autowired
    private CloudinaryService cloudinary;


    @Autowired
    NotificationService notificationService;

    @Autowired
    CommentService commentService;


    @RequestMapping(value = "/view-sub-task-detail", method = RequestMethod.GET)
    public ModelAndView viewListTask(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("design/sub-task-design");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectService.getProject(projectID);

        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        Section section = sectionService.getOneSectionBySectionID(sectionID);

        int taskID = Integer.parseInt(request.getParameter("task-id"));
        Tasks tasks = taskService.getOneTasksByTaskID(taskID);
        List<Tasks> subTasksList = taskService.getAllSubTasksByProjectIDAndSectionIDAndTaskID(project.getId(), section.getSectionId(), tasks.getId());

        int subTaskID = Integer.parseInt(request.getParameter("sub-task-id"));
        Tasks subtask = taskService.getOneSubTaskBySubTaskID(subTaskID, tasks.getId());

        int totalFile = imageAndFileService.getTotalFileBySubTaskID(project.getId(), subtask.getId());

        float progressPercent = Math.round((totalFile / (1.0 * subtask.getNumberOfFile())) * 100);
        List<ImageAndFile> imageAndFiles = imageAndFileService.getAllImageSubtask(projectID, subTaskID);
        view.addObject("project", project);
        view.addObject("tasks", tasks);
        view.addObject("section", section);
        view.addObject("subTasksList", subTasksList);
        view.addObject("subTask", subtask);
        view.addObject("progressPercent", progressPercent);
        view.addObject("totalFile", totalFile);
        view.addObject("status", 0);
        String mess = request.getParameter("mess");
        view.addObject("listImages", imageAndFiles);
        view.addObject("mess", mess);
        view.addObject("listComment", commentService.getAllViewCommentByTaskId(subtask.getId()));

        return view;
    }

    @RequestMapping(value = "/update-file-sub-task", method = RequestMethod.POST)
    public ModelAndView updateFileSubTaskByDesign(HttpServletRequest request, @RequestParam("file") List<MultipartFile> file) {
        ModelAndView view = new ModelAndView("redirect:/design/sub-task/view-sub-task-detail");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectService.getProject(projectID);

        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        Section section = sectionService.getOneSectionBySectionID(sectionID);

        int taskID = Integer.parseInt(request.getParameter("task-id"));
        Tasks tasks = taskService.getOneTasksByTaskID(taskID);

        int subTaskID = Integer.parseInt(request.getParameter("sub-task-id"));
        Tasks subtask = taskService.getOneSubTaskBySubTaskID(subTaskID, tasks.getId());

        file.forEach(f -> {
            String url;
            try {
                url = cloudinary.uploadFile(f, "default", "image");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            if (ObjectUtils.isEmpty(url)) {
                request.setAttribute("mess", "upload fail");
                view.addObject("status", 2);
            } else {
                int sizeFile = imageAndFileService.getTotalFileBySubTaskID(project.getId(), subtask.getId());
                if (sizeFile < subtask.getNumberOfFile()) {
                    int checkSaveFile = imageAndFileService.updateFileBySubTaskID(url, project.getId(), subtask.getId());
                }
            }

            request.setAttribute("mess", "upload file successfully");
            view.addObject("status", 1);
        });

        view.addObject("project-id", projectID);
        view.addObject("task-id", taskID);
        view.addObject("section-id", sectionID);
        view.addObject("sub-task-id", subTaskID);

        return view;
    }

    @RequestMapping(value = "/view-edit-sub-task", method = RequestMethod.GET)
    public ModelAndView viewEditSubTask(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView view = new ModelAndView("design/edit-sub-task");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectService.getProject(projectID);

        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        Section section = sectionService.getOneSectionBySectionID(sectionID);

        int taskID = Integer.parseInt(request.getParameter("task-id"));
        Tasks tasks = taskService.getOneTasksByTaskID(taskID);
        List<Tasks> subTasksList = taskService.getAllSubTasksByProjectIDAndSectionIDAndTaskID(project.getId(), section.getSectionId(), tasks.getId());

        int subTaskID = Integer.parseInt(request.getParameter("sub-task-id"));
        Tasks subtask = taskService.getOneSubTaskBySubTaskID(subTaskID, tasks.getId());

        List<Requirement> requirements = requirementService.getAllRequirementByProjectID(project.getId());


        view.addObject("project", project);
        view.addObject("requirements", requirements);
        view.addObject("tasks", tasks);
        view.addObject("section", section);
        view.addObject("subTasksList", subTasksList);
        view.addObject("subTask", subtask);
        String mess = request.getParameter("mess");
        view.addObject("mess", mess);

        return view;
    }

    @RequestMapping(value = "/edit-sub-task", method = RequestMethod.POST)
    public ModelAndView editSubTask(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view;

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectService.getProject(projectID);

        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        Section section = sectionService.getOneSectionBySectionID(sectionID);

        int taskID = Integer.parseInt(request.getParameter("task-id"));
        Tasks tasks = taskService.getOneTasksByTaskID(taskID);

        int subTaskID = Integer.parseInt(request.getParameter("sub-task-id"));
        Tasks subtask = taskService.getOneSubTaskBySubTaskID(subTaskID, tasks.getId());

        String subTaskName = request.getParameter("sub-task-name");
        Date startDate = Date.valueOf(request.getParameter("start-date"));
        Date deadline = Date.valueOf(request.getParameter("deadline"));
        int numberOfFile = Integer.parseInt(request.getParameter("numberOfFile"));
        int requirementID = Integer.parseInt(request.getParameter("requirement"));

        Tasks editSubTask = Tasks.builder()
                .taskName(subTaskName)
                .startingDate(startDate)
                .deadline(deadline)
                .numberOfFile(numberOfFile)
                .requirementID(requirementID)
                .build();

        int checkEdit = taskService.updateSubTaskByDesign(subtask.getId(), editSubTask);

        if (checkEdit > 0) {
            view = new ModelAndView("redirect:/design/sub-task/view-sub-task-detail");
            view.addObject("mess", "Cập nhật thành công");
            view.addObject("status", 1);
        } else {
            view = new ModelAndView("redirect:/design/sub-task/view-edit-sub-task");
            view.addObject("mess", "Cập nhật không thành công");
            view.addObject("status", 2);
        }

        view.addObject("project-id", projectID);
        view.addObject("task-id", taskID);
        view.addObject("section-id", sectionID);
        view.addObject("sub-task-id", subTaskID);
        return view;
    }

    @RequestMapping(value = "/pending-approval-sub-task", method = RequestMethod.GET)
    public ModelAndView getSubTaskPendingApproval(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("design/pending-approval-design");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectService.getProject(projectID);

        String indexPage = request.getParameter("pageNo");

        int page = 1;
        if (indexPage != null) {
            page = Integer.parseInt(indexPage);
        }

        int statusTask = 0;
        String statusID = (request.getParameter("status"));
        if (statusID != null) {
            statusTask = Integer.parseInt(statusID);
        }

        String textSearch = request.getParameter("textSearch");

        if(!ObjectUtils.isEmpty(textSearch)){
            textSearch = textSearch.trim();
        }

        int totalSubTaskWait = taskService.totalTaskWait(project.getId(), statusTask, textSearch, account.getId());
        int totalPages = (totalSubTaskWait % 10 == 0) ? totalSubTaskWait / 10 : totalSubTaskWait / 10 + 1;

        int index = page * 10 - 10;

        List<TaskWaitDto> waitDtoList = taskService.getAllTaskWaitByDesign(project.getId(), index, statusTask, textSearch, account.getId());

        List<Integer> lsPage = new ArrayList<>();
        // for này có chức năng hiển thị list page
        for (int i = 1; i <= totalPages; ++i) {
            lsPage.add(i);
        }

        List<Status> statusList = statusService.getAllStatus();

        view.addObject("project", project);
        view.addObject("lsPage", lsPage);
        view.addObject("waitDtoList", waitDtoList);
        view.addObject("statusList", statusList);
        view.addObject("status", statusTask);
        view.addObject("textSearch", textSearch);
        return view;
    }

    @RequestMapping(value = "/submit-sub-task", method = RequestMethod.GET)
    public ModelAndView submitSubTask(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("redirect:/design/sub-task/view-sub-task-detail");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");
        int projectID = Integer.parseInt(request.getParameter("project-id"));
        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        int taskID = Integer.parseInt(request.getParameter("task-id"));
        int subTaskID = Integer.parseInt(request.getParameter("sub-task-id"));
        int updateStatus = taskService.updateStatusSubTaskByDesign(subTaskID, 3);
        if (updateStatus == 0) {
            view.addObject("mess", "Nộp không thành công! Vui lòng thử lại");
        } else {
            view.addObject("mess", "Nộp thành công");

            //find leader
            Project project = projectService.getProject(projectID);
            int leader = project.getCreator();

            //add notification send leader
            String url = HOST + "/" + PROJECT_NAME + "/subtask?taskId=" + subTaskID;
            Notification notification = new Notification(-1, new java.util.Date(), "Bạn có sub-task Chờ phê duyệt", leader, project.getId(), url);
            notificationService.addNotification(notification);
        }
        view.addObject("project-id", projectID);
        view.addObject("section-id", sectionID);
        view.addObject("task-id", taskID);
        view.addObject("sub-task-id", subTaskID);
        return view;
    }

    @RequestMapping(value = "/delete-file", method = RequestMethod.GET)
    public ModelAndView deleteFileByDesign(HttpServletRequest request, RedirectAttributes redirect) {

        int projectId = Integer.parseInt(request.getParameter("projectId"));
        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        int taskID = Integer.parseInt(request.getParameter("task-id"));
        int subTaskID = Integer.parseInt(request.getParameter("sub-task-id"));

        ModelAndView view = new ModelAndView("redirect:/design/sub-task/view-sub-task-detail?project-id="
                + projectId + "&section-id=" + sectionID + "&task-id=" + taskID + "&sub-task-id=" + subTaskID);

        String listID[] = request.getParameterValues("listFile");
        for (int i = 0; i < listID.length; i++) {
            System.out.println(listID[i]);
            imageAndFileService.updateStatus(projectId, Integer.parseInt(listID[i]));
        }
        return view;
    }

}
