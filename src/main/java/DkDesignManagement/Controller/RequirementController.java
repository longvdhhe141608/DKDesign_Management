package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Requirement;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Repository.RequirementDao;
import DkDesignManagement.Service.RequirementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/requirement")
public class RequirementController {

    @Autowired
    private RequirementDao requirementDao;

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private RequirementService requirementService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView viewRequirement(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("requirement");

        int projectID = Integer.parseInt(request.getParameter("id"));
        Project project = projectDao.getProject(projectID);

        String indexPage = request.getParameter("pageNo");
        int page = 0;
        if (indexPage != null) {
            page = Integer.parseInt(indexPage);
        }

        int totalRequirement = requirementDao.getAllRequirementByProjectID(projectID).size();
        int totalPages = (totalRequirement % 10 == 0) ? totalRequirement / 10 : totalRequirement / 10 + 1;

        List<Requirement> requirements = requirementDao.getPaginationRequirementByProjectID(projectID, page);
        //check and update status
        for (Requirement requirement : requirements) {
            requirement.setStatus(requirementService.checkAndUpdaterRequirementDone(requirement));
        }

        List<Integer> lsPage = new ArrayList<>();
        // for này có chức năng hiển thị list page
        for (int i = 1; i <= totalPages; ++i) {
            lsPage.add(i);
        }

        view.addObject("requirements", requirements);
        view.addObject("lsPage", lsPage);
        view.addObject("project", project);
        return view;
    }


}
