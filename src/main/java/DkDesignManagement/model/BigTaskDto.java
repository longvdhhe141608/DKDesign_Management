package DkDesignManagement.model;


import DkDesignManagement.Entity.BigTask;
import DkDesignManagement.Entity.Task;
import lombok.*;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BigTaskDto {

    private int id;
    private Date start_date;
    private Date deadline;
    private String description;
    private int project_id;
    private int creator;
    private int assigned_to;
    private List<Task> listTask;


    public static BigTaskDto toBigTaskDto(BigTask bigTask) {
        return BigTaskDto.builder()
                .id(bigTask.getId())
                .start_date(bigTask.getStart_date())
                .deadline(bigTask.getDeadline())
                .description(bigTask.getDescription())
                .project_id(bigTask.getProject_id())
                .creator(bigTask.getCreator())
                .assigned_to(bigTask.getAssigned_to())
                .build();
    }
}
