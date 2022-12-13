package DkDesignManagement.Service;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Model.ProjectPageResponse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProjectService {
    List<Project> getProject();

    Project getProject(int projectId);

    public int addProject(Project project, Account account);

    public int editProject(Project project);

    ProjectPageResponse getAllProjectByAcc(int id, String textSearch, String date, int page);

    List<Project> getProjectByLeaderAcc(int id);

    List<Project> getProjectByAcc(int id);
}
