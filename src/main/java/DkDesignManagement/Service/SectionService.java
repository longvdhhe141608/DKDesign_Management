package DkDesignManagement.Service;


import DkDesignManagement.Entity.Section;
import DkDesignManagement.model.SectionDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SectionService {

     public List<SectionDto> getAll(int projectId);

     int addSection(Section section);
     int editSection(String name, int id);
     Section getOneSectionBySectionID(int id);

    List<Section> getAllSectionByProjectID(int id);
}
