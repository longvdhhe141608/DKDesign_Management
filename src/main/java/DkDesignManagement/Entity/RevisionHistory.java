package DkDesignManagement.Entity;

import lombok.*;

import java.math.BigInteger;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RevisionHistory {
    private int id;
    private Integer table_id;
    private Integer revision_no;
    private Date revision_date;
    private String revision_detail;
    private String type;
    private Integer project_id;
}
