package DkDesignManagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewCalendarController {
    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
    public ModelAndView viewCalendar(){
        ModelAndView view = new ModelAndView("calendar");
        return view;
    }
}
