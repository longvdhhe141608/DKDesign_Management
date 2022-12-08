package DkDesignManagement.model;

import DkDesignManagement.Entity.Requirement;
import DkDesignManagement.Entity.Task;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RequirementPageResponse {

    private List<Requirement> requirementList;
    int endPage;

}
