package DkDesignManagement.Entity;

import lombok.*;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Task {
    private int taskId;
    private int projectId;
    private int sectionId;
    private BigInteger taskfId;
    private int creatorId;
    private int assignToId;
    private BigInteger requirementId;
    private String taskName;
    private int taskStatus;
    private Date startDate;
    private Date deadline;
    private Date endDate;
    private String description;
    private int fileNumber;

    public Task(int taskId, int projectId, int sectionId, BigInteger taskfId, int creatorId, int assignToId, BigInteger requirementId, String taskName, int taskStatus, Date startDate, Date deadline, Date endDate, String description,int fileNumber) {
        this.taskId = taskId;
        this.projectId = projectId;
        this.sectionId = sectionId;
        this.taskfId = taskfId;
        this.creatorId = creatorId;
        this.assignToId = assignToId;
        this.requirementId = requirementId;
        this.taskName = taskName;
        this.taskStatus = taskStatus;
        this.startDate = startDate;
        this.deadline = deadline;
        this.endDate = endDate;
        this.description = description;
        this.fileNumber = fileNumber;
    }

    //model response
    //sub task
    private List<Task> listSubTask;
    private String assignToName;

    private String requirementName;

    //project
    private String projectName;

    //section
    private String sectionName;

    //file current
    private int numberFileCurrent;

    //workProgress
    private String workProgress;

    //check icon
    private boolean showFullIcon;

}
