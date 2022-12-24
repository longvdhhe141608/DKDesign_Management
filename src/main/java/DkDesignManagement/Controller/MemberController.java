package DkDesignManagement.Controller;

import DkDesignManagement.Entity.*;
import DkDesignManagement.Service.*;
import DkDesignManagement.Model.MemberPageResponse;
import DkDesignManagement.Model.NotificationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static DkDesignManagement.Utils.Constant.HOST;
import static DkDesignManagement.Utils.Constant.PROJECT_NAME;


@Controller
@RequestMapping(value = "/project")
public class MemberController {

    @Autowired
    private MemberService memberService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    NotificationService notificationService;

    @Autowired
    AccountService accountService;

    @Autowired
    ProjectParticipationService projectParticipationService;

    @Autowired
    EmployeeService employeeService;

    @RequestMapping(value = "/member", method = RequestMethod.GET)
    public ModelAndView LoadMember(HttpServletRequest request, @RequestParam("id") int projectid, @ModelAttribute("mess") String mess) {

        ModelAndView view = new ModelAndView("leader/member");

        int id = projectid;
        Project project = projectService.getProject(id);

        int page = 1;
        if (!ObjectUtils.isEmpty(request.getParameter("page"))) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        MemberPageResponse memberPageResponse = memberService.getMemberInProject(page, id);
        List<Member> memberList = memberPageResponse.getMemberList();

        Account account = (Account) request.getSession().getAttribute("loginUser");

        view.addObject("project", project);
        view.addObject("memberList", memberList);
        view.addObject("employeeList", employeeService.getAllToAdd(projectid,account));
        view.addObject("page", page);
        view.addObject("endPage", memberPageResponse.getEndPage());
        view.addObject("projectId", id);
        view.addObject("mess", mess);

        return view;
    }

    @RequestMapping(value = "/searchMemberInProject", method = RequestMethod.GET)
    public ModelAndView loadMemberAminSearchingPage(HttpServletRequest request, @RequestParam("id") int projectid) {
        ModelAndView view = new ModelAndView("leader/member");
        int id = projectid;
        Project project = projectService.getProject(id);

        int role = Integer.parseInt(request.getParameter("roleSearch"));
        String name = request.getParameter("nameSearch");

        List<Member> memberList = memberService.searchMemberInProject(projectid, role, name);
        view.addObject("memberList", memberList);
        view.addObject("project", project);
        view.addObject("roleSearch", role);
        view.addObject("nameSearch", name);
        return view;
    }

    @RequestMapping(value = "/addMember", method = RequestMethod.GET)
    public ModelAndView addMemberToProject(HttpServletRequest request, @RequestParam("id") int projectId, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("redirect:/project/member?id=" + projectId);
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        Employee employee = employeeService.getEmployeeByAccId(accountId);

        //check role member
//        Account account = accountService.getAccountByAccountId(accountId);
//        if(account.getRole_id() == 2){
//            redirect.addAttribute("mess", "Thành viên  " + employee.getName() + " không thể thêm vào dự án vì là leader ");
//            return view;
//        }

        //TODO : check Member exits
        if (projectParticipationService.isMemberExisted(projectId, accountId)) {
            redirect.addAttribute("mess", "Thành viên  " + employee.getName() + " đã tồn tại trong dự án ");
            return view;
        }

        boolean checkAddMember = true;
        try {

            memberService.addMemberToProject(projectId, accountId);
        } catch (Exception e) {
            checkAddMember = false;
            e.printStackTrace();
        }

        if (checkAddMember) {
            //add notification send leader
            String url = HOST + "/" + PROJECT_NAME + "/design/project/summary?id=" + projectId;
            String message = "Bạn đã được thêm vào dự án";

            //check notification exits
            NotificationDto notificationDto = notificationService.getNotification(employee.getId_acc(), message, url);
            if (ObjectUtils.isEmpty(notificationDto)) {
                Notification notification = new Notification(-1, new java.util.Date()
                        , message, employee.getId_acc(), projectId, url);
                notificationService.addNotification(notification);
            }
        } else {
            redirect.addAttribute("mess", "Đã có lỗi xẩy ra khi thêm thành viên");
            return view;
        }


        return view;
    }

    @RequestMapping(value = "/changeMemberStatus", method = RequestMethod.GET)
    public ModelAndView changeMemberStatus(HttpServletRequest request, RedirectAttributes redirect) {
        int id = Integer.parseInt(request.getParameter("id"));
        ModelAndView view = new ModelAndView("redirect:/project/member?id=" + id);

        int status = Integer.parseInt(request.getParameter("status"));
//        if(status==1){
//            status = 2;
//        }else{
//            status = 1;
//        }
        String username = request.getParameter("username");

        int memberId = memberService.getAccountIdByUsername(username);

        memberService.updateStatusMemberInProject(id, memberId, status);

        return view;
    }

    @RequestMapping(value = "/delete-member", method = RequestMethod.GET)
    public ModelAndView deleteMember(HttpServletRequest request, RedirectAttributes redirect) {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        ModelAndView view = new ModelAndView("redirect:/project/member?id=" + projectId);
        int memberId = Integer.parseInt(request.getParameter("memberId"));

        Employee employee = employeeService.getEmployeeByEmpId(memberId);

        projectParticipationService.deleteProjectParticipation(projectId, employee.getId_acc());

        return view;
    }
}
