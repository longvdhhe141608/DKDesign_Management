package DkDesignManagement.Entity;

import lombok.*;

import java.util.Date;

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
    private  String creator;
    private String assignTo;
    private String projectName;
}
