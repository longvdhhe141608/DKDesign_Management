package DkDesignManagement.Service;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import org.springframework.stereotype.Service;

@Service
public interface ProjectService {
    public Project getProject();

    public int addProject(Project project, Account account);
}
