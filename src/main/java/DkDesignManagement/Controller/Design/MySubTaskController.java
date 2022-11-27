package DkDesignManagement.Controller.Design;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Repository.TaskDAO;
import DkDesignManagement.model.MyTaskDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/design/my-task")
public class MySubTaskController {

    @Autowired
    private TaskDAO taskDAO;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView getAllMyTask(HttpServletRequest request, RedirectAttributes redirect) {
        ModelAndView view = new ModelAndView("design/my-task");

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("loginUser");

        String textSearch = request.getParameter("textSearch");
        String indexPage = request.getParameter("pageNo");

        int page = 1;
        if (indexPage != null) {
            page = Integer.parseInt(indexPage);
        }

        int index = page * 10 - 10;

        LocalDateTime localDateTime = LocalDateTime.now();
        LocalDate localDate = localDateTime.toLocalDate();

        Date nowDate = Date.valueOf(localDate);

        int totalMyTask = taskDAO.getTotalAllMyTask(a.getId(), textSearch);
        int totalPages = (totalMyTask % 10 == 0) ? totalMyTask / 10 : totalMyTask / 10 + 1;

        List<MyTaskDto> myTaskDtoList = taskDAO.getAllMyTask(a.getId(), index, textSearch);

        List<Integer> lsPage = new ArrayList<>();
        // for này có chức năng hiển thị list page
        for (int i = 1; i <= totalPages; ++i) {
            lsPage.add(i);
        }



        view.addObject("myTask", myTaskDtoList);
        view.addObject("lsPage", lsPage);
        view.addObject("page", page);
        view.addObject("nowDate", nowDate);

        return view;
    }
}