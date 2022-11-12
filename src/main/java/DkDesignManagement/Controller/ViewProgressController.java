package DkDesignManagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewProgressController {
    @RequestMapping(value = "/progress", method = RequestMethod.GET)
    public ModelAndView viewProgress(){
        ModelAndView view = new ModelAndView("progress");
        return view;
    }
}
