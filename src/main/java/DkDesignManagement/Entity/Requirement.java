package DkDesignManagement.Entity;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Requirement {

    private int id;
    private String requirementName;
    private Date requirementDate;
    private String requirementDetail;
    private int projectID;
    private int status;
}
