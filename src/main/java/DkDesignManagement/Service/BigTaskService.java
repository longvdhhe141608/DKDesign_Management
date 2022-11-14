package DkDesignManagement.Service;


import DkDesignManagement.model.SectionDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BigTaskService {

     public List<SectionDto> getAll();
}
