package DkDesignManagement.Service;


import DkDesignManagement.Entity.BigTask;
import DkDesignManagement.model.BigTaskDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BigTaskService {

     public List<BigTaskDto> getAll();
}
