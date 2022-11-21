package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Section;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.*;
import DkDesignManagement.utils.DateUtils;
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
import java.util.Date;

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
    private ProjectDao projectDao;

    @Autowired
    CommentService commentService;

    @RequestMapping(value = "/list_task", method = RequestMethod.GET)
    public ModelAndView viewListTask(@ModelAttribute("mess") String mess, HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectDao.getProject(id);

        ModelAndView view = new ModelAndView("list_task");
        view.addObject("project", project);
        view.addObject("listBigTask", sectionService.getAll(id));
        view.addObject("listAccount", accountService.getAccountsByProjectId(id));
        view.addObject("listTaskLevel2", taskService.getListTask());
        view.addObject("mess", mess);
        return view;
    }

    @RequestMapping(value = "/task_detail", method = RequestMethod.GET)
    public ModelAndView viewTaskDetail(HttpServletRequest request, @ModelAttribute("mess") String mess, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("/task_detail");
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            view = new ModelAndView("redirect:/login");
            return view;
        }
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskService.getTaskById(taskId);
        //check sub task
        if (task.getTaskfId() != null) {
            view = new ModelAndView("redirect:/subtask?taskId=" + taskId);
            return view;
        }
        //check and update task level 2 100%
        //update done
        task.setTaskStatus(taskService.checkAndUpdateTaskDone(task));


        //load infor add sub task
        view.addObject("listAccount", accountService.getAccountsByProjectId(task.getProjectId()));
        view.addObject("listRequirement", requirementService.getRequirementByProjectId(task.getProjectId()));

        view.addObject("listComment", commentService.getAllCommentsByTaskId(taskId));
        view.addObject("task", task);
        view.addObject("mess", mess);
        return view;
    }

    @RequestMapping(value = "/subtask", method = RequestMethod.GET)
    public ModelAndView viewSubTaskDetail(HttpServletRequest request, @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("subtask");
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskService.getTaskById(taskId);
        view.addObject("listComment", commentService.getAllCommentsByTaskId(taskId));
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


        Task task = new Task(-1, projectId, sectionId, null, account.getId(), assignId, null, name
                , 1, startDate, deadline, null, null, 0);

        //add section
        taskService.addTask(task);
        redirect.addAttribute("mess", "add successfully ");
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


        Task task = new Task(-1, projectId, sectionId, BigInteger.valueOf(taskId), account.getId(), assignId, BigInteger.valueOf(requirementId), name
                , 1, startDate, deadline, null, null, fileNumber);

        //add task
        taskService.addTask(task);
        //update number file of task level 2
        Task taskLevel2 = taskService.getTaskById(taskId);
        int fileNumberOld = ObjectUtils.isEmpty(taskLevel2.getFileNumber()) ? 0 : taskLevel2.getFileNumber();
        taskLevel2.setFileNumber(fileNumberOld + fileNumber);
        taskService.updateTask(taskLevel2);

        redirect.addAttribute("mess", "add sub task successfully ");
        return view;
    }


    @RequestMapping(value = "/edit-task", method = RequestMethod.GET)
    public ModelAndView viewEditTaskPage(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("editTaskDetail");
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskService.getTaskById(taskId);
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
        int fileNumber = Integer.parseInt(request.getParameter("fileNumber"));

        Date startDate = DateUtils.covertStringToDate(request.getParameter("startDate"));
        Date deadline = DateUtils.covertStringToDate(request.getParameter("deadline"));

        //find by Id
        Task task = taskService.getTaskById(taskId);
        task.setTaskName(name);
        task.setAssignToId(assignId);
        task.setFileNumber(fileNumber);
        task.setStartDate(startDate);
        task.setDeadline(deadline);

        //update
        taskService.updateTask(task);
        redirect.addAttribute("mess", "update task successfully ");

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

        // agree or cancel
        String operation = request.getParameter("operation");
        int status = 5;
        if (operation.equals("agree")) {
            status = 4;
        }

        // update
        Task task = taskService.getTaskById(taskId);
        task.setTaskStatus(status);
        taskService.updateTask(task);

        redirect.addAttribute("mess", "" + operation + " task successfully ");

        return view;
    }
}
