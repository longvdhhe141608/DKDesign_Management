package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.TaskDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping(value = "/Task")
public class ViewMyTaskController {
    @Autowired
    private TaskDAO taskDAO;

    @GetMapping(value = "/my_task")
    public ModelAndView viewTask(@ModelAttribute(value = "Account")Account account, HttpServletRequest request, HttpServletResponse response){
        ModelAndView view = new ModelAndView("my_task");
        List<Task> taskList = taskDAO.getAllTaskInPhaseByAssignedUser(account.getNameAcc(), 1);
        request.setAttribute("listTask", taskList);
        return view;
    }
}
