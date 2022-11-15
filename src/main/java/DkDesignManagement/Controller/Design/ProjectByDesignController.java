package DkDesignManagement.Controller.Design;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.CategoryService;
import DkDesignManagement.Service.ProjectService;
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
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/design/project")
public class ProjectByDesignController {

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private CategoryService categoryService;


    @RequestMapping(value = "/view-all-project", method = RequestMethod.GET)
    public ModelAndView loadAllProject(HttpServletRequest request,
                                       HttpServletResponse response,
                                       @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("design/allProject");
        HttpSession session = request.getSession();

        String indexPage = request.getParameter("pageNo");
        int page = 0;
        if (indexPage != null) {
            page = Integer.parseInt(indexPage);
        }


        Account account = (Account) session.getAttribute("loginUser");
        String textSearch = request.getParameter("textSearch");
        String date = request.getParameter("date");

        int totalProject = projectDao.getSizeProjectByAcc(account.getId(), textSearch, date);
        int totalPage = (totalProject % 10 == 0) ? totalProject / 10 : totalProject / 10 + 1;
        List<Integer> lsPage = new ArrayList<>();
        // for này có chức năng hiển thị list page
        for (int i = 1; i <= totalPage; ++i) {
            lsPage.add(i);
        }

        view.addObject("listAllProject", projectDao.getAllProjectByAcc(account.getId(), textSearch, date, page));
        view.addObject("listCategory", categoryService.getAllCategory());
        view.addObject("totalProject", totalProject);
        view.addObject("lsPage", lsPage);
        view.addObject("mess", mess);
        view.addObject("status", 0);
        return view;
    }

    @RequestMapping(value = "/summary", method = RequestMethod.GET)
    public ModelAndView projectDetail(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("design/summary");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectDao.getProject(id);
        HttpSession session = request.getSession();
        session.setAttribute("project", project);
        view.addObject("project", project);
        return view;
    }

}
