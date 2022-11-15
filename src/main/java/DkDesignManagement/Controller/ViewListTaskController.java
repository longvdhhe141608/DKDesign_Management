package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Section;
import DkDesignManagement.Entity.Task;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class ViewListTaskController {

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


    @RequestMapping(value = "/list_task", method = RequestMethod.GET)
    public ModelAndView viewListTask(@ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("list_task");
        view.addObject("listBigTask", sectionService.getAll());
        view.addObject("listProject", projectService.getProject());
        view.addObject("listAccount", accountService.getAccounts());
        view.addObject("listRequirement", requirementService.getAll());
        view.addObject("mess", mess);
        return view;
    }

    @RequestMapping(value = "/add_section", method = RequestMethod.POST)
    public ModelAndView addSection(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("redirect:/list_task");
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }
        Account account = (Account) session.getAttribute("loginUser");

        //get value
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int projectId = Integer.parseInt(request.getParameter("projectId"));

        Section section = new Section(-1, name, description, projectId, account.getId());

        //add section
        sectionService.addSection(section);
        redirect.addAttribute("mess", "add successfully ");
        return view;
    }

    @RequestMapping(value = "/add-task", method = RequestMethod.POST)
    public ModelAndView addTask(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("redirect:/list_task");
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }
        Account account = (Account) session.getAttribute("loginUser");

        //get value
        String name = request.getParameter("name");
        int requirementId = Integer.parseInt(request.getParameter("requirementId"));
        int assignId = Integer.parseInt(request.getParameter("assignId"));
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        int sectionId = Integer.parseInt(request.getParameter("sectionId"));
        Date startDate = DateUtils.covertStringToDate(request.getParameter("startDate"));
        Date deadline = DateUtils.covertStringToDate(request.getParameter("deadline"));
        String description = request.getParameter("description");

        Task task = new Task(-1, projectId, sectionId, null, account.getId(), assignId, requirementId, name
                , 1, startDate, deadline, null, description, 0);

        //add section
        taskService.addTask(task);
        redirect.addAttribute("mess", "add successfully ");
        return view;
    }

}
