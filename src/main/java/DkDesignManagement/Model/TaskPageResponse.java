package DkDesignManagement.Model;

import DkDesignManagement.Entity.Task;
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
