package DkDesignManagement.Service;


import DkDesignManagement.Entity.Requirement;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RequirementService {

    List<Requirement> getAll();

    List<Requirement> getRequirementByProjectId(int projectId);
}
