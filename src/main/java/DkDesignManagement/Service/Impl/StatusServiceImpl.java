package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Status;
import DkDesignManagement.Repository.StatusDao;
import DkDesignManagement.Service.StatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatusServiceImpl implements StatusService {
    @Autowired
    private StatusDao statusDao;

    /**
     * @return
     */
    @Override
    public List<Status> getAllStatus() {
        return statusDao.getAllStatus();
    }
}
