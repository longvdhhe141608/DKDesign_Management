package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.ImageAndFileDao;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.CategoryService;
import DkDesignManagement.Service.CloudinaryService;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class EditSummaryController {

    @Autowired
    ProjectDao projectDao;

    @Autowired
    ProjectService projectService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ImageAndFileDao imageAndFileDao;

    @Autowired
    private CloudinaryService cloudinary;

    @RequestMapping(value = "/edit_summary", method = RequestMethod.GET)
    public ModelAndView viewSummary(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("edit_summary");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectDao.getProject(id);
        request.setAttribute("project", project);
        view.addObject("listCategory", categoryService.getAllCategory());

        return view;
    }

    @RequestMapping(value = "/edit_summary/edit_project", method = RequestMethod.POST)
    public ModelAndView editSummary(HttpServletRequest request, RedirectAttributes redirect,
                                    @RequestParam("file") List<MultipartFile> file)
            throws ServletException, IOException {
        ModelAndView view = new ModelAndView("redirect:/project/summary");
        //check login
        HttpSession session = request.getSession();
        if (ObjectUtils.isEmpty(session.getAttribute("loginUser"))) {
            redirect.addAttribute("mess", "Please login");
            return view;
        }

        Account account = (Account) session.getAttribute("loginUser");
        //get value
        int id = Integer.parseInt(request.getParameter("idProject"));
        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Date startDate = DateUtils.covertStringToDate(request.getParameter("startDate"));
        Date closureDate = DateUtils.covertStringToDate(request.getParameter("closureDate"));
        Date endDate = DateUtils.covertStringToDate(request.getParameter("endDate"));
        String customerName = request.getParameter("customerName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String detail = request.getParameter("detail");
        Long constructionArea = Long.parseLong(request.getParameter("constructionArea"));
        Long expectedCost = Long.parseLong(request.getParameter("expectedCost"));
        int status = Integer.parseInt(request.getParameter("status"));

        //create model
        Project project = new Project(id, name, startDate, closureDate, endDate
                , account.getId(), categoryId, customerName, address, phone, detail, status, constructionArea, expectedCost);

        file.forEach(f -> {
            String url;
            try {
                url = cloudinary.uploadFile(f, "default", "image");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            if (ObjectUtils.isEmpty(url)) {
                request.setAttribute("mess", "Upload fail");
            } else {
                int checkSaveFile = imageAndFileDao.uploadFileSummary(url, project.getId());
            }
            request.setAttribute("mess", "Upload success");
        });
        //add
        int statusEdit = projectService.editProject(project);
        if (statusEdit != 1) {
            redirect.addAttribute("id", id);
            redirect.addAttribute("mess", "edit fail");
            return view;
        }
        redirect.addAttribute("id", id);
        redirect.addAttribute("mess", "edit successfully ");

        return view;
    }

//    @RequestMapping(value = "/edit_summary/upload-file-summary", method = RequestMethod.POST)
//    public ModelAndView uploadFileSummary(HttpServletRequest request,
//                                          @RequestParam("file") List<MultipartFile> file)
//            throws ServletException, IOException {
//        ModelAndView view = new ModelAndView("redirect:/edit_summary");
//        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("loginUser");
//        int projectID = Integer.parseInt(request.getParameter("project-id"));
//        Project project = projectDao.getProject(projectID);
//        file.forEach(f -> {
//            String url = null;
//            try {
//                url = cloudinary.uploadFile(f, "default", "image");
//            } catch (IOException e) {
//                throw new RuntimeException(e);
//            }
//            if (ObjectUtils.isEmpty(url)) {
//                request.setAttribute("mess", "upload fail");
//            } else {
//                int checkSaveFile = imageAndFileDao.uploadFileSummary(url,project.getId());
//            }
//        });
//        view.addObject("idProject", projectID);
//        return view;
//    }
}
