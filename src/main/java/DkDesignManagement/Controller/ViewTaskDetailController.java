package DkDesignManagement.Controller;


import DkDesignManagement.Service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ViewTaskDetailController {

    @Autowired
    TaskService taskService;

    @RequestMapping(value = "/task_detail", method = RequestMethod.GET)
    public ModelAndView viewTaskDetail(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/task_detail");
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        view.addObject("task", taskService.getTaskById(taskId));
        return view;
    }


}
