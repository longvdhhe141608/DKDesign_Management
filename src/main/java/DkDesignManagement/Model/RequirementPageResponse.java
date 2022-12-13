package DkDesignManagement.Model;

import DkDesignManagement.Entity.Requirement;
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
