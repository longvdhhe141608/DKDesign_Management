package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.MemberDAO;
import DkDesignManagement.Repository.ProjectDao;
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
@RequestMapping(value = "/project")
public class MemberController {

    @Autowired
    private MemberDAO memberDAO;
    @Autowired
    private ProjectDao projectDao;

    @RequestMapping(value = "/member", method = RequestMethod.GET)
    public ModelAndView LoadMember(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView view = new ModelAndView("member");
        int id = Integer.parseInt(request.getParameter("id"));

        Project project = projectDao.getProject(id);
        List<Member> memberList = new ArrayList<Member>();
        memberList = memberDAO.getMemberInProject(id);

        view.addObject("project", project);

        view.addObject("memberList", memberList);

        return view;
    }
}
