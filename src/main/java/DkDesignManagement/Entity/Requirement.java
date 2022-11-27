package DkDesignManagement.Entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Requirement {
    private int id;
    private int projectId;
    private String requirementName;
    private String requirementDetail;
    private Date requirementDate;
    private int status;
    private String statusName;
}
