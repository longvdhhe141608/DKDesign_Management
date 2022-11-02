package DkDesignManagement.Controller;

import DkDesignManagement.Repository.ProjectDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class LoadAllProjectController {
    @Autowired
    private ProjectDao projectDao;
    
}
