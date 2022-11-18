package DkDesignManagement.Controller;


import DkDesignManagement.Entity.Task;
import DkDesignManagement.Service.CommentService;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.Service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ViewTaskDetailController {

    @Autowired
    TaskService taskService;

    @Autowired
    ProjectService projectService;

    @Autowired
    CommentService commentService;

    @RequestMapping(value = "/task_detail", method = RequestMethod.GET)
    public ModelAndView viewTaskDetail(HttpServletRequest request ,@ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("/task_detail");
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskService.getTaskById(taskId);
        view.addObject("listComment",commentService.getAllCommentsByTaskId(taskId));
        view.addObject("task", task);
        view.addObject("mess", mess);
        return view;
    }


}
