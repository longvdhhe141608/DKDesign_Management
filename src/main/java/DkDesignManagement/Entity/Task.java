package DkDesignManagement.Entity;

import lombok.*;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Task {
    private int idPhase;
    private int idTask;
    private int idTask_f;
    private String taskName;
    private boolean taskStatus;
    private Date startDate;
    private Date deadline;
    private Date endDate;
    private String gallery;
    private String description;
    private int creator;
    private int assignTo;

    //model
    //sub task
    private List<Task> ListSubTask;
    private String assignToName;
}
