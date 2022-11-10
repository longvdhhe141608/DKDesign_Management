package DkDesignManagement.Entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BigTask {
    private int id;
    private Date start_date;
    private Date deadline;
    private String description;
    private int project_id;
    private int creator;
    private int assigned_to;

}
