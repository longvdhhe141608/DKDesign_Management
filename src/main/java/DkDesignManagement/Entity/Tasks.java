package DkDesignManagement.Entity;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Tasks {

    private int id;
    private int projectID;
    private int sectionID;
    private int taskID;
    private int creator;
    private int assignedTo;
    private int requirementID;
    private String taskName;
    private Date startingDate;
    private Date deadline;
    private Date endedDate;
    private int numberOfFile;
    private String description;
    private int status;
    private String nameEmployee;
    private String nameRequirement;

}
