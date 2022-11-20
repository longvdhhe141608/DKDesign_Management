package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Comment;
import DkDesignManagement.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class CommentController {

    @Autowired
    CommentService commentService;

    @RequestMapping(value = "/add-comment",method = RequestMethod.POST)
    public ModelAndView addComment(HttpServletRequest request, RedirectAttributes redirect){
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        String operation = request.getParameter("operation");
        //check previous page
        ModelAndView view = new ModelAndView("redirect:/task_detail?taskId="+taskId);
        if(operation.equals("subTaskDetail")){
            view = new ModelAndView("redirect:/subtask?taskId="+taskId);
        }
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }
        Account account = (Account) session.getAttribute("loginUser");
        //get value
        String content = request.getParameter("content");

        //create model
        Comment comment = new Comment(-1,  content, new Date(),  taskId, account.getId(),false);

        //add
        commentService.addComment(comment);

        redirect.addAttribute("mess", "Add comment success");

        return view;
    }

    @RequestMapping(value = "/pin-comment",method = RequestMethod.GET)
    public ModelAndView pinComment(HttpServletRequest request, RedirectAttributes redirect){
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        ModelAndView view = new ModelAndView("redirect:/task_detail?taskId="+taskId);
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            view = new ModelAndView("redirect:/login");
            return view;
        }
        //check previous page
        String operation = request.getParameter("operation");
        if(operation.equals("subTaskDetail")){
            view = new ModelAndView("redirect:/subtask?taskId="+taskId);
        }
        Account account = (Account) session.getAttribute("loginUser");
        //check role
        if(account.getRole_id() != 2 ){
            redirect.addAttribute("mess", "You are not authorized");
            view = new ModelAndView("redirect:/task_detail?taskId="+taskId);
            return view;
        }

        //update
        int commentId = Integer.parseInt(request.getParameter("commentId"));

        commentService.updatePinComment(commentId);

        redirect.addAttribute("mess", "Pin comment success");

        return view ;
    }
}
