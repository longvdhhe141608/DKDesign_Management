package DkDesignManagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoadHomeController {

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response){
        ModelAndView view = new ModelAndView("home");
        return view;
    }
}
