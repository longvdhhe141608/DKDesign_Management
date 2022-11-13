package DkDesignManagement.Entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Task {
    private int taskId;
    private int projectId;
    private int sectionId;
    private int taskfId;
    private int creatorId;
    private int assignToId;
    private int requirementId;
    private String taskName;
    private int taskStatus;
    private Date startDate;
    private Date deadline;
    private Date endDate;
    private String description;
    private int fileNumber;

}
