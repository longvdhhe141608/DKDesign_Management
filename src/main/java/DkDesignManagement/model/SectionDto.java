package DkDesignManagement.model;


import DkDesignManagement.Entity.Section;
import DkDesignManagement.Entity.Task;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SectionDto {

    private int id;
    private String section_name;
    private String description;
    private int project_id;
    private int creator;
    private List<Task> listTask;


    public static SectionDto toBigTaskDto(Section section) {
        return SectionDto.builder()
                .id(section.getSectionId())
                .section_name(section.getSectionName())
                .description(section.getDescription())
                .project_id(section.getProjectId())
                .creator(section.getCreator())
                .build();
    }
}
