package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.Repository.MemberDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LoadMemberController {
    @RequestMapping(value = "/member", method = RequestMethod.GET)
    public ModelAndView LoadMember(HttpServletRequest request, HttpServletResponse response) {

        List<Member> memberList = new ArrayList<>();

//        MemberDAO memberDAO = new MemberDAO();
//        memberList = memberDAO.getMemberInProject(1);

        memberList.add(new Member("nambi", 1, "0123", "nam@bi.com", "hoabinh", "1"));
        memberList.add(new Member("nambi2", 2, "01234", "nam@bi1.com", "hoabinh", "1"));
        memberList.add(new Member("nambi3", 2, "01235", "nam@bi2.com", "hoabinh", "0"));
        memberList.add(new Member("nambi4", 2, "01236", "nam@bi3.com", "hoabinh", "1"));
        request.setAttribute("memberList", memberList);

        return new ModelAndView("member");
    }
}
