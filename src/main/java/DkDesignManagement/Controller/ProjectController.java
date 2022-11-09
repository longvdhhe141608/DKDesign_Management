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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;
import java.util.Date;

@Controller
public class ProjectController {

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/allProject", method = RequestMethod.GET)
    public ModelAndView loadAllProject(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("allProject");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");
        String textSearch = request.getParameter("textSearch");
        String option = request.getParameter("option");
        view.addObject("listAllProject", projectDao.getAllProjectByAcc(account.getId(), textSearch, option));
        view.addObject("listCategory", categoryService.getAllCategory());
        view.addObject("mess", mess);
        return view;
    }

    @RequestMapping(value = "/allProject/add", method = RequestMethod.POST)
    public ModelAndView loadAllProject(HttpServletRequest request, RedirectAttributes redirect) {
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

        //create model
        Project project = new Project(-1, name, startDate, closureDate, null
                , account.getId(), categoryId, customerName, address, phone, detail, 1, constructionArea);

        //add
        int id = projectService.addProject(project, account);
        if (id != 1) {
            redirect.addAttribute("mess", "add fail");
            return view;
        }


        redirect.addAttribute("mess", "add successfully ");

        return view;
    }
}
