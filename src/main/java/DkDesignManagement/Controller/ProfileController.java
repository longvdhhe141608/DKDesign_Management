package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Repository.EmployeeDao;
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

    @RequestMapping(value = "", method = RequestMethod.GET)
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

    @RequestMapping(value = "/update", method = RequestMethod.GET)
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
    @RequestMapping(value = "", method = RequestMethod.POST)
    public ModelAndView updateProfile(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String address = request.getParameter("address");
            int gender = Integer.parseInt(request.getParameter("gender"));
            Date dob = new Date(request.getParameter("dob"));
            String cccd = request.getParameter("cccd");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            //tao mot Employee va cast no vao update
            employeeDao.updateProfile(new Employee(id,name,age,address,gender,dob,cccd,email,phone));
        } catch (Exception e) {

        }
        return new ModelAndView("profile");
    }
}
