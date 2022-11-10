package DkDesignManagement.Controller;

import DkDesignManagement.Service.BigTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewListTaskController {

    @Autowired
    BigTaskService bigTaskService;

    @RequestMapping(value = "/list_task", method = RequestMethod.GET)
    public ModelAndView viewListTask(){
        ModelAndView view = new ModelAndView("list_task");
        view.addObject("listBigTask",bigTaskService.getAll());
        return view;
    }
}
