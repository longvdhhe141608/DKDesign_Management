package DkDesignManagement.Service;

import DkDesignManagement.Entity.Status;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface StatusService {
    List<Status> getAllStatus();
}
