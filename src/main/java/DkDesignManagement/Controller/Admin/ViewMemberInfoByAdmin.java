package DkDesignManagement.Controller.Admin;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.Repository.EmployeeDao;
import DkDesignManagement.Repository.MemberDao;
import DkDesignManagement.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping(value = "/member")
public class ViewMemberInfoByAdmin {
    @Autowired
    EmployeeDao employeeDao;
    @Autowired
    MemberDao memberDAO;


    @RequestMapping(value = "/information", method = RequestMethod.GET)
    public ModelAndView loadMemberDetail(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("admin/informationAdmin");

        int id = Integer.parseInt(request.getParameter("id"));

        Member member = memberDAO.getMemberByMemberId(id);

        view.addObject("member", member);
        return view;
    }

    @RequestMapping(value = "editAccount", method = RequestMethod.GET)
    public ModelAndView loadEditMemberDetail(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("admin/editAccountAdmin");

        int id = Integer.parseInt(request.getParameter("id"));

        Member member = memberDAO.getMemberByMemberId(id);

        view.addObject("member", member);

        return view;
    }

    @RequestMapping(value = "editAccount", method = RequestMethod.POST)
    public ModelAndView editMemberDetail(HttpServletRequest request) {
        ModelAndView view;

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String cccd = request.getParameter("cccd");
        Date dob = DateUtils.covertStringToDate(request.getParameter("dob"));
        int gender = Integer.parseInt(request.getParameter("gender"));
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");
        String address = request.getParameter("address");
        int role = Integer.parseInt(request.getParameter("role"));
        int status = Integer.parseInt(request.getParameter("status"));
        Member member = new Member(id,name,username,gender,dob,role,phone,mail,address,status,cccd);

        try{

            memberDAO.updateMemberInfo(id,name,gender,dob,phone,mail,address,cccd);
            memberDAO.updateMemberStatus(status,username);
            memberDAO.updateMemberRole(role,username);

        }catch (Exception exception){
            view = new ModelAndView("admin/editAccountAdmin");
            view.addObject("member",member);
            view.addObject("error","Action failed");
        }
        view = new ModelAndView("redirect:/member/information?id="+id);
        return view;
    }
}
