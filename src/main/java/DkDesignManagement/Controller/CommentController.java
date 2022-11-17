package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class CommentController {

    @RequestMapping(value = "/add-comment",method = RequestMethod.POST)
    public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response){
        ModelAndView view = new ModelAndView("headerHome");
        return view;
    }
}
