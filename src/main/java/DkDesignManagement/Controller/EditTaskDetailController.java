package DkDesignManagement.Controller;

import DkDesignManagement.Repository.ProjectDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EditTaskDetailController {
    @Autowired
    ProjectDao projectDao;
    @RequestMapping(value = "/editTaskDetail", method = RequestMethod.GET)
    public ModelAndView viewEditTaskPage(){
        ModelAndView view = new ModelAndView("editTaskDetail");
        return view;
    }
}
