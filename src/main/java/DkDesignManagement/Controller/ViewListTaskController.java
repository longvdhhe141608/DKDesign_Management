package DkDesignManagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewListTaskController {
    @RequestMapping(value = "/list_task", method = RequestMethod.GET)
    public ModelAndView viewListTask(){
        ModelAndView view = new ModelAndView("list_task");
        return view;
    }
}
