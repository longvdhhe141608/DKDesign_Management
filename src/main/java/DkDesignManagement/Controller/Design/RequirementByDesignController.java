package DkDesignManagement.Controller.Design;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Requirement;
import DkDesignManagement.Entity.RevisionHistory;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Repository.RequirementDao;
import DkDesignManagement.Service.HistoryService;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.Service.RequirementService;
import DkDesignManagement.model.RequirementPageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
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

    @Autowired
    HistoryService historyService;

    @GetMapping("/view-requirement")
    public ModelAndView viewRequirement(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("design/requirement");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectService.getProject(projectID);

        int page = 1;
        if (!ObjectUtils.isEmpty(request.getParameter("page"))) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        RequirementPageResponse requirementPageResponse = requirementService.getPaginationRequirementByProjectID(page,projectID);
        List<Requirement> requirements = requirementPageResponse.getRequirementList();

        List<RevisionHistory> listHistory = new ArrayList<RevisionHistory>();
        //check and update status
        for (Requirement requirement : requirements) {
            requirement.setStatus(requirementService.checkAndUpdaterRequirementDone(requirement));
            listHistory.addAll(historyService.getAlLRevisionHistoryOfTable(requirement.getId(), "requirement"));
        }

        view.addObject("requirements", requirements);
        view.addObject("project", project);
        view.addObject("page", page);
        view.addObject("endPage", requirementPageResponse.getEndPage());
        view.addObject("projectId", projectID);
        view.addObject("listHistory", listHistory);
        return view;
    }
}
