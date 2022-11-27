package DkDesignManagement.model;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TaskWaitDto {

    private String taskName;
    private String username;
    private Date startDate;
    private Date endDate;
    private int numberOfFile;
    private int status;
    private String statusTask;
    private String description;
}
