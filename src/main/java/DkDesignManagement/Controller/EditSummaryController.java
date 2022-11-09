package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class EditSummaryController {

    @Autowired
    ProjectDao projectDao;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/edit_summary", method = RequestMethod.GET)
    public ModelAndView editSummary(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("edit_summary");
        int id =Integer.parseInt(request.getParameter("id")) ;
        Project project =projectDao.getProject(id);
        request.setAttribute("profile", project);
        view.addObject("listCategory", categoryService.getAllCategory());

        return view;
    }
}
