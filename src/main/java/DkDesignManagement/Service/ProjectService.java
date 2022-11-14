package DkDesignManagement.Service;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProjectService {
    public List<Project> getProject();

    public int addProject(Project project, Account account);

    public int editProject(Project project);
}
