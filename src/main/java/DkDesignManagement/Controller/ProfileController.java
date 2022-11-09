package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Repository.EmployeeDao;
import DkDesignManagement.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping(value = "/profile")
public class ProfileController {
    @Autowired
    private EmployeeDao employeeDao;

    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public ModelAndView loadProfile(Account account, HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        try {
            account = (Account) session.getAttribute("loginUser");
            Employee employee = employeeDao.getInformation(account.getId());
            request.setAttribute("profile", employee);
        } catch (Exception ignored) {
        }
        return new ModelAndView("profile");
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView loadUpdateProfile(Account account, HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        try {
            account = (Account) session.getAttribute("loginUser");
            Employee employee = employeeDao.getInformation(account.getId());
            request.setAttribute("profile", employee);
        } catch (Exception ignored) {
        }
        return new ModelAndView("edit_profile");
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView updateProfile(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("userid"));

        String address = request.getParameter("address").trim();
        int gender = Integer.parseInt(request.getParameter("gender").trim());
        Date dob = DateUtils.covertStringToDate(request.getParameter("dob"));
        String cccd = request.getParameter("cccd").trim();
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();

        //tao mot Employee va cast no vao update
        Employee employee = new Employee(id,address, gender, dob, cccd, email, phone);
        employeeDao.updateProfile(employee);
        return new ModelAndView("redirect:/profile/detail");
    }
}
