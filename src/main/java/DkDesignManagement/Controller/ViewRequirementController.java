package DkDesignManagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewRequirementController {
    @RequestMapping(value = "/requirement", method = RequestMethod.GET)
    public ModelAndView viewRequirement(){
        ModelAndView view = new ModelAndView("requirement");
        return view;
    }
}
