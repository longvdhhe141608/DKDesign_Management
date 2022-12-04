package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.ProjectParticipation;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Repository.ProjectParticipationDao;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.model.ProjectPageResponse;
import DkDesignManagement.model.TaskPageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    ProjectDao projectDao;

    @Autowired
    ProjectParticipationDao projectParticipationDao;

    @Override
    public List<Project> getProject() {
        return projectDao.getAll();
    }

    @Override
    public Project getProject(int projectId) {
        return projectDao.getProject(projectId);
    }

    @Override
    public int addProject(Project project, Account account) {
        int idProject = projectDao.addNewProject(project);
        if (idProject == -1) {
            return -1;
        }
        ProjectParticipation pp = new ProjectParticipation(idProject, account.getId(), account.getRole_id(), true);

        return projectParticipationDao.addProjectParticipation(pp);
    }

    @Override
    public int editProject(Project project) {
        return projectDao.editProject(project);
    }

    /**
     * @param id
     * @param textSearch
     * @param date
     * @param page
     * @return
     */
    @Override
    public ProjectPageResponse getAllProjectByAcc(int id, String textSearch, String date, int page) {

        int pageNumber = 10;
        int count = projectDao.getSizeProjectByAcc(id, textSearch, date);
        List<Project> listProject = projectDao.getAllProjectByAcc(pageNumber, page, id, textSearch, date, page);
        int endPage = count / pageNumber;
        if (count % pageNumber != 0) {
            endPage++;
        }

        return ProjectPageResponse.builder().endPage(endPage).projectList(listProject).build();

    }
}
