package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Entity.Member;
import DkDesignManagement.Repository.EmployeeDao;
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
public class ViewMemberInfoByAdmin {
    @Autowired
    EmployeeDao employeeDao;
    @Autowired
    MemberDAO memberDAO;


    @RequestMapping(value = "/information",method = RequestMethod.GET)
    public ModelAndView loadMemberDetail(HttpServletRequest request, RedirectAttributes redirect){
        ModelAndView view = new ModelAndView("informationAdmin");

        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeDao.getEmployeeByEmpId(id);
        Member member = memberDAO.getMemberByMemberId(id);

        view.addObject("member",member);
        view.addObject("employee",employee);
        return view;
    }
    @RequestMapping(value = "editAccount",method = RequestMethod.GET)
    public ModelAndView editMemberDetail(HttpServletRequest request, RedirectAttributes redirect){
        ModelAndView view = new ModelAndView("editAccountAdmin");

        int id = Integer.parseInt(request.getParameter("id"));

        Member member = memberDAO.getMemberByMemberId(id);

        Employee employee = employeeDao.getEmployeeByEmpId(id);

        view.addObject("member",member);
        view.addObject("employee",employee);

        return view;
    }
}
