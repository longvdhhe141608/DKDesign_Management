package DkDesignManagement.Controller.Design;

import DkDesignManagement.Entity.*;
import DkDesignManagement.Service.*;
import DkDesignManagement.Model.TaskDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import static DkDesignManagement.Utils.Constant.HOST;
import static DkDesignManagement.Utils.Constant.PROJECT_NAME;

@Controller
@RequestMapping("/design/task")
public class TaskByDesignController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private SectionService sectionService;

    @Autowired
    private RequirementService requirementService;

    @Autowired
    private ImageAndFileService imageAndFileService;

    @Autowired
    NotificationService notificationService;

    @Autowired
    CommentService commentService;

    @RequestMapping(value = "/list_task", method = RequestMethod.GET)
    public ModelAndView viewListTask(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("design/list_task");
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");
        Project project = projectService.getProject(id);
//        List<Task> taskList = taskDAO.getAllBigTaskInProject(id);
        List<Section> sectionList = sectionService.getAllSectionByProjectID(id);

        List<TaskDto> taskDtoList = new ArrayList<>();

        sectionList.forEach(s -> {
            List<Tasks> tasks = taskService.getAllTasksByProjectIDAndSectionID(id, s.getSectionId());
            List<Tasks> subTasks = new ArrayList<>();
            TaskDto dto = TaskDto.builder()
                    .sectionID(s.getSectionId())
                    .sectionName(s.getSectionName())
                    .tasksList(tasks)
                    .build();
            tasks.forEach(t -> {
                List<Tasks> subTasksList = taskService.getAllSubTasksByProjectIDAndSectionIDAndTaskID(id, s.getSectionId(), t.getId());
                subTasksList.forEach(rs -> {
                    Tasks tk = Tasks.builder()
                            .id(rs.getId())
                            .projectID(rs.getProjectID())
                            .sectionID(rs.getSectionID())
                            .taskID(rs.getTaskID())
                            .creator(rs.getCreator())
                            .assignedTo(rs.getAssignedTo())
                            .requirementID(rs.getRequirementID())
                            .taskName(rs.getTaskName())
                            .startingDate(rs.getStartingDate())
                            .deadline(rs.getDeadline())
                            .endedDate(rs.getEndedDate())
                            .numberOfFile(rs.getNumberOfFile())
                            .description(rs.getDescription())
                            .status(rs.getStatus())
                            .nameEmployee(rs.getNameEmployee())
                            .build();
                    subTasks.add(tk);
                });
                dto.setSubTasksList(subTasks);
            });
            taskDtoList.add(dto);
        });

        List<Requirement> requirements = requirementService.getAllRequirementByProjectID(project.getId());

        view.addObject("project", project);
//        view.addObject("taskList", taskList);
        view.addObject("taskDtoList", taskDtoList);
        return view;
    }

    @RequestMapping(value = "/view-detail-task", method = RequestMethod.GET)
    public ModelAndView viewDetailTaskByTaskID(HttpServletRequest request, @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("design/task_detail");

        int taskID = Integer.parseInt(request.getParameter("task-id"));

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectService.getProject(projectID);

        Tasks tasks = taskService.getOneTasksByTaskID(taskID);

        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        Section section = sectionService.getOneSectionBySectionID(sectionID);
        List<Tasks> subTasksList = taskService.getTotalFileSubTasksByProjectIDAndSectionIDAndTaskID(project.getId(), section.getSectionId(), tasks.getId());

        List<Requirement> requirements = requirementService.getAllRequirementByProjectID(project.getId());

        int totalSubmitFile = 0;
        int totalFile = 0;

        for (int i = 0; i < subTasksList.size(); i++) {
            totalSubmitFile += imageAndFileService.getTotalFile(subTasksList.get(i).getId());
            totalFile += subTasksList.get(i).getNumberOfFile();
        }

        float progressPercent = Math.round((totalSubmitFile / (1.0 * totalFile)) * 100);

        view.addObject("project", project);
        view.addObject("tasks", tasks);
        view.addObject("section", section);
        view.addObject("subTasksList", subTasksList);
        view.addObject("requirements", requirements);
        view.addObject("progressPercent", progressPercent);
        view.addObject("totalSubmitFile", totalSubmitFile);
        view.addObject("totalFile", totalFile);
        view.addObject("mess", mess);
        view.addObject("listComment", commentService.getAllViewCommentByTaskId(tasks.getId()));

        return view;
    }

    @RequestMapping(value = "/insert-sub-task", method = RequestMethod.POST)
    public ModelAndView insertSubTaskByDesign(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirect) {

        ModelAndView view;

        String subTaskName = request.getParameter("sub-task-name").trim();
        Date startDate = Date.valueOf(request.getParameter("startDate").trim());
        Date deadline = Date.valueOf(request.getParameter("endDate").trim());
        int numberOfFile = Integer.parseInt(request.getParameter("numberOfFile").trim());
        int requirementID = Integer.parseInt(request.getParameter("requirementID").trim());
        int taskID = Integer.parseInt(request.getParameter("task-id"));
        int projectID = Integer.parseInt(request.getParameter("project-id"));
        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        if (startDate.before(taskService.getTaskById(taskID).getStartDate()) || startDate.after(taskService.getTaskById(taskID).getDeadline())
                || deadline.before(taskService.getTaskById(taskID).getStartDate()) || deadline.after(taskService.getTaskById(taskID).getDeadline())) {
            redirect.addAttribute("mess", "Thời gian của công việc phụ không hợp lí.");
            view = new ModelAndView("redirect:/design/task/view-detail-task");
            view.addObject("project-id", projectID);
            view.addObject("task-id", taskID);
            view.addObject("section-id", sectionID);
            return view;
        }

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");

        //check if it's my task
        Task task = taskService.getTaskById(taskID);
        if(account.getId() != task.getAssignToId()){
            redirect.addAttribute("mess", "Bạn không có nhiệm vụ trong task này");
            view = new ModelAndView("redirect:/design/task/view-detail-task");
            view.addObject("project-id", projectID);
            view.addObject("task-id", taskID);
            view.addObject("section-id", sectionID);
            return view;
        }

        Task tasks = Task.builder()
                .projectId(projectID)
                .sectionId(sectionID)
                .taskfId(BigInteger.valueOf(taskID))
                .creatorId(account.getId())
                .assignToId(account.getId())
                .requirementId(BigInteger.valueOf(requirementID))
                .taskName(subTaskName)
                .startDate(startDate)
                .deadline(deadline)
                .fileNumber(numberOfFile)
                .taskStatus(1)
                .build();

        int keySubTask = taskService.addTask(tasks);

        if (keySubTask == 0) {
            view = new ModelAndView("redirect:/design/task/view-detail-task");
        } else {
            view = new ModelAndView("redirect:/design/task/view-detail-task");
            //find leader
            Project project = projectService.getProject(projectID);
            int leader = project.getCreator();

            //add notification send leader
            String url = HOST + "/" + PROJECT_NAME + "/subtask?taskId=" + keySubTask;
            Notification notification = new Notification(-1, new java.util.Date(), "Bạn có sub-task Chưa phê duyệt", leader, project.getId(), url);
            notificationService.addNotification(notification);
        }


        view.addObject("project-id", projectID);
        view.addObject("task-id", taskID);
        view.addObject("section-id", sectionID);
        return view;
    }
}
