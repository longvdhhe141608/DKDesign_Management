package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Member;
import DkDesignManagement.Repository.AccountDao;
import DkDesignManagement.Repository.MemberDao;
import DkDesignManagement.Service.Impl.AccountServiceImpl;
import DkDesignManagement.Service.Impl.EmployeeServiceImpl;
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

import static DkDesignManagement.utils.ValidateUtils.*;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    AccountDao accountDAO;
    @Autowired
    AccountServiceImpl accountService;
    @Autowired
    EmployeeServiceImpl employeeService;
    @Autowired
    MemberDao memberDAO;

    @RequestMapping(value = "/memberlist", method = RequestMethod.GET)
    public ModelAndView loadMemberAdminPage(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("memberAdmin");
        List<Member> memberList = memberDAO.getAllMember();
        view.addObject("memberList", memberList);
        return view;
    }

    @RequestMapping(value = "/searchMember", method = RequestMethod.GET)
    public ModelAndView loadMemberAminSearchingPage(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("memberAdmin");

        int role = Integer.parseInt(request.getParameter("roleSearch"));
        String name = request.getParameter("nameSearch");

        List<Member> memberList = memberDAO.getAllMemberInSearch(role, name);
        view.addObject("memberList", memberList);
        view.addObject("roleSearch", role);
        view.addObject("nameSearch", name);
        return view;
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
        String name = request.getParameter("name").trim();
        String mail = request.getParameter("mail").trim().toLowerCase();
        int role = Integer.parseInt(request.getParameter("role"));


        String preCode = generateEmployeeCode(removeAccent(name.toLowerCase()));
        String password = generateCommonLangPassword();

        int postNumber = 1;
        String username = preCode + postNumber;
        while (accountService.isExisted(username) == true) {
            postNumber++;
            username = preCode + postNumber;
        }

        if (employeeService.emailIsExisted(mail) == false) {
            accountDAO.addNewAccount(username, password, role);
            Account account = accountDAO.getAccount(username);
            memberDAO.addNewMember(name, mail, account.getId());
            redirect.addAttribute("mess", "Add new member successfully");
            return new ModelAndView("redirect:/admin/memberlist");
        } else {
            String error = "Email has existed";
            request.setAttribute("name", name);
            request.setAttribute("error1", error);
        }
        return new ModelAndView("createAccount");
    }

    @RequestMapping(value = "/changeMemberStatus")
    public ModelAndView changeStatusMemberByAdmin(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("memberAdmin");

        int status = Integer.parseInt(request.getParameter("status"));
        if (status == 1) {
            status = 2;
        } else {
            status = 1;
        }
        String username = request.getParameter("username");

        memberDAO.updateMemberStatus(status, username);
        List<Member> memberList = memberDAO.getAllMember();
        view.addObject("memberList", memberList);

        return view;
    }
}

