package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.CategoryService;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class EditSummaryController {

    @Autowired
    ProjectDao projectDao;

    @Autowired
    ProjectService projectService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/edit_summary", method = RequestMethod.GET)
    public ModelAndView viewSummary(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("edit_summary");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectDao.getProject(id);
        request.setAttribute("project", project);
        view.addObject("listCategory", categoryService.getAllCategory());

        return view;
    }

    @RequestMapping(value = "/edit_summary/edit_project", method = RequestMethod.POST)
    public ModelAndView editSummary(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("redirect:/project/summary");
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }

        Account account = (Account) session.getAttribute("loginUser");
        //get value
        int id = Integer.parseInt(request.getParameter("idProject"));
        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Date startDate = DateUtils.covertStringToDate(request.getParameter("startDate"));
        Date closureDate = DateUtils.covertStringToDate(request.getParameter("closureDate"));
        Date endDate = DateUtils.covertStringToDate(request.getParameter("endDate"));
        String customerName = request.getParameter("customerName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String detail = request.getParameter("detail");
        Long constructionArea = Long.parseLong(request.getParameter("constructionArea"));
        Long expectedCost = Long.parseLong(request.getParameter("expectedCost"));
        int status = Integer.parseInt(request.getParameter("status"));

        //create model
        Project project = new Project(id, name, startDate, closureDate, endDate
                , account.getId(), categoryId, customerName, address, phone, detail, status, constructionArea,expectedCost);

        //add
        int statusEdit = projectService.editProject(project);
        if (statusEdit != 1) {
            redirect.addAttribute("id",id);
            redirect.addAttribute("mess", "edit fail");
            return view;
        }
        redirect.addAttribute("id",id);
        redirect.addAttribute("mess", "edit successfully ");

        return view;
    }
}
