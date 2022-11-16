package DkDesignManagement.Controller;

import DkDesignManagement.Repository.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/member")
public class ViewMemberInforByAdmin {
    @Autowired
    MemberDAO memberDAO;

    @RequestMapping(value = "/information",method = RequestMethod.GET)
    public ModelAndView loadMemberDetail(HttpServletRequest request, RedirectAttributes redirect){
        ModelAndView view = new ModelAndView("informationAdmin");

        int id = Integer.parseInt(request.getParameter("id"));

        return view;
    }
}
