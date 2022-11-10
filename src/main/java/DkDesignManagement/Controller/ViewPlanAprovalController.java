package DkDesignManagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewPlanAprovalController {
    @RequestMapping(value = "/plan_approval", method = RequestMethod.GET)
    public ModelAndView viewPlanAproval(){
        ModelAndView view = new ModelAndView("plan_approval");
        return view;
    }
}
