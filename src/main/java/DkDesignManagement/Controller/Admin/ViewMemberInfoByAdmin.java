package DkDesignManagement.Controller.Admin;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Member;
import DkDesignManagement.Service.AccountService;
import DkDesignManagement.Service.EmployeeService;
import DkDesignManagement.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/member")
public class ViewMemberInfoByAdmin {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private AccountService accountService;

    @RequestMapping(value = "/information", method = RequestMethod.GET)
    public ModelAndView loadMemberDetail(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("admin/informationAdmin");

        int id = Integer.parseInt(request.getParameter("id"));

        Member member = memberService.getMemberByMemberId(id);
        Account account = accountService.getAccount(member.getMemberCode());
        view.addObject("member", member);
        view.addObject("memberAvatar", account.getAvatar_url());
        return view;
    }

    @RequestMapping(value = "editAccount", method = RequestMethod.GET)
    public ModelAndView loadEditMemberDetail(HttpServletRequest request, @RequestParam("id") int id, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("admin/editAccountAdmin");

        Member member = memberService.getMemberByMemberId(id);
        Account account = accountService.getAccount(member.getMemberCode());
        view.addObject("member", member);
        view.addObject("memberAvatar", account.getAvatar_url());

        return view;
    }

    @RequestMapping(value = "editAccount", method = RequestMethod.POST)
    public ModelAndView editMemberDetail(HttpServletRequest request) {
        ModelAndView view;

        int id = Integer.parseInt(request.getParameter("id"));
        Member member = memberService.getMemberByMemberId(id);

        int role = Integer.parseInt(request.getParameter("role"));
        int status = Integer.parseInt(request.getParameter("status"));

        if (role != member.getMemberRole()) {
            memberService.updateMemberRole(role, member.getMemberCode());
        }


        if (status != member.getMemberStatus()) {
            memberService.updateMemberStatus(status, member.getMemberCode());
        }

        view = new ModelAndView("redirect:information?id=" + id);
        view.addObject("member", member);
        return view;
    }
}
