package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.Requirement;
import DkDesignManagement.Repository.RequirementDao;
import DkDesignManagement.Service.RequirementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RequirementServiceImpl implements RequirementService {

    @Autowired
    RequirementDao requirementDao;

    @Override
    public List<Requirement> getAll() {
        return requirementDao.getAll();
    }
}
