package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Employee;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/edit_profile")
public class EditProfileController {
    private ModelAndView view;

    @RequestMapping("")
    public ModelAndView editProfile() {
        ModelAndView view = new ModelAndView("edit_profile");
        return view;
    }
}
