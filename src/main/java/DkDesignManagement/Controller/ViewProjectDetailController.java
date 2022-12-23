package DkDesignManagement.Controller;

import DkDesignManagement.Entity.*;
import DkDesignManagement.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/project")
public class ViewProjectDetailController {

    @Autowired
    private StatusService statusService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    HistoryService historyService;
    @Autowired
    private ImageAndFileService imageAndFileService;

    @Autowired
    ProjectParticipationService projectParticipationService;

    @RequestMapping(value = "/summary", method = RequestMethod.GET)
    public ModelAndView projectDetail(HttpServletRequest request, @ModelAttribute("mess") String mess) {
        ModelAndView view = new ModelAndView("leader/summary");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectService.getProject(id);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("loginUser");

        ProjectParticipation projectParticipation = projectParticipationService.getProjectParticipants(id,account.getId());
        if(projectParticipation.getRoleId() == 3 ){
            //design
            view = new ModelAndView("redirect:/design/project/summary?id="+id);
            return view;
        }
        //list status

        List<Status> listStatus = statusService.getAllStatus();
        List<Status> listRemove = new ArrayList<>();
        for (Status status : listStatus) {
            if (ObjectUtils.isEmpty(status.getStatusProject())) {
                listRemove.add(status);
            }else{
                if(status.getStatusProject().equals("Đã xóa")){
                    listRemove.add(status);
                }
            }
        }
        List<ImageAndFile> imageAndFiles = imageAndFileService.getAllImageSummary(id);
        listStatus.removeAll(listRemove);
        view.addObject("listHistory", historyService.getAlLRevisionHistoryOfTable(project.getId(), "project", project.getId()));
        view.addObject("listImage", imageAndFiles);
        session.setAttribute("project", project);
        session.setAttribute("listStatus", listStatus);
        view.addObject("mess", mess);
        return view;
    }

    @RequestMapping(value = "/change-status", method = RequestMethod.POST)
    public ModelAndView changeStatusProject(HttpServletRequest request, RedirectAttributes redirect) {
        int projectId = Integer.parseInt(request.getParameter("projectId"));

        ModelAndView view = new ModelAndView("redirect:/project/summary?id=" + projectId);

        //get value
        int status = Integer.parseInt(request.getParameter("statusId"));


        //update
        Project project = projectService.getProject(projectId);
        if (status == 3) {
            project.setEndDate(new Date());
        }
        project.setStatus(status);

        projectService.editProject(project);


        return view;
    }

    @RequestMapping(value = "/delete-file", method = RequestMethod.GET)
    public ModelAndView deleteFile(HttpServletRequest request, RedirectAttributes redirect) {

        int projectId = Integer.parseInt(request.getParameter("projectId"));

        ModelAndView view = new ModelAndView("redirect:/project/summary?id=" + projectId);
        String listID[] = request.getParameterValues("listFile");
        System.out.println("aaaaaaaaaa");
        for (int i = 0; i < listID.length; i++) {
            System.out.println(listID[i]);
            imageAndFileService.updateStatus(projectId, Integer.parseInt(listID[i]));
        }
        return view;
    }

}
