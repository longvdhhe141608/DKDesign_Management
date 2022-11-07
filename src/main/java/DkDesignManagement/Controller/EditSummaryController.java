package DkDesignManagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EditSummaryController {
    @RequestMapping(value = "/edit_summary", method = RequestMethod.GET)
    public ModelAndView editSummary() {
        ModelAndView view = new ModelAndView("edit_summary");
        return view;
    }
}
