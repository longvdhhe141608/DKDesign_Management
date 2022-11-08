package DkDesignManagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewSubtaskController {

    @RequestMapping(value = "/subtask", method = RequestMethod.GET)
    public ModelAndView viewSubTaskDetail() {
        ModelAndView view = new ModelAndView("subtask");
        return view;
    }
}
