package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.ProjectParticipation;
import DkDesignManagement.Repository.ProjectParticipationDao;
import DkDesignManagement.Service.ProjectParticipationService;
import DkDesignManagement.model.MemberActiveDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectParticipationServiceImpl implements ProjectParticipationService {
    @Autowired
    private ProjectParticipationDao projectParticipationDao;

    @Override
    public int addProjectParticipation(ProjectParticipation project) {
        return projectParticipationDao.addProjectParticipation(project);
    }

    @Override
    public List<MemberActiveDto> getAllMember(int projectID, int indexPage, String roleID, String textSearch) {
        return projectParticipationDao.getAllMember(projectID, indexPage, roleID, textSearch);
    }

    @Override
    public int totalAllMember(int projectID, String roleID, String textSearch) {
        return projectParticipationDao.totalAllMember(projectID, roleID, textSearch);
    }
}
