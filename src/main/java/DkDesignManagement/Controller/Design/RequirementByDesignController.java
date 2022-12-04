package DkDesignManagement.Controller.Design;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Requirement;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Repository.RequirementDao;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.Service.RequirementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/design/requirement")
public class RequirementByDesignController {

    @Autowired
    private RequirementService requirementService;

    @Autowired
    private ProjectService projectService;

    @GetMapping("/view-requirement")
    public ModelAndView viewRequirement(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("design/requirement");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectService.getProject(projectID);

        String indexPage = request.getParameter("pageNo");
        int page = 1;
        if (indexPage != null) {
            page = Integer.parseInt(indexPage);
        }

        int index = page * 10 - 10;

        int totalRequirement = requirementService.getAllRequirementByProjectID(projectID).size();
        int totalPages = (totalRequirement % 10 == 0) ? totalRequirement / 10 : totalRequirement / 10 + 1;

        List<Requirement> requirements = requirementService.getPaginationRequirementByProjectID(projectID, index);

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
