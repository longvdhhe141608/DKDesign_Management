package DkDesignManagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/home")
public class LoadHomeController {

    @GetMapping (value = "")
    public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("headerHome");
        return view;
    }
}
