package DkDesignManagement.Service;


import DkDesignManagement.Entity.Requirement;
import DkDesignManagement.model.RequirementPageResponse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RequirementService {

    List<Requirement> getAll();

    Requirement getRequirementById(int requirementId);

    int updateRequirement(Requirement requirement);

    List<Requirement> getRequirementByProjectId(int projectId);

    int checkAndUpdaterRequirementDone(Requirement requirement);

    List<Requirement> getAllRequirementByProjectID(int id);

    RequirementPageResponse getPaginationRequirementByProjectID(int indexPage,int projectID);

    int insertRequirement(Requirement requirement);

    int deleteRequirement(Requirement requirement);
}
