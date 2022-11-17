package DkDesignManagement.Entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Comment {
    private int id ;
    private String content ;
    private Date commentTime;
    private int taskId ;
    private int accId;
}
