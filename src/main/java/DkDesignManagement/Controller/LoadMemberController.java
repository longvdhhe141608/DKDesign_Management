package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.Repository.MemberDAO;
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
@RequestMapping(value = "/")
public class LoadMemberController {

    @Autowired
    private MemberDAO memberDAO;

    @RequestMapping(value = "/member", method = RequestMethod.GET)
    public ModelAndView LoadMember(HttpServletRequest request, HttpServletResponse response) {


        List<Member> memberList = new ArrayList<>();

        memberList = memberDAO.getMemberInProject(1);

        request.setAttribute("memberList", memberList);

        return new ModelAndView("member");
    }
}
