package DkDesignManagement.Service;

import DkDesignManagement.Entity.ProjectParticipation;
import DkDesignManagement.Repository.ProjectParticipationDao;
import DkDesignManagement.model.MemberActiveDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProjectParticipationService {
    @Autowired
    ProjectParticipationDao projectParticipationDao = new ProjectParticipationDao();

    int addProjectParticipation(ProjectParticipation project);

    boolean isMemberExisted(int projectId ,int accountId);

    List<MemberActiveDto> getAllMember(int projectID, int indexPage, String roleID, String textSearch);

    int totalAllMember(int projectID, String roleID, String textSearch);

    void deleteProjectParticipation(int projectID, int accountId);

    ProjectParticipation getProjectParticipants(int projectID,int accountId);

}
