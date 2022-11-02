package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.TaskDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/Task")
public class ViewMyTaskController {
    @Autowired
    private TaskDAO taskDAO;

    @GetMapping(value = "/my_task")
    public ModelAndView viewTask(HttpServletRequest request, HttpServletResponse response){
        ModelAndView view = new ModelAndView("my_task");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");
        List<Task> taskList = taskDAO.getAllTaskInPhaseByAssignedUser(account.getNameAcc(), 1);
        request.setAttribute("listTask", taskList);
        return view;
    }

    @GetMapping(value = "/list_task")
    public ModelAndView viewTask(HttpServletRequest request, HttpServletResponse response){
        ModelAndView view = new ModelAndView("list_task");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");
        List<Task> taskList = taskDAO.getAllTaskInPhase(1);
        request.setAttribute("listTask", taskList);
        return view;
    }
}
