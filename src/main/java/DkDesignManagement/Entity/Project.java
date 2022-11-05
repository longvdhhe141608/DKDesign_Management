package DkDesignManagement.Entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Project {
    private int id;
    private String project_name;
    private Date start_date;
    private Date closure_date;
    private Date ende_date;
    private int creator;
    private int type;
    private String cusName;
    private String cusAddress;
    private String cusPhone;
    private String detail;
    private int status;
}
