package DkDesignManagement.model;

import DkDesignManagement.Entity.Task;
import DkDesignManagement.Entity.Tasks;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TaskPageResponse {

    private List<Task> tasksList;
    int endPage;

}
