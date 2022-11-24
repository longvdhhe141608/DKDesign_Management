package DkDesignManagement.model;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MyTaskDto {

    private int taskID;
    private int subTaskID;
    private int projectID;
    private String projectName;
    private String subTaskName;
    private Date startDate;
    private Date deadline;
    private Date endDate;
    private int status;
    private String statusName;
    private int sectionID;
}
