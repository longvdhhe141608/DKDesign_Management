package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.RevisionHistory;
import DkDesignManagement.Service.*;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class EditSummaryController {

    @Autowired
    ProjectService projectService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ImageAndFileService imageAndFileService;

    @Autowired
    private CloudinaryService cloudinary;

    @Autowired
    HistoryService historyService;

    @RequestMapping(value = "/edit_summary", method = RequestMethod.GET)
    public ModelAndView viewSummary(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("leader/edit_summary");
        int id = Integer.parseInt(request.getParameter("id"));
        Project project = projectService.getProject(id);
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
        if (!ObjectUtils.isEmpty(file.get(0).getOriginalFilename())) {
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
                    int checkSaveFile = imageAndFileService.uploadFileSummary(url, project.getId());
                }
                request.setAttribute("mess", "Upload success");
            });
        }
        Project oldProject = projectService.getProject(project.getId());

        //add
        int statusEdit = projectService.editProject(project);
        if (statusEdit != 1) {
            redirect.addAttribute("id", id);
            redirect.addAttribute("mess", "edit fail");
            return view;
        }
        redirect.addAttribute("id", id);
        redirect.addAttribute("mess", "edit successfully ");

        //add history
        //compare

        List<String> listChange = compareProject(oldProject, project);
        //check history exits
        String type = "project";
        Integer revisionNo = historyService.getLastRevisionNoHistoryOfTable(project.getId(), type,project.getId());
        int revisionNoNew = 1;
        if (!ObjectUtils.isEmpty(revisionNo)) {
            revisionNoNew = revisionNo + 1;
        }

        String revisionDetail = "";
        if (!ObjectUtils.isEmpty(listChange)) {
            for (String change : listChange) {
                revisionDetail += change + " <br> ";
            }
            RevisionHistory revisionHistory = new RevisionHistory(-1, project.getId(), revisionNoNew, new Date(), revisionDetail, type,project.getId());
            historyService.addHistory(revisionHistory);
        }



        return view;
    }

    private List<String> compareProject(Project oldProject, Project newProject) {
        List<String> change = new ArrayList<>();
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");

        if (!newProject.getProjectName().trim().equals(oldProject.getProjectName().trim())) {
            String message = "Tên công trình: " + oldProject.getProjectName() + " -> " + newProject.getProjectName();
            change.add(message);
        }
        if (!newProject.getCusName().trim().equals(oldProject.getCusName().trim())) {
            String message = "Chủ nhà: " + oldProject.getCusName() + " -> " + newProject.getCusName();
            change.add(message);
        }
        if (!newProject.getCusPhone().trim().equals(oldProject.getCusPhone().trim())) {
            String message = "Số điện thoại: " + oldProject.getCusPhone() + " -> " + newProject.getCusPhone();
            change.add(message);
        }
        if (!newProject.getCusAddress().trim().equals(oldProject.getCusAddress().trim())) {
            String message = "Địa chỉ công trình: " + oldProject.getCusAddress() + " -> " + newProject.getCusAddress();
            change.add(message);
        }
        if (newProject.getType() != oldProject.getType()) {
            String message = "TypeId: " + oldProject.getType() + " -> " + newProject.getType();
            change.add(message);
        }
        if (!newProject.getConstructionArea().equals(oldProject.getConstructionArea())) {

            String message = "Diện tích xây dựng: " + oldProject.getConstructionArea() + " -> " + newProject.getConstructionArea();
            change.add(message);
        }
        if (!newProject.getStartDate().equals(oldProject.getStartDate())) {
            String message = "Thời gian bắt đầu: " + oldProject.getStartDate() + " -> " + formatDate.format(newProject.getStartDate());
            change.add(message);
        }
        if (!newProject.getClosureDate().equals(oldProject.getClosureDate())) {
            String message = "Thời gian dự kiến kết thúc: " + oldProject.getClosureDate() + " -> " + formatDate.format(newProject.getClosureDate());
            change.add(message);
        }
        if (!newProject.getDetail().trim().equals(oldProject.getDetail().trim())) {
            String message = "Mô tả: " + oldProject.getDetail() + " -> " + newProject.getDetail();
            change.add(message);
        }

        return change;
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
