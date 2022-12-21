package DkDesignManagement.Controller;

import DkDesignManagement.Entity.*;
import DkDesignManagement.Service.*;
import DkDesignManagement.Model.MyTaskDto;
import DkDesignManagement.Model.NotificationDto;
import DkDesignManagement.Utils.DateUtils;
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
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static DkDesignManagement.Utils.Constant.*;

@Controller
public class TaskController {

    @Autowired
    SectionService sectionService;

    @Autowired
    ProjectService projectService;

    @Autowired
    AccountService accountService;

    @Autowired
    RequirementService requirementService;

    @Autowired
    TaskService taskService;


    @Autowired
    CommentService commentService;


    @Autowired
    private ImageAndFileService imageAndFileService;

    @Autowired
    NotificationService notificationService;

    @Autowired
    StatusService statusService;

    @RequestMapping(value = "/list_task", method = RequestMethod.GET)
    public ModelAndView viewListTask(@ModelAttribute("mess") String mess, HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectService.getProject(id);

        ModelAndView view = new ModelAndView("leader/list_task");
        view.addObject("project", project);
        view.addObject("listBigTask", sectionService.getAll(id));
        view.addObject("listAccount", accountService.getAccountsByProjectId(id));
        view.addObject("listTaskLevel2", taskService.getListSubTask());
        view.addObject("mess", mess);
        return view;
    }

    @RequestMapping(value = "/task_detail", method = RequestMethod.GET)
    public ModelAndView viewTaskDetail(HttpServletRequest request, @ModelAttribute("mess") String mess, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("leader/task_detail");
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            view = new ModelAndView("redirect:/login");
            return view;
        }
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskService.getTaskByIdFullModel(taskId);
        //check sub task
        if (task.getTaskfId() != null) {
            view = new ModelAndView("redirect:/subtask?taskId=" + taskId);
            return view;
        }
        //check and update task level 2 100%
        //update done
        task.setTaskStatus(taskService.checkAndUpdateTaskDone(task));

        List<Tasks> subTasksList = taskService.getAllSubTasksByTaskID(taskId);

        int totalSubmitFile = 0;
        int totalFile = 0;

        for (Tasks tasks : subTasksList) {
            totalSubmitFile += imageAndFileService.getTotalFile(tasks.getId());
            totalFile += tasks.getNumberOfFile();
        }

        float progressPercent = Math.round((totalSubmitFile / (1.0 * totalFile)) * 100);
        //load infor add sub task
        view.addObject("listAccount", accountService.getAccountsByProjectId(task.getProjectId()));
        view.addObject("listRequirement", requirementService.getRequirementByProjectId(task.getProjectId()));

        view.addObject("listComment", commentService.getAllViewCommentByTaskId(taskId));
        view.addObject("task", task);
        view.addObject("mess", mess);
        view.addObject("totalSubmitFile", totalSubmitFile);
        view.addObject("totalFile", totalFile);
        view.addObject("progressPercent", progressPercent);
        return view;
    }

    @RequestMapping(value = "/leader-task", method = RequestMethod.GET)
    public ModelAndView viewLeaderTaskDetail(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("/leader/view_leader_task");
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            view = new ModelAndView("redirect:/login");
            return view;
        }
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskService.getTaskByIdFullModelForLeader(taskId);
        task.setTaskStatus(taskService.checkAndUpdateTaskDone(task));
        List<Status> statusList = statusService.getAllStatus();
        view.addObject("project", projectService.getProject(task.getProjectId()));
        view.addObject("task", task);
        view.addObject("listStatus", statusList);
        return view;
    }

    @RequestMapping(value = "/subtask", method = RequestMethod.GET)
    public ModelAndView viewSubTaskDetail(HttpServletRequest request, @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("leader/subtask");
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskService.getTaskByIdFullModel(taskId);
        List<ImageAndFile> imageAndFiles = imageAndFileService.getAllImageSubtask(task.getProjectId(), taskId);
        view.addObject("listComment", commentService.getAllViewCommentByTaskId(taskId));
        view.addObject("listImages", imageAndFiles);
        view.addObject("task", task);
        view.addObject("mess", mess);
        return view;
    }

    @RequestMapping(value = "/add-task", method = RequestMethod.POST)
    public ModelAndView addTask(HttpServletRequest request, RedirectAttributes redirect) {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        ModelAndView view = new ModelAndView("redirect:/list_task?id=" + projectId);
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }
        Account account = (Account) session.getAttribute("loginUser");

        //get value
        String name = request.getParameter("name");
        int assignId = Integer.parseInt(request.getParameter("assignId"));
        int sectionId = Integer.parseInt(request.getParameter("sectionId"));
        Date startDate = DateUtils.covertStringToDate(request.getParameter("startDate"));
        Date deadline = DateUtils.covertStringToDate(request.getParameter("deadline"));
        if (startDate.before(projectService.getProject(projectId).getStartDate()) || startDate.after(projectService.getProject(projectId).getClosureDate())
                || deadline.before(projectService.getProject(projectId).getStartDate()) || deadline.after(projectService.getProject(projectId).getClosureDate())) {
            redirect.addAttribute("mess", "Thời gian của công việc không hợp lí!");
            return view;
        }

        //decentralize when adding task
        // leader have status 2
        int status = NOT_APPROVED_TASK_STATUS;
        if (account.getRole_id() == LEADER_ROLE) {
            status = PROCESS_TASK_STATUS;
        }

        Task task = new Task(-1, projectId, sectionId, null, account.getId(), assignId, null, name
                , status, startDate, deadline, null, null, 0);

        //add section
        int taskId = taskService.addTask(task);

        //add notification
        //add notification send leader
        String url = HOST + "/" + PROJECT_NAME + "/design/task/view-detail-task?project-id=" + task.getProjectId()
                + "&section-id=" + task.getSectionId() + "&task-id=" + taskId;
        String message = "Bạn có công việc được giao";

        int designId = task.getAssignToId();

        //check notification exits
        NotificationDto notificationDto = notificationService.getNotification(designId, message, url);
        if (ObjectUtils.isEmpty(notificationDto)) {
            Notification notification = new Notification(-1, new java.util.Date()
                    , message, designId, task.getProjectId(), url);
            notificationService.addNotification(notification);
        }

        redirect.addAttribute("mess", "Thêm công việc thành công!");
        return view;
    }

    @RequestMapping(value = "/add-sub-task", method = RequestMethod.POST)
    public ModelAndView addSubTask(HttpServletRequest request, RedirectAttributes redirect) {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        ModelAndView view = new ModelAndView("redirect:/task_detail?taskId=" + taskId);
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }
        Account account = (Account) session.getAttribute("loginUser");

        //get value
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        String name = request.getParameter("name");
        int assignId = Integer.parseInt(request.getParameter("assignTo"));
        int requirementId = Integer.parseInt(request.getParameter("requirementId"));
        int fileNumber = Integer.parseInt(request.getParameter("fileNumber"));
        int sectionId = Integer.parseInt(request.getParameter("sectionId"));
        Date startDate = DateUtils.covertStringToDate(request.getParameter("startDate"));
        Date deadline = DateUtils.covertStringToDate(request.getParameter("deadline"));
        if (startDate.before(taskService.getTaskById(taskId).getStartDate()) || startDate.after(taskService.getTaskById(taskId).getDeadline())
                || deadline.before(taskService.getTaskById(taskId).getStartDate()) || deadline.after(taskService.getTaskById(taskId).getDeadline())){
            redirect.addAttribute("mess", "Thời gian của công việc phụ không hợp lí.");
            return view;
        }
            //decentralize when adding task
            // leader have status 2
            int status = NOT_APPROVED_TASK_STATUS;
        if (account.getRole_id() == LEADER_ROLE) {
            status = PROCESS_TASK_STATUS;
        }

        Task task = new Task(-1, projectId, sectionId, BigInteger.valueOf(taskId), account.getId(), assignId, BigInteger.valueOf(requirementId), name
                , status, startDate, deadline, null, null, fileNumber);

        //add task
        taskService.addTask(task);

        //update number file of task level 2
        Task taskLevel2 = taskService.getTaskByIdFullModel(taskId);
        int fileNumberOld = ObjectUtils.isEmpty(taskLevel2.getFileNumber()) ? 0 : taskLevel2.getFileNumber();
        taskLevel2.setFileNumber(fileNumberOld + fileNumber);
        //update task level 2 deadline is null
        taskLevel2.setEndDate(null);

        taskService.updateTask(taskLevel2);

        //update requirement to status 1 PROCESS_REQUIREMENT_STATUS
        Requirement requirement = requirementService.getRequirementById(requirementId);
        if (requirement.getStatus() == NEW_REQUIREMENT_STATUS) {
            requirement.setStatus(PROCESS_REQUIREMENT_STATUS);
            requirementService.updateRequirement(requirement);
        }
        redirect.addAttribute("mess", "Thêm công việc phụ thành công");
        return view;
    }


    @RequestMapping(value = "/edit-task", method = RequestMethod.GET)
    public ModelAndView viewEditTaskPage(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("leader/editTaskDetail");
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskService.getTaskByIdFullModel(taskId);
        view.addObject("task", task);
        view.addObject("listAccount", accountService.getAccountsByProjectId(task.getProjectId()));
        return view;
    }

    @RequestMapping(value = "/edit-task", method = RequestMethod.POST)
    public ModelAndView viewEditTaskPage(HttpServletRequest request, RedirectAttributes redirect) {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        ModelAndView view = new ModelAndView("redirect:/task_detail?taskId=" + taskId);
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }

        Account account = (Account) session.getAttribute("loginUser");

        //get value
        String name = request.getParameter("name");
        int assignId = Integer.parseInt(request.getParameter("assignId"));
        Date startDate = DateUtils.covertStringToDate(request.getParameter("startDate"));
        Date deadline = DateUtils.covertStringToDate(request.getParameter("deadline"));


        //find by Id
        Task task = taskService.getTaskByIdFullModel(taskId);
        if (startDate.before(projectService.getProject(task.getProjectId()).getStartDate()) || startDate.after(projectService.getProject(task.getProjectId()).getClosureDate())
                || deadline.before(projectService.getProject(task.getProjectId()).getStartDate()) || deadline.after(projectService.getProject(task.getProjectId()).getClosureDate())) {
            redirect.addAttribute("mess", "Thời gian của công việc không hợp lí!");
            return view;
        }
        task.setTaskName(name);
        task.setAssignToId(assignId);
        task.setStartDate(startDate);
        task.setDeadline(deadline);

        //update
        taskService.updateTask(task);
        redirect.addAttribute("mess", "Cập nhật công việc thành công.");

        return view;
    }

    @RequestMapping(value = "task/change-status", method = RequestMethod.GET)
    public ModelAndView changeStatusTask(HttpServletRequest request, RedirectAttributes redirect) {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        ModelAndView view = new ModelAndView("redirect:/task_detail?taskId=" + taskId);
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }
        Task task = taskService.getTaskByIdFullModel(taskId);
        // agree or cancel
        String operation = request.getParameter("operation");
        int status = PROCESS_TASK_STATUS;
        if (operation.equals("agree")) {
            status = COMPLETE_TASK_STATUS;
            //set end date of sub-task when complete
            task.setEndDate(new Date());
        }
        // update
        if (!ObjectUtils.isEmpty(request.getParameter("description"))) {
            task.setDescription(request.getParameter("description"));
        }

        task.setTaskStatus(status);
        taskService.updateTask(task);

        //check last sub-task
        if (taskService.isLastTask(task)) {
            //update end date for task
            Task taskLevel2 = taskService.getTaskById(task.getTaskfId().intValue());
            taskLevel2.setEndDate(new Date());
            taskService.updateTask(taskLevel2);

        }

        //add notification to design
        //find design
        int design = task.getAssignToId();

        //add notification send leader
        String url = HOST + "/" + PROJECT_NAME + "/design/sub-task/view-sub-task-detail?project-id=" + task.getProjectId() + "&section-id=" + task.getSectionId() + "&task-id=" + task.getTaskfId() + "&sub-task-id=" + task.getTaskId();
        String message = "Sub-task của bạn không được phê duyệt và trở về trạng thái đang thực hiện";
        if (operation.equals("agree")) {
            message = "Sub-task của bạn được phê duyệt và đã hoàn thành";

        }
        Notification notification = new Notification(-1, new java.util.Date(), message, design, task.getProjectId(), url);
        notificationService.addNotification(notification);

        redirect.addAttribute("mess", "" + operation + " Công việc đã hoàn thành ");

        return view;
    }

    @RequestMapping(value = "/task/my-task-for-leader", method = RequestMethod.GET)
    public ModelAndView viewMyTask(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("leader/my_task");
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            view = new ModelAndView("/login");
            redirect.addAttribute("mess", "Please login");
            return view;
        }

        Account a = (Account) session.getAttribute("loginUser");

        String textSearch = request.getParameter("textSearch");
        String indexPage = request.getParameter("pageNo");

        int page = 0;
        if (indexPage != null) {
            page = Integer.parseInt(indexPage);
        }

        int totalMyTask = taskService.getTotalAllMyTaskLeader(a.getId(), textSearch);
        int totalPages = (totalMyTask % 10 == 0) ? totalMyTask / 10 : totalMyTask / 10 + 1;

        List<MyTaskDto> myTaskDtoList = taskService.getAllMyTaskLeader(a.getId(), page, textSearch);
        List<Project> projectList = projectService.getProjectByLeaderAcc(a.getId());
        List<Integer> lsPage = new ArrayList<>();
        // for này có chức năng hiển thị list page
        for (int i = 1; i <= totalPages; ++i) {
            lsPage.add(i);
        }

        view.addObject("projectList", projectList);
        view.addObject("myTask", myTaskDtoList);
        view.addObject("lsPage", lsPage);
        view.addObject("page", page);
        return view;
    }

    @RequestMapping(value = "/task/addTaskofLeader", method = RequestMethod.POST)
    public ModelAndView addTaskofLeader(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("redirect:/task/my-task-for-leader");
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            view = new ModelAndView("/login");
            redirect.addAttribute("mess", "Please login");
            return view;
        }
        Account a = (Account) session.getAttribute("loginUser");
        String name = request.getParameter("taskName");
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        Date startDate = DateUtils.covertStringToDate(request.getParameter("startDate"));
        Date deadline = DateUtils.covertStringToDate(request.getParameter("deadline"));
        if (startDate.before(projectService.getProject(projectId).getStartDate()) || startDate.after(projectService.getProject(projectId).getClosureDate())
                || deadline.before(projectService.getProject(projectId).getStartDate()) || deadline.after(projectService.getProject(projectId).getClosureDate())) {
            redirect.addAttribute("mess", "Thời gian của công việc không hợp lí!");
            return view;
        }
        taskService.addTaskeofLeader(projectId, a.getId(), a.getId(), name, startDate, deadline);
        return view;
    }

    @RequestMapping(value = "/sub-task/delete", method = RequestMethod.GET)
    public ModelAndView deleteSubTask(HttpServletRequest request, RedirectAttributes redirect) {
        int subTaskId = Integer.parseInt(request.getParameter("subTaskId"));
        Task task = taskService.getTaskById(subTaskId);

        task.setTaskStatus(6);
        taskService.updateTask(task);

        redirect.addAttribute("mess", "Xóa sub task thành công!");
        return  new ModelAndView("redirect:/task_detail?taskId="+task.getTaskfId());
    }

    @RequestMapping(value = "/task/delete", method = RequestMethod.GET)
    public ModelAndView deleteTask(HttpServletRequest request, RedirectAttributes redirect) {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskService.getTaskByIdFullModel(taskId);

        task.setTaskStatus(6);
        taskService.updateTask(task);

        //delete list sub task
        for(Task subTask : task.getListSubTask()){
            subTask.setTaskStatus(6);
            taskService.updateTask(subTask);
        }

        redirect.addAttribute("mess", "Xóa task thành công!");
        return  new ModelAndView("redirect:/list_task?id="+task.getProjectId());
    }
}
