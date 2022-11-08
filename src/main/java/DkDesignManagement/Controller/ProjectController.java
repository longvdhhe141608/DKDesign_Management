package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.CategoryService;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;
import java.util.Date;

@Controller
public class ProjectController {

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/allProject", method = RequestMethod.GET)
    public ModelAndView loadAllProject(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView view = new ModelAndView("allProject");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");
        view.addObject("listAllProject", projectDao.getAllProjectByAcc(account.getId()));
        view.addObject("listCategory", categoryService.getAllCategory());
        return view;
    }

    @RequestMapping(value = "/allProject/add", method = RequestMethod.POST)
    public ModelAndView loadAllProject(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("allProject");
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            view.addObject("mess", "Please login");
            return view;
        }

        Account account = (Account) session.getAttribute("loginUser");
        //get value
        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Date startDate = DateUtils.covertStringToDate(request.getParameter("startDate"));
        Date closureDate = DateUtils.covertStringToDate(request.getParameter("closureDate"));
        Date endDate = DateUtils.covertStringToDate(request.getParameter("endDate"));
        String customerName = request.getParameter("customerName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String detail = request.getParameter("detail");

        //create model
        Project project = new Project(-1, name, startDate, closureDate, endDate
                , account.getId(), categoryId, customerName, address, phone, detail, 1);

        //add
      int status =  projectService.addProject(project);
        if(status != 1){
            view.addObject("mess", "add fail");
            return view;
        }


        view.addObject("mess", "add successfully");

        return view;
    }
}
