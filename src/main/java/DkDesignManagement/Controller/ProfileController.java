package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Repository.AccountDao;
import DkDesignManagement.Repository.EmployeeDao;
import DkDesignManagement.Repository.MemberDao;
import DkDesignManagement.Service.AccountService;
import DkDesignManagement.Service.CloudinaryService;
import DkDesignManagement.Service.EmployeeService;
import DkDesignManagement.Service.MemberService;
import DkDesignManagement.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping(value = "/profile")
public class ProfileController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private AccountService accountService;
    @Autowired
   private CloudinaryService cloudinary;

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView loadProfile(Account account, HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        ModelAndView view = new ModelAndView("profile");
        try {
            account = (Account) session.getAttribute("loginUser");
            Employee employee = employeeService.getInformation(account.getId());
            view.addObject("profile", employee);
        } catch (Exception ignored) {
        }
        return view;
    }

    @RequestMapping(value = "/editProfile", method = RequestMethod.GET)
    public ModelAndView loadUpdateProfile(Account account, HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        ModelAndView view = new ModelAndView("edit_profile");
        Employee employee = null;
        account = (Account) session.getAttribute("loginUser");
        try {
            employee = employeeService.getInformation(account.getId());
        } catch (Exception ex) {
        }
        if (employee == null) {
            memberService.addNewMember(account.getUsername(), null, account.getId());
            employee = employeeService.getInformation(account.getId());
        }
        view.addObject("profile", employee);

        return view;
    }

    @RequestMapping(value = "/editProfile", method = RequestMethod.POST)
    public ModelAndView updateProfile(HttpServletRequest request, @RequestParam("newAvatar") MultipartFile file) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");
        int id = Integer.parseInt(request.getParameter("userid"));
        String name = request.getParameter("name");
        String address = request.getParameter("address").trim();
        int gender = Integer.parseInt(request.getParameter("gender"));
        Date dob = DateUtils.covertStringToDate(request.getParameter("dob"));
        String cccd = request.getParameter("cccd").trim();
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();
        String avatar = request.getParameter("oldAvatar");
        try {
            avatar = cloudinary.uploadFile(file, "default", "image");
            if (ObjectUtils.isEmpty(avatar)) {
                request.setAttribute("message", "upload fail ");
                avatar = request.getParameter("oldAvatar");
            }
        } catch (IOException e) {
        }

        //tao mot Employee va cast no vao update
        Employee employee = new Employee(id, name, address, gender, dob, cccd, email, phone);
        employeeService.updateProfile(employee);
        accountService.updateAvatar(account.getId(),avatar);
        account = accountService.getAccount(account.getUsername());
        session.setAttribute("loginUser",account);
        return new ModelAndView("redirect:/profile/detail");
    }
}
