package DkDesignManagement.Controller.Design;

import DkDesignManagement.Entity.*;
import DkDesignManagement.Repository.*;
import DkDesignManagement.Service.CloudinaryService;
import DkDesignManagement.model.TaskWaitDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/design/sub-task")
public class SubTaskByDesignController {

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private SectionDAO sectionDao;

    @Autowired
    private TaskDAO taskDAO;

    @Autowired
    private ImageAndFileDao imageAndFileDao;

    @Autowired
    private RequirementDao requirementDao;

    @Autowired
    private StatusDao statusDao;

    @Autowired
    private CloudinaryService cloudinary;

    @RequestMapping(value = "/view-sub-task-detail", method = RequestMethod.GET)
    public ModelAndView viewListTask(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("design/sub-task-design");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectDao.getProject(projectID);

        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        Section section = sectionDao.getOneSectionBySectionID(sectionID);

        int taskID = Integer.parseInt(request.getParameter("task-id"));
        Tasks tasks = taskDAO.getOneTasksByTaskID(taskID);
        List<Tasks> subTasksList = taskDAO.getAllSubTasksByProjectIDAndSectionIDAndTaskID(project.getId(), section.getSectionId(), tasks.getId());

        int subTaskID = Integer.parseInt(request.getParameter("sub-task-id"));
        Tasks subtask = taskDAO.getOneSubTaskBySubTaskID(subTaskID, tasks.getId());

        int totalFile = imageAndFileDao.getTotalFileBySubTaskID(project.getId(), subtask.getId());

        float progressPercent = Math.round((totalFile / (1.0 * subtask.getNumberOfFile())) * 100);

        view.addObject("project", project);
        view.addObject("tasks", tasks);
        view.addObject("section", section);
        view.addObject("subTasksList", subTasksList);
        view.addObject("subTask", subtask);
        view.addObject("progressPercent", progressPercent);
        view.addObject("totalFile", totalFile);
        view.addObject("status", 0);
        String mess = request.getParameter("mess");
        view.addObject("mess", mess);

        return view;
    }

    @RequestMapping(value = "/update-file-sub-task", method = RequestMethod.POST)
    public ModelAndView updateFileSubTaskByDesign(HttpServletRequest request,
                                                  @RequestParam("file") List<MultipartFile> file)
            throws ServletException, IOException {
        ModelAndView view = new ModelAndView("redirect:/design/sub-task/view-sub-task-detail");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectDao.getProject(projectID);

        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        Section section = sectionDao.getOneSectionBySectionID(sectionID);

        int taskID = Integer.parseInt(request.getParameter("task-id"));
        Tasks tasks = taskDAO.getOneTasksByTaskID(taskID);

        int subTaskID = Integer.parseInt(request.getParameter("sub-task-id"));
        Tasks subtask = taskDAO.getOneSubTaskBySubTaskID(subTaskID, tasks.getId());

        file.forEach(f -> {
            String url = null;
            try {
                url = cloudinary.uploadFile(f, "default", "image");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            if (ObjectUtils.isEmpty(url)) {
                request.setAttribute("mess", "upload fail");
                view.addObject("status", 2);
            } else {
                int checkSaveFile = imageAndFileDao.updateFileBySubTaskID(url, project.getId(), subtask.getId());
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
        Account account = (Account) session.getAttribute("account");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectDao.getProject(projectID);

        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        Section section = sectionDao.getOneSectionBySectionID(sectionID);

        int taskID = Integer.parseInt(request.getParameter("task-id"));
        Tasks tasks = taskDAO.getOneTasksByTaskID(taskID);
        List<Tasks> subTasksList = taskDAO.getAllSubTasksByProjectIDAndSectionIDAndTaskID(project.getId(), section.getSectionId(), tasks.getId());

        int subTaskID = Integer.parseInt(request.getParameter("sub-task-id"));
        Tasks subtask = taskDAO.getOneSubTaskBySubTaskID(subTaskID, tasks.getId());

        List<Requirement> requirements = requirementDao.getAllRequirementByProjectID(project.getId());


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
        Account account = (Account) session.getAttribute("account");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectDao.getProject(projectID);

        int sectionID = Integer.parseInt(request.getParameter("section-id"));
        Section section = sectionDao.getOneSectionBySectionID(sectionID);

        int taskID = Integer.parseInt(request.getParameter("task-id"));
        Tasks tasks = taskDAO.getOneTasksByTaskID(taskID);

        int subTaskID = Integer.parseInt(request.getParameter("sub-task-id"));
        Tasks subtask = taskDAO.getOneSubTaskBySubTaskID(subTaskID, tasks.getId());

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

        int checkEdit = taskDAO.updateSubTaskByDesign(subtask.getId(), editSubTask);

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
        Account account = (Account) session.getAttribute("account");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectDao.getProject(projectID);

        String indexPage = request.getParameter("pageNo");

        int page = 0;
        if (indexPage != null) {
            page = Integer.parseInt(indexPage);
        }


        String statusID = (request.getParameter("status"));

        String textSearch = request.getParameter("textSearch");

        int totalSubTaskWait = taskDAO.totalTaskWait(project.getId(), statusID, textSearch);
        int totalPages = (totalSubTaskWait % 10 == 0) ? totalSubTaskWait / 10 : totalSubTaskWait / 10 + 1;

        List<TaskWaitDto> waitDtoList = taskDAO.getAllTaskWaitByDesign(project.getId(), page, statusID, textSearch);

        List<Integer> lsPage = new ArrayList<>();
        // for này có chức năng hiển thị list page
        for (int i = 1; i <= totalPages; ++i) {
            lsPage.add(i);
        }

        List<Status> statusList = statusDao.getAllStatus();

        view.addObject("project", project);
        view.addObject("lsPage", lsPage);
        view.addObject("waitDtoList", waitDtoList);
        view.addObject("statusList", statusList);
        view.addObject("status", statusID);

        return view;
    }
}
