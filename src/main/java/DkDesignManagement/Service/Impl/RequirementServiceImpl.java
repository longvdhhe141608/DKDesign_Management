package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.Requirement;
import DkDesignManagement.Repository.RequirementDao;
import DkDesignManagement.Service.RequirementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static DkDesignManagement.utils.Constant.COMPLETE_REQUIREMENT_STATUS;
import static DkDesignManagement.utils.Constant.PROCESS_REQUIREMENT_STATUS;

@Service
public class RequirementServiceImpl implements RequirementService {

    @Autowired
    RequirementDao requirementDao;

    @Override
    public List<Requirement> getAll() {
        return requirementDao.getAll();
    }

    @Override
    public List<Requirement> getRequirementByProjectId(int projectId){
        return  requirementDao.getAllRequirementByProjectID(projectId);
    }

    @Override
    public int checkAndUpdaterRequirementDone(Requirement requirement) {
        int count = requirementDao.countTaskNoDone(requirement.getId());
        if (count==0 && requirement.getStatus() != COMPLETE_REQUIREMENT_STATUS){
            requirement.setStatus(COMPLETE_REQUIREMENT_STATUS);
            requirementDao.updateRequirement(requirement);
        }else if(count != 0 && requirement.getStatus() == COMPLETE_REQUIREMENT_STATUS){
            requirement.setStatus(PROCESS_REQUIREMENT_STATUS);
            requirementDao.updateRequirement(requirement);
        }

        return requirement.getStatus();
    }
}
