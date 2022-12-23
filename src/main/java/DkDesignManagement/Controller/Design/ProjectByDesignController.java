package DkDesignManagement.Controller.Design;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.ImageAndFile;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Roles;
import DkDesignManagement.Repository.RoleDao;
import DkDesignManagement.Service.*;
import DkDesignManagement.Model.MemberActiveDto;
import DkDesignManagement.Model.ProjectPageResponse;
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
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/design/project")
public class ProjectByDesignController {
    @Autowired
    private ProjectService projectService;

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProjectParticipationService projectParticipationService;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    HistoryService historyService;

    @Autowired
    private ImageAndFileService imageAndFileService;

    @RequestMapping(value = "/view-all-project", method = RequestMethod.GET)
    public ModelAndView loadAllProject(HttpServletRequest request,
                                       HttpServletResponse response,
                                       @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("design/allProject");
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

    @RequestMapping(value = "/summary", method = RequestMethod.GET)
    public ModelAndView projectDetail(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("design/summary");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectService.getProject(id);
        HttpSession session = request.getSession();

        List<ImageAndFile> imageAndFiles = imageAndFileService.getAllImageSummary(id);

        view.addObject("listImage", imageAndFiles);
        System.out.println(imageAndFiles.size() + "ssssssssssssssssssssssssss");
        session.setAttribute("project", project);
        view.addObject("project", project);
        view.addObject("listHistory", historyService.getAlLRevisionHistoryOfTable(project.getId(), "project",project.getId()));
        return view;
    }

    @RequestMapping(value = "/member-active", method = RequestMethod.GET)
    public ModelAndView getAllMemberActiveByProjectID(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("design/member-active");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectService.getProject(projectID);

        String indexPage = request.getParameter("pageNo");
        int page = 1;
        if (indexPage != null) {
            page = Integer.parseInt(indexPage);
        }

        int index = page * 10 - 10;

        String roleID = (request.getParameter("role"));
        String textSearch = request.getParameter("textSearch");

        int totalMember = projectParticipationService.totalAllMember(project.getId(), roleID, textSearch);
        int totalPages = (totalMember % 10 == 0) ? totalMember / 10 : totalMember / 10 + 1;

        List<MemberActiveDto> memberActiveDtos = projectParticipationService.getAllMember(project.getId(), index, roleID, textSearch);

        List<Integer> lsPage = new ArrayList<>();
        // for này có chức năng hiển thị list page
        for (int i = 1; i <= totalPages; ++i) {
            lsPage.add(i);
        }

        List<Roles> roles = roleDao.getAllRole();

        view.addObject("project", project);
        view.addObject("memberActiveDtos", memberActiveDtos);
        view.addObject("lsPage", lsPage);
        view.addObject("roles", roles);
        view.addObject("page", page);
        view.addObject("role", roleID);
        view.addObject("textSearch", textSearch);
        return view;
    }

    @RequestMapping(value = "/member-active-search", method = RequestMethod.GET)
    public ModelAndView searchMemberActiveByProjectID(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("redirect:/design/project/member-active");

        int projectID = Integer.parseInt(request.getParameter("project-id"));
        Project project = projectService.getProject(projectID);

        String indexPage = request.getParameter("pageNo");
        int page = 0;
        if (indexPage != null) {
            page = Integer.parseInt(indexPage);
        }

        String roleID = (request.getParameter("role"));
        String textSearch = request.getParameter("textSearch");

        view.addObject("project-id", projectID);
        view.addObject("pageNo", page);
        view.addObject("role", roleID);
        view.addObject("textSearch", textSearch);

        return view;
    }
}
