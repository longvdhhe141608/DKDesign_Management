package DkDesignManagement.Entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class  Project {
    private int id;
    private String projectName;
    private Date startDate;
    private Date closureDate;
    private Date endDate;
    private int creator;
    private int type;
    private String cusName;
    private String cusAddress;
    private String cusPhone;
    private String detail;
    private int status;
    private Long constructionArea;
    private Long expectedCost;
}
