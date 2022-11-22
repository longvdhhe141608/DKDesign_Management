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
import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping(value = "/requirement-for-leader", method = RequestMethod.GET)
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

    @RequestMapping(value = "/add-new-requirement", method = RequestMethod.POST)
    public ModelAndView insertRequirement(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view;
        int projectID = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("ten-vi-tri").trim();
        String detail = request.getParameter("noi-dung-yeu-cau").trim();
        Requirement requirement = Requirement.builder()
                .projectId(projectID)
                .requirementName(name)
                .requirementDetail(detail)
                .status(4)
                .build();
        int saveRequirement = requirementDao.insertRequirement(requirement);
        if (saveRequirement == 0) {
            view = new ModelAndView("redirect:/requirement/requirement-for-leader");
            view.addObject("mess", "Save failed");
        } else {
            view = new ModelAndView("redirect:/requirement/requirement-for-leader");
            view.addObject("mess", "Save success");
        }
        view.addObject("id", projectID);
        return view;
    }

    @RequestMapping("/delete-requirement-by-leader")
    public ModelAndView deleteRequirement(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view;
        int requirementID = Integer.parseInt(request.getParameter("requirement-id"));
        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Requirement requirement = requirementDao.getRequirementById(requirementID);
        int delete = requirementDao.deleteRequirement(requirement);
        if (delete == 0) {
            view = new ModelAndView("redirect:/requirement/requirement-for-leader");
            view.addObject("mess", "Delete failed");
        } else {
            view = new ModelAndView("redirect:/requirement/requirement-for-leader");
            view.addObject("mess", "Delete success");
        }
        view.addObject("id", projectID);
        return view;
    }
}
