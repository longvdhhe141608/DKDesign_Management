package DkDesignManagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewProjectDetailController {
    @RequestMapping(value = "/summary", method = RequestMethod.GET)
    public ModelAndView projectDetail(){
        ModelAndView view = new ModelAndView("summary");
        return view;
    }

}
