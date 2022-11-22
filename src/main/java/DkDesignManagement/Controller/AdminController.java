package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Member;
import DkDesignManagement.Repository.AccountDao;
import DkDesignManagement.Repository.MemberDao;
import DkDesignManagement.Service.Impl.AccountServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    AccountDao accountDAO;
    @Autowired
    AccountServiceImpl accountService;
    @Autowired
    MemberDao memberDAO;

    @RequestMapping(value = "/memberlist", method = RequestMethod.GET)
    public ModelAndView loadMemberAdminPage(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("memberAdmin");
        List<Member> memberList = memberDAO.getAllMember();
        view.addObject("memberList", memberList);
        return view;
    }
    @RequestMapping(value = "/searchMember",method = RequestMethod.GET)
    public ModelAndView loadMemberAminSearchingPage(HttpServletRequest request){
        ModelAndView view = new ModelAndView("memberAdmin");

        int role = Integer.parseInt(request.getParameter("roleSearch"));
        String name = request.getParameter("nameSearch");

        List<Member> memberList = memberDAO.getAllMemberInSearch(role,name);
        view.addObject("memberList",memberList);
        view.addObject("roleSearch",role);
        view.addObject("nameSearch",name);
        return  view;
    }

    @RequestMapping(value = "/createAccount", method = RequestMethod.GET)
    public ModelAndView loadCreateAccountPage(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("createAccount");
        List<Account> accountList = accountDAO.getAllAccount();
        view.addObject("accountList", accountList);
        return view;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createAccount(HttpServletRequest request, RedirectAttributes redirect) {
        HttpSession session = request.getSession();
        String username = request.getParameter("username").trim().toLowerCase();
        String mail = request.getParameter("mail").trim().toLowerCase();
        int role = Integer.parseInt(request.getParameter("role"));
        String password = "";

        if (accountService.isExisted(username) == false) {
                accountDAO.addNewAccount(username, password, role);
                Account account = accountDAO.getAccount(username);
                memberDAO.addNewMember(username,mail, account.getId());
                redirect.addAttribute("mess", "Add new member successfully");
                return new ModelAndView("redirect:/admin/memberlist");

        } else {
            String error = "Username has existed";
            request.setAttribute("error2",error);
        }
        return new ModelAndView("createAccount");
    }


}

