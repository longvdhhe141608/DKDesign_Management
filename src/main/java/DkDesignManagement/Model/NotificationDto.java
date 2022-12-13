package DkDesignManagement.Model;

import DkDesignManagement.Entity.Notification;
import DkDesignManagement.Utils.DateUtils;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NotificationDto {
    private int id;
    private Date date;
    private String detail;
    private int account_id;
    private int project_id;
    private String url;

    //model
    private String dateString;
    private String projectName;

    public static NotificationDto toNotificationDto(Notification notification) {
        return NotificationDto.builder()
                .id(notification.getId())
                .date(notification.getDate())
                .detail(notification.getDetail())
                .account_id(notification.getAccount_id())
                .project_id(notification.getProject_id())
                .url(notification.getUrl())
                .dateString(DateUtils.getDateString(notification.getDate()))
                .build();
    }


}
