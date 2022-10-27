package DkDesignManagement.Entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Project {
    private int idProject;
    private String nameProject;
    private Date startDate;
    private int closureDate;
    private Date endedDate;
    private String creator;
    private int type;
    private String cusName;
    private String cusAddress;
    private String cusPhone;
    private String detail;
    private String status;
}
