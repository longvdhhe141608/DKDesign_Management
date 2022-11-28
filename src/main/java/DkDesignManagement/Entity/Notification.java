package DkDesignManagement.Entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notification {
    private int id;
    private Date date;
    private String detail;
    private int account_id;
    private int project_id;
    private String url;

}
