package DkDesignManagement.Service;


import DkDesignManagement.Entity.Requirement;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RequirementService {

    List<Requirement> getAll();

    Requirement getRequirementById(int requirementId);

    void updateRequirement(Requirement requirement);

    List<Requirement> getRequirementByProjectId(int projectId);

    int checkAndUpdaterRequirementDone(Requirement requirement);

    List<Requirement> getAllRequirementByProjectID(int id);

    List<Requirement> getPaginationRequirementByProjectID(int projectID, int index);
}
