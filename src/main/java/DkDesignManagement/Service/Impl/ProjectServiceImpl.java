package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    ProjectDao projectDao;

    @Override
    public Project getProject() {
        return null;
    }

    @Override
    public int addProject(Project project) {
        return projectDao.addNewProject(project);
    }
}
