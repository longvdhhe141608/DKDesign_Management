package DkDesignManagement.model;

import lombok.*;

import java.util.Date;
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ViewCommentDto {
    private int id;
    private String content;
    private Date commentTime;
    private int taskId;
    private int accId;
    private String accountName;
    private String dateCountDown;
    private boolean isPin;
    private String avatarUrl;

}
