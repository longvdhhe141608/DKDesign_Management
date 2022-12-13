package DkDesignManagement.Service;


import DkDesignManagement.Entity.Notification;
import DkDesignManagement.model.NotificationDto;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface NotificationService {

    List<NotificationDto> getAllByAccountId(int accountId);

    NotificationDto getNotification(int accountId, String message, String url);

    int addNotification(Notification notification);

}
