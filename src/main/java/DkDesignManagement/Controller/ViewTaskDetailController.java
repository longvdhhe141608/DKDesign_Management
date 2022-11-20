package DkDesignManagement.Controller;


import DkDesignManagement.Entity.Task;
import DkDesignManagement.Service.CommentService;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.Service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ViewTaskDetailController {

    @Autowired
    TaskService taskService;

    @Autowired
    ProjectService projectService;

    @Autowired
    CommentService commentService;

    @RequestMapping(value = "/task_detail", method = RequestMethod.GET)
    public ModelAndView viewTaskDetail(HttpServletRequest request , @ModelAttribute("mess") String mess, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("/task_detail");
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            view = new ModelAndView("redirect:/login");
            return view;
        }
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskService.getTaskById(taskId);
        //check sub task
        if(task.getTaskfId() !=null){
            view = new ModelAndView("redirect:/subtask?taskId="+taskId);
            return view;
        }
        view.addObject("listComment",commentService.getAllCommentsByTaskId(taskId));
        view.addObject("task", task);
        view.addObject("mess", mess);
        return view;
    }


}
