package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Entity.Member;
import DkDesignManagement.Entity.Notification;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Service.*;
import DkDesignManagement.model.MemberPageResponse;
import DkDesignManagement.model.NotificationDto;
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

import static DkDesignManagement.utils.Constant.HOST;
import static DkDesignManagement.utils.Constant.PROJECT_NAME;


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

        ModelAndView view = new ModelAndView("member");

        int id = projectid;
        Project project = projectService.getProject(id);

        int page = 1;
        if (!ObjectUtils.isEmpty(request.getParameter("page"))) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        MemberPageResponse memberPageResponse = memberService.getMemberInProject(page, id);
        List<Member> memberList = memberPageResponse.getMemberList();

        view.addObject("project", project);
        view.addObject("memberList", memberList);
        view.addObject("employeeList", employeeService.getAll());
        view.addObject("page", page);
        view.addObject("endPage", memberPageResponse.getEndPage());
        view.addObject("projectId", id);
        view.addObject("mess", mess);

        return view;
    }

    @RequestMapping(value = "/searchMemberInProject", method = RequestMethod.GET)
    public ModelAndView loadMemberAminSearchingPage(HttpServletRequest request, @RequestParam("id") int projectid) {
        ModelAndView view = new ModelAndView("member");
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

        //TODO : check Member exits
        if(projectParticipationService.isMemberExisted(projectId,accountId)){
            redirect.addAttribute("mess", "Thành viên  "+employee.getName()+" đã tồn tại trong dự án ");
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

        redirect.addAttribute("mess", "Thêm thành viên thành công!");

        return view;
    }

    @RequestMapping(value = "/changeMemberStatus", method = RequestMethod.GET)
    public ModelAndView changeMemberStatus(HttpServletRequest request, RedirectAttributes redirect) {
        int id = Integer.parseInt(request.getParameter("id"));
        ModelAndView view = new ModelAndView("redirect:/member?id=" + id);

        int status = Integer.parseInt(request.getParameter("status"));
        String username = request.getParameter("username");

        int memberId = memberService.getAccountIdByUsername(username);

        memberService.updateStatusMemberInProject(id, memberId, status);

        redirect.addAttribute("mess", "đổi trạng thái thành công!");
        return view;
    }
}
