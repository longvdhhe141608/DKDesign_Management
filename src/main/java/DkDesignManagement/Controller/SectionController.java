package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Section;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class SectionController {

    @Autowired
    SectionService sectionService;

    @RequestMapping(value = "/add_section", method = RequestMethod.POST)
    public ModelAndView addSection(HttpServletRequest request, RedirectAttributes redirect) {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        ModelAndView view = new ModelAndView("redirect:/list_task?id=" + projectId);
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }
        Account account = (Account) session.getAttribute("loginUser");

        //get value
        String name = request.getParameter("name");


        Section section = new Section(-1, name, null, projectId, account.getId());

        //add section
        sectionService.addSection(section);
        redirect.addAttribute("mess", "add successfully ");
        return view;
    }

    @RequestMapping(value = "/edit_section", method = RequestMethod.POST)
    public ModelAndView editSection(HttpServletRequest request, RedirectAttributes redirect) {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        ModelAndView view = new ModelAndView("redirect:/list_task?id=" + projectId);
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }
        Account account = (Account) session.getAttribute("loginUser");
        int sectionId = Integer.parseInt(request.getParameter("sectionId"));
        String sectionName = request.getParameter("sectionName");
        sectionService.editSection(sectionName, sectionId);
        return view;
    }
}
