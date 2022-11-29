package DkDesignManagement.Controller.Design;

import DkDesignManagement.Entity.*;
import DkDesignManagement.Repository.*;
import DkDesignManagement.Service.CommentService;
import DkDesignManagement.Service.NotificationService;
import DkDesignManagement.model.TaskDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import static DkDesignManagement.utils.Constant.HOST;
import static DkDesignManagement.utils.Constant.PROJECT_NAME;

@Controller
@RequestMapping("/design/task")
public class TaskByDesignController {

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private TaskDAO taskDAO;

    @Autowired
    private SectionDAO sectionDao;

    @Autowired
    private RequirementDao requirementDao;

    @Autowired
    private ImageAndFileDao imageAndFileDao;

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
        Project project = projectDao.getProject(id);
//        List<Task> taskList = taskDAO.getAllBigTaskInProject(id);
        List<Section> sectionList = sectionDao.getAllSectionByProjectID(id);

        List<TaskDto> taskDtoList = new ArrayList<>();

        sectionList.forEach(s -> {
            List<Tasks> tasks = taskDAO.getAllTasksByProjectIDAndSectionID(id, s.getSectionId());
            List<Tasks> subTasks = new ArrayList<>();
            TaskDto dto = TaskDto.builder()
                    .sectionID(s.getSectionId())
                    .sectionName(s.getSectionName())
                    .tasksList(tasks)
                    .build();
            tasks.forEach(t -> {
                List<Tasks> subTasksList = taskDAO.getAllSubTasksByProjectIDAndSectionIDAndTaskID(id, s.getSectionId(), t.getId());
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

        List<Requirement> requirements = requirementDao.getAllRequirementByProjectID(project.getId());

        view.addObject("project", project);
//        view.addObject("taskList", taskList);
        view.addObject("taskDtoList", taskDtoList);
        return view;
    }

    @RequestMapping(value = "/view-detail-task", method = RequestMethod.GET)
    public ModelAndView viewDetailTaskByTaskID(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("design/task_detail");

        int taskID = Integer.parseInt(request.getParameter("task-id"));

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectDao.getProject(projectID);

        Tasks tasks = taskDAO.getOneTasksByTaskID(taskID);

        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        Section section = sectionDao.getOneSectionBySectionID(sectionID);
        List<Tasks> subTasksList = taskDAO.getAllSubTasksByProjectIDAndSectionIDAndTaskID(project.getId(), section.getSectionId(), tasks.getId());

        List<Requirement> requirements = requirementDao.getAllRequirementByProjectID(project.getId());

        int totalSubmitFile = 0;
        int totalFile = 0;

        for (int i = 0; i < subTasksList.size(); i++) {
            totalSubmitFile += imageAndFileDao.getTotalFile(subTasksList.get(i).getId());
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
        view.addObject("listComment", commentService.getAllCommentsByTaskId(tasks.getId()));

        return view;
    }

    @RequestMapping(value = "/insert-sub-task", method = RequestMethod.POST)
    public ModelAndView insertSubTaskByDesign(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView view;

        String subTaskName = request.getParameter("sub-task-name").trim();
        Date startDate = Date.valueOf(request.getParameter("startDate").trim());
        Date deadline = Date.valueOf(request.getParameter("endDate").trim());
        int numberOfFile = Integer.parseInt(request.getParameter("numberOfFile").trim());
        int requirementID = Integer.parseInt(request.getParameter("requirementID").trim());
        int taskID = Integer.parseInt(request.getParameter("task-id"));
        int projectID = Integer.parseInt(request.getParameter("project-id"));
        int sectionID = Integer.parseInt(request.getParameter("section-id"));

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");

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

        int keySubTask = taskDAO.addTask(tasks);

        if (keySubTask == 0) {
            view = new ModelAndView("redirect:/design/task/view-detail-task");
            view.addObject("mess", "Save failed");
        } else {
            view = new ModelAndView("redirect:/design/task/view-detail-task");
            view.addObject("mess", "Save success");
            //find leader
            Project project = projectDao.getProject(projectID);
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
