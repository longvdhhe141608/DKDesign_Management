package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.Requirement;
import DkDesignManagement.Repository.RequirementDao;
import DkDesignManagement.Service.RequirementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static DkDesignManagement.utils.Constant.*;

@Service
public class RequirementServiceImpl implements RequirementService {

    @Autowired
    private RequirementDao requirementDao;

    @Override
    public List<Requirement> getAll() {
        return requirementDao.getAll();
    }

    @Override
    public Requirement getRequirementById(int requirementId) {
        return requirementDao.getRequirementById(requirementId);
    }

    @Override
    public void updateRequirement(Requirement requirement) {
        requirementDao.updateRequirement(requirement);
    }

    @Override
    public List<Requirement> getRequirementByProjectId(int projectId) {
        return requirementDao.getAllRequirementByProjectID(projectId);
    }

    @Override
    public int checkAndUpdaterRequirementDone(Requirement requirement) {
        int count = requirementDao.countTaskNoDone(requirement.getId());
        //requirement mới tạo
        if (requirement.getStatus() == NEW_REQUIREMENT_STATUS || requirement.getStatus() == DELETE_REQUIREMENT_STATUS) {
            return requirement.getStatus();
        }

        if (count == 0 && requirement.getStatus() != COMPLETE_REQUIREMENT_STATUS) {
            requirement.setStatus(COMPLETE_REQUIREMENT_STATUS);
            requirementDao.updateRequirement(requirement);
        } else if (count != 0 && requirement.getStatus() == COMPLETE_REQUIREMENT_STATUS) {
            requirement.setStatus(PROCESS_REQUIREMENT_STATUS);
            requirementDao.updateRequirement(requirement);
        }

        return requirement.getStatus();
    }

    /**
     * @param id
     * @return
     */
    @Override
    public List<Requirement> getAllRequirementByProjectID(int id) {
        return requirementDao.getAllRequirementByProjectID(id);
    }

    /**
     * @param projectID
     * @param index
     * @return
     */
    @Override
    public List<Requirement> getPaginationRequirementByProjectID(int projectID, int index) {
        return requirementDao.getPaginationRequirementByProjectID(projectID, index);
    }

    /**
     * @param requirement
     * @return
     */
    @Override
    public int insertRequirement(Requirement requirement) {
        return requirementDao.insertRequirement(requirement);
    }

    /**
     * @param requirement
     * @return
     */
    @Override
    public int deleteRequirement(Requirement requirement) {
        return requirementDao.deleteRequirement(requirement);
    }
}
