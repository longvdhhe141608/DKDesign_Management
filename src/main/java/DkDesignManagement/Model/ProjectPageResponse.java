package DkDesignManagement.Model;

import DkDesignManagement.Entity.Project;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProjectPageResponse {

    private  List<Project> projectList;
    int endPage;

}
