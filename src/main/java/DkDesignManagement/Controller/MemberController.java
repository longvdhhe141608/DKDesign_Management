package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.MemberDao;
import DkDesignManagement.Repository.ProjectDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping(value = "/project")
public class MemberController {

    @Autowired
    private MemberDao memberDAO;
    @Autowired
    private ProjectDao projectDao;

    @RequestMapping(value = "/member", method = RequestMethod.GET)
    public ModelAndView LoadMember(HttpServletRequest request, @RequestParam("id") int projectid) {

        ModelAndView view = new ModelAndView("member");
        int id = projectid;

        Project project = projectDao.getProject(id);
        List<Member> memberList = memberDAO.getMemberInProject(id);

        view.addObject("project", project);
        view.addObject("memberList", memberList);

        return view;
    }

    @RequestMapping(value = "/searchMemberInProject", method = RequestMethod.GET)
    public ModelAndView loadMemberAminSearchingPage(HttpServletRequest request, @RequestParam("id") int projectid) {
        ModelAndView view = new ModelAndView("member");
        int id = projectid;
        Project project = projectDao.getProject(id);

        int role = Integer.parseInt(request.getParameter("roleSearch"));
        String name = request.getParameter("nameSearch");

        List<Member> memberList = memberDAO.searchMemberInProject(projectid, role, name);
        view.addObject("memberList", memberList);
        view.addObject("project", project);
        view.addObject("roleSearch", role);
        view.addObject("nameSearch", name);
        return view;
    }

    @RequestMapping(value = "/addMember", method = RequestMethod.GET)
    public ModelAndView addMemberToProject(HttpServletRequest request, @RequestParam("id") int projectId) {
        ModelAndView view = new ModelAndView("member");

        String username = request.getParameter("memberToAdd");
        int memberId = memberDAO.getAccountIdByUsername(username);

        try {
            memberDAO.addMemberToProject(projectId, memberId);
        } catch (Exception e) {

        }

        Project project = projectDao.getProject(projectId);
        List<Member> memberList = memberDAO.getMemberInProject(projectId);
        view.addObject("memberList", memberList);
        view.addObject("project", project);
        return view;
    }

    @RequestMapping(value = "/changeMemberStatus", method = RequestMethod.GET)
    public ModelAndView changeMemberStatus(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("member");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectDao.getProject(id);

        int status = Integer.parseInt(request.getParameter("status"));
        String username = request.getParameter("username");
        int memberId = memberDAO.getAccountIdByUsername(username);

        memberDAO.updateStatusMemberInProject(id,memberId,status);
        List<Member> memberList = memberDAO.getMemberInProject(id);

        view.addObject("project", project);
        view.addObject("memberList", memberList);
        return view;
    }
}
