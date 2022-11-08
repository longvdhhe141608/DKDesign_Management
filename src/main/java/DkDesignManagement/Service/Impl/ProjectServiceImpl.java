package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.ProjectParticipation;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Repository.ProjectParticipationDao;
import DkDesignManagement.Service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    ProjectDao projectDao;

    @Autowired
    ProjectParticipationDao projectParticipationDao;

    @Override
    public Project getProject() {
        return null;
    }


    @Override
    public int addProject(Project project, Account account) {
        int idProject =projectDao.addNewProject(project);
        if(idProject == -1 ){
            return -1;
        }
        ProjectParticipation pp = new ProjectParticipation(idProject, account.getId(), account.getRole_id(), true);

        return projectParticipationDao.addProjectParticipation(pp);
    }
}
