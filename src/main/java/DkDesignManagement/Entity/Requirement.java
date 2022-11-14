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
    private int project_id;
    private String requirement_name;
    private String requirement_detail;
    private Date requirement_date;
    private int status;

}
