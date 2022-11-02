package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Repository.EmployeeDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class ViewProfileController {
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView LoadProfile(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        try {
            Account account = (Account) session.getAttribute("loginUser");
            EmployeeDao employeeDao = new EmployeeDao();
//          Employee employee = employeeDao.getInformation(account.getNameAcc());
//            Employee employee = new Employee(1, "Hoàng Thị Thu Hương", "female", 20, "htth@gmail.com", "0123987654", "531231512512");
//            session.setAttribute("profile", employee);
//            request.setAttribute("profile1",employee);
        } catch (Exception ignored) {
        }

        return new ModelAndView("profile");
    }
}
