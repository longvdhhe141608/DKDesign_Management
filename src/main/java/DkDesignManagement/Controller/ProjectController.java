package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Section;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Service.CategoryService;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.Service.SectionService;
import DkDesignManagement.Service.TaskService;
import DkDesignManagement.model.ProjectPageResponse;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping(value = "/allProject")
public class ProjectController {

    @Autowired
    private ProjectService projectService;
    @Autowired
    private CategoryService categoryService;

    @Autowired
    SectionService sectionService;

    @Autowired
    TaskService taskService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView loadAllProject(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("leader/allProject");
        HttpSession session = request.getSession();

        int page = 1;
        if (!ObjectUtils.isEmpty(request.getParameter("page"))) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        Account account = (Account) session.getAttribute("loginUser");
        String textSearch = request.getParameter("textSearch");
        String date = request.getParameter("date");

        ProjectPageResponse projectPageResponse = projectService.getAllProjectByAcc(account.getId(), textSearch, date, page);

        view.addObject("listAllProject", projectPageResponse.getProjectList());
        view.addObject("listCategory", categoryService.getAllCategory());
        view.addObject("page", page);
        view.addObject("endPage", projectPageResponse.getEndPage());
        view.addObject("mess", mess);
        view.addObject("date", date);
        view.addObject("textSearch", textSearch);
        return view;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addNewProject(HttpServletRequest request, RedirectAttributes redirect) {

        ModelAndView view = new ModelAndView("redirect:/allProject");

        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }

        Account account = (Account) session.getAttribute("loginUser");

        //get value
        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Date startDate = DateUtils.covertStringToDate(request.getParameter("startDate"));
        Date closureDate = DateUtils.covertStringToDate(request.getParameter("closureDate"));
        String customerName = request.getParameter("customerName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String detail = request.getParameter("detail");
        Long constructionArea = Long.parseLong(request.getParameter("constructionArea"));
        Long expectedCost = Long.parseLong(request.getParameter("expectedCost"));

        //create model
        Project project = new Project(-1, name, startDate, closureDate, null
                , account.getId(), categoryId, customerName, address, phone, detail, 1, constructionArea, expectedCost);

        //add
        int id = projectService.addProject(project, account);
        if (id != 1) {
            redirect.addAttribute("mess", "add fail");
            return view;
        }
        redirect.addAttribute("mess", "add successfully ");
        return view;
    }

    @RequestMapping(value = "/delete_project", method = RequestMethod.GET)
    public ModelAndView deleteProject(HttpServletRequest request, RedirectAttributes redirect) {
        //delete project
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        Project project = projectService.getProject(projectId);
        project.setStatus(4);//delete project status
        projectService.editProject(project);

        //delete section by project
        List<Section> listSections = sectionService.getAllSectionByProjectID(projectId);
        for (Section section : listSections) {
            section.setStatus(3);//status section delete
            sectionService.updateSection(section);
        }

        //delete all task by project
        List<Task> listTask = taskService.getAllTaskByProjectId(projectId);
        for (Task task : listTask) {
            task.setTaskStatus(6);//status task delete
            taskService.updateTask(task);
        }


        redirect.addAttribute("mess", "delete project successfully ");
        return new ModelAndView("redirect:/allProject");
    }

}
