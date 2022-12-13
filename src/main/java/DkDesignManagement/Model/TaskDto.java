package DkDesignManagement.Model;

import DkDesignManagement.Entity.Tasks;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TaskDto {

    private int sectionID;
    private String sectionName;
    private List<Tasks> tasksList;
    private List<Tasks> subTasksList;
}
